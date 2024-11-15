import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/config/my_colors.dart';
import '../../../core/models/profile.dart';
import '../../../core/config/utilities.dart';
import '../../../core/widgets/p_button.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/image_pick_widget.dart';
import '../../../core/widgets/profile_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final con1 = TextEditingController();
  final con2 = TextEditingController();
  final con3 = TextEditingController();
  final con4 = TextEditingController();

  ImagePicker picker = ImagePicker();
  XFile image = XFile('');

  void onPickImg() async {
    image = await pickImg();
    con4.text = image.path;
    setState(() {});
  }

  Future<XFile> pickImg() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return XFile('');
      return image;
    } catch (e) {
      return XFile('');
    }
  }

  void onSave() async {
    await saveProfile(
      Profile(
        name: con1.text,
        email: con2.text,
        username: con3.text,
        image: con4.text,
      ),
    ).then((_) {
      if (mounted) context.pop();
    });
  }

  @override
  void initState() {
    super.initState();
    con1.text = profile.name;
    con2.text = profile.email;
    con3.text = profile.username;
    con4.text = profile.image;
  }

  @override
  void dispose() {
    con1.dispose();
    con2.dispose();
    con3.dispose();
    con4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Appbar(title: 'Profile'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 15),
                Center(
                  child: Text(
                    'Id: $userId',
                    style: const TextStyle(
                      color: MyColors.main,
                      fontSize: 24,
                      fontFamily: MyFonts.ns400,
                    ),
                  ),
                ),
                const SizedBox(height: 46),
                ImagePickWidget(
                  imagePath: con4.text,
                  onPressed: onPickImg,
                ),
                const SizedBox(height: 46),
                const Center(
                  child: Text(
                    'Name',
                    style: TextStyle(
                      color: MyColors.main,
                      fontSize: 24,
                      fontFamily: MyFonts.ns400,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ProfileField(
                  controller: con1,
                  hintText: 'Name',
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'E-mail',
                    style: TextStyle(
                      color: MyColors.main,
                      fontSize: 24,
                      fontFamily: MyFonts.ns400,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ProfileField(
                  controller: con2,
                  hintText: 'E-mail',
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'Username',
                    style: TextStyle(
                      color: MyColors.main,
                      fontSize: 24,
                      fontFamily: MyFonts.ns400,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ProfileField(
                  controller: con3,
                  hintText: 'Username',
                ),
                const SizedBox(height: 55),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
