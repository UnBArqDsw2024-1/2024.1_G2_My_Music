import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

class QrcodeGenerator extends StatefulWidget {
  final String url;
  final String nameMusic;
  const QrcodeGenerator({super.key, required this.url, required this.nameMusic});

  @override
  State<QrcodeGenerator> createState() => _QrcodeGeneratorState();
}

class _QrcodeGeneratorState extends State<QrcodeGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.nameMusic} QR CODE"),
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: QrImageView(
          data: widget.url,
          version: QrVersions.auto,
          embeddedImage: const AssetImage('assets/LogoMyMusic.png'),
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: const Size(85,85)
          ),
          size: 200.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _shareQRImage(), child: Icon(CupertinoIcons.arrowshape_turn_up_right)),
    );
  }

  Future _shareQRImage() async {
    
    final image = await QrPainter(
      data: widget.url,
      version: QrVersions.auto,
      gapless: false,
      errorCorrectionLevel: QrErrorCorrectLevel.L
    ).toImageData(100.0);

    const filename = 'qr_code.png';
    final tempDir =
        await getTemporaryDirectory(); // Get temporary directory to store the generated image
    final file = await File('${tempDir.path}/$filename')
        .create(); // Create a file to store the generated image
    var bytes = image!.buffer.asUint8List(); // Get the image bytes
    await file.writeAsBytes(bytes); // Write the image bytes to the file
    final xFile = XFile.fromData(bytes, mimeType: 'image/png', name: filename);

    await Share.shareXFiles([xFile],
        text: 'QR code for ${widget.url}', subject: 'QR Code');
  }
}
