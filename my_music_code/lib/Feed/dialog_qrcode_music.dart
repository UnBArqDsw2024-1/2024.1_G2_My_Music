import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/spaced_column.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Models/music_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

class QrcodeGenerator extends StatefulWidget {
  const QrcodeGenerator({super.key, required this.music});
  final Music music;
  @override
  State<QrcodeGenerator> createState() => _QrcodeGeneratorState();
}

class _QrcodeGeneratorState extends State<QrcodeGenerator> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: backgroundColor,
        title: Text(
          "${widget.music.name} • QRCODE",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        content: SpacedColumn(
          spacing: 10,
          children: [
            Container(
              width: 230,
              height: 230,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: QrImageView(
                  padding: EdgeInsets.all(5),
                  data: widget.music.link!,
                  version: QrVersions.auto,
                  embeddedImage: const AssetImage('assets/LogoMyMusic.png'),
                  embeddedImageStyle: QrEmbeddedImageStyle(size: const Size(85, 85)),
                  size: 200.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: GestureDetector(
                onTap: () async {
                  await Share.share("Ouça essa música:\n${widget.music.link} \nVocê vai amar!");
                              
                },
                child: Container(
                  height: responsiveFigmaHeight(50),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: primaryColor,
                  ),
                  alignment: Alignment.center,
                  child: ResponsiveText(
                    text: "Compartilhar link",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Future shareQRImage() async {
    final image = await QrPainter(
            data: widget.music.link!,
            version: QrVersions.auto,
            gapless: false,
            errorCorrectionLevel: QrErrorCorrectLevel.L)
        .toImageData(100.0);

    const filename = 'qr_code.png';
    final tempDir = await getTemporaryDirectory(); // Get temporary directory to store the generated image
    final file = await File('${tempDir.path}/$filename').create(); // Create a file to store the generated image
    var bytes = image!.buffer.asUint8List(); // Get the image bytes
    await file.writeAsBytes(bytes); // Write the image bytes to the file
    final xFile = XFile.fromData(bytes, mimeType: 'image/png', name: filename);

    await Share.shareXFiles([xFile], text: 'QR code for ${widget.music.link!}', subject: 'QR Code');
  }
}
