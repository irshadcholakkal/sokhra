import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../user_module/domain/entity/authentication.dart';
import '../../presentation/core/values/app_constants.dart';
import 'models/error_info.dart';
import 'models/graphql_response.dart';

class GraphQLService {
  late HttpLink _httpLink;
  late AuthLink _authLink;
  late WebSocketLink _webSocketLink;
  late Link _link;
  GraphQLClient? _graphQLClient;
  ValueNotifier? _valueNotifier;

  static GraphQLService? _instance;

  factory GraphQLService() => _instance ?? GraphQLService._internal();

  GraphQLService._internal() {
     _httpLink = HttpLink(AppConstants.httpLinkUrl);
    _authLink = AuthLink(
      getToken: () async => authentication.isAuthenticated
          ? 'Bearer ${authentication.token}'
          : '',
    );

    _webSocketLink = WebSocketLink(
      AppConstants.wsLinkUrl,
      config: SocketClientConfig(
        initialPayload: () async => authentication.isAuthenticated
            ? {"Authorization": "Bearer ${authentication.token}"}
            : null,
      ),
    );

    _link = Link.split(
      (request) => request.isSubscription,
      _webSocketLink,
      _authLink.concat(_httpLink),
    );

    _graphQLClient = GraphQLClient(
      link: _link,
      cache: GraphQLCache(
        partialDataPolicy: PartialDataCachePolicy.accept,
      ),
    );

    _valueNotifier = ValueNotifier(_graphQLClient);

    _instance = this;
  }

  ValueNotifier? get valueNotifier => _valueNotifier;

  GraphQLCache? get cache => _graphQLClient?.cache;

  void resetCache() {
    cache?.store.reset();
  }

  Future<GraphQLResponse> performQuery({
    required QueryOptions queryOptions,
  }) async {
    final result = (await _graphQLClient?.query(queryOptions))!;

    if (result.hasException) {
      return GraphQLResponse(
        error: ErrorInfo.fromJson(
          operationException: result.exception,
        ),
      );
    } else {
      return GraphQLResponse(
        data: result.data,
      );
    }
  }

  Future<GraphQLResponse> performMutation({
    required MutationOptions mutationOptions,
  }) async {
    final result = (await _graphQLClient?.mutate(mutationOptions))!;

    if (result.hasException) {
      return GraphQLResponse(
        error: ErrorInfo.fromJson(
          operationException: result.exception,
        ),
      );
    } else {
      return GraphQLResponse(
        data: result.data,
      );
    }
  }

  Stream<QueryResult>? getSubscriptionStream({
    required SubscriptionOptions options,
  }) {
    return _graphQLClient?.subscribe(options);
  }

  QueryOptions makeQueryOptions({
    required String query,
    Map<String, dynamic> variables = const {},
    bool networkOnly = false,
    CacheRereadPolicy? cacheRereadPolicy,
  }) {
    return QueryOptions(
      document: gql(query),
      variables: variables,
      fetchPolicy:
          networkOnly ? FetchPolicy.networkOnly : FetchPolicy.cacheFirst,
      cacheRereadPolicy: cacheRereadPolicy,
    );
  }

  MutationOptions makeMutationOptions({
    required String query,
    required Map<String, dynamic> variables,
    Function(GraphQLDataProxy, QueryResult?)? onUpdate,
    Function(OperationException?)? onError,
  }) {
    return MutationOptions(
      document: gql(query),
      variables: variables,
      update: onUpdate,
      onError: onError,
    );
  }

  static SubscriptionOptions makeSubscriptionOptions({
    required String operationName,
    required String query,
    required Map<String, dynamic> variables,
  }) {
    return SubscriptionOptions(
      operationName: operationName,
      document: gql(query),
      variables: variables,
    );
  }
}

final graphQLService = GraphQLService();
