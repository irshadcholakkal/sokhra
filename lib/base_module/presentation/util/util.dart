import 'dart:async';
import 'dart:convert';
import 'dart:io' if (kIsWeb) 'dart.html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entity/translation.dart';

class Util {
  Future<void> launchUrl(String? url) async {
    final _url = url?.trim() ?? "";

    if (_url.isNotEmpty && await canLaunch(_url)) {
      await launch(_url);
    }
  }

  Future<void> shareText({
    required BuildContext context,
    required String? content,
    String? subject,
  }) async {
    final _content = content?.trim() ?? "";

    if (_content.isNotEmpty) {
      final size = MediaQuery.of(context).size;

      await Share.share(
        _content,
        subject: subject ?? "",
        sharePositionOrigin: Rect.fromLTWH(0, 0, size.width, size.height / 2),
      );
    }
  }

  bool get isPhone {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550;
  }

  List<T> processList<T>(List<T>? list) {
    return list?.fold([], (result, item) {
          if (item != null) {
            result?.add(item);
          }

          return result;
        }) ??
        [];
  }

  MediaType? contentType(File file) {
    try {
      final mimeType = lookupMimeType(file.path);
      return mimeType != null ? MediaType.parse(mimeType) : null;
    } catch (e) {
      debugPrint("Util.contentType:Exception:$e");
    }

    return null;
  }

  FutureOr<MultipartFile?> multipartFileFrom(File file) async {
    try {
      if (kIsWeb) {
        return MultipartFile.fromBytes(
          '',
          await file.readAsBytes(),
          contentType: contentType(file),
          filename: basename(file.path),
        );
      } else {
        return MultipartFile(
          '',
          file.openRead(),
          await file.length(),
          contentType: contentType(file),
          filename: basename(file.path),
        );
      }
    } catch (e) {
      debugPrint("Util.multipartFileFrom:Exception:$e");
    }

    return null;
  }
  Future<XFile> compressedImage(
      XFile originalFile, {
        double maxSize = 512,
        int minHeight = 720,
        int minWidth = 1280,
        int quality = 75,
        String fileNameSuffix = '',
      }) async {
    try {
      final originalFileSize = (await originalFile.length()) / 1024;
      final originalFilePath = originalFile.path;

      debugPrint(
        "ImagePickerDialog:compressedImage:original_image_size:$originalFileSize",
      );

      if (originalFileSize > maxSize) {
        final lastIndex = originalFilePath.lastIndexOf(RegExp(r'.jp'));
        final splitted = originalFilePath.substring(0, lastIndex);
        final outPath =
            "${splitted}_out$fileNameSuffix${originalFilePath.substring(lastIndex)}";

        final compressedFile = await FlutterImageCompress.compressAndGetFile(
          originalFilePath,
          outPath,
          minHeight: minHeight,
          minWidth: minWidth,
          quality: quality,
        );

        if (compressedFile != null) {
          final compressedFileSize = (await compressedFile.length()) / 1024;

          debugPrint(
            "ImagePickerDialog:compressedImage:compressed_image_size:$compressedFileSize",
          );

          return compressedFile;
        }
      }
    } catch (e) {
      debugPrint(
        "ImagePickerDialog:compressedImage:Exception:$e",
      );
    }

    return originalFile;
  }
  Future<XFile> compressedThumbnailImage(
      XFile originalFile, {
        double maxSize = 50,
        int minHeight = 320,
        int minWidth = 320,
        int quality = 75,
      }) {
    return compressedImage(
      originalFile,
      maxSize: maxSize,
      minHeight: minHeight,
      minWidth: minWidth,
      quality: quality,
      fileNameSuffix: '_thumb',
    );
  }
  Future<String?> getBase64(
      XFile file, {
        bool compress = true,
        bool thumbnail = false,
      }) async {
    try {
      if (thumbnail == true) {
        file = await compressedThumbnailImage(file);
      } else if (compress == true) {
        file = await compressedImage(file);
      }

      final imageBytes = await file.readAsBytes();
      return base64Encode(imageBytes.toList());
    } catch (e) {
      debugPrint("Util.base64From:exception:$e");
      return null;
    }
  }

  String getAvailabletext({
    String? englishText,
    String? arabicText,
  }) {
    return translation.isArabic
        ? arabicText ?? englishText ?? ""
        : englishText ?? arabicText ?? "";
  }
}

final util = Util();
