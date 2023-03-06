import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class ShareFiles {
  static void shareImageUrl(String imageUrl) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    Uri url = Uri.parse(imageUrl);
    http.Response response = await http.get(url);

    String fileName = url.path.split("/").last;    
    File file = new File('$tempPath' + fileName);
    await file.writeAsBytes(response.bodyBytes);

    List<String> files = List.filled(1, file.path);    

    Share.shareFiles(files);
  }
}