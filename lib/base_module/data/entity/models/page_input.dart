import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_input.freezed.dart';
part 'page_input.g.dart';

@Freezed()
class PageInput with _$PageInput {
  @JsonSerializable(explicitToJson: true)
  const factory PageInput({
    @Default(0) final int limit,
    @Default(0) final int skip,
  }) = _PageInput;

  factory PageInput.fromJson(Map<String, dynamic> json) =>
      _$PageInputFromJson(json);
}
