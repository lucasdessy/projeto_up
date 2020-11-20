import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_up/utils/up_colors.dart';

class ChooseSourceBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPopupSurface(
      isSurfacePainted: true,
      child: Container(
        height: 175,
        width: double.infinity,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom, top: 30),
        child: Column(
          children: [
            Text(
              "Escolher da",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: UpColors.wireframe_darkest,
              ),
              title: Text("Câmera"),
              onTap: () {
                Get.back(result: ImageSource.camera);
              },
            ),
            SizedBox(
              height: 7,
            ),
            ListTile(
              leading: Icon(
                Icons.photo,
                color: UpColors.wireframe_darkest,
              ),
              title: Text("Galeria"),
              onTap: () {
                Get.back(result: ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}
