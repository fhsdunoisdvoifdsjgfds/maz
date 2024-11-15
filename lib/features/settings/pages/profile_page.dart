import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final profile = Profile(
      name: con1.text,
      email: con2.text,
      username: con3.text,
      image: con4.text,
    );
    await saveProfile(profile);
    if (mounted) context.pop();
  }

  Future<void> saveProfile(Profile profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', profile.name);
    await prefs.setString('email', profile.email);
    await prefs.setString('username', profile.username);
    await prefs.setString('image', profile.image);
  }

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    con1.text = prefs.getString('name') ?? '';
    con2.text = prefs.getString('email') ?? '';
    con3.text = prefs.getString('username') ?? '';
    con4.text = prefs.getString('image') ?? '';
    setState(() {});
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
                const SizedBox(height: 55),
                PButton(
                  title: 'Save',
                  onPressed: onSave,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
