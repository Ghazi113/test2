//library
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Package
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

//Screens
import '../Theme/main_theme.dart';
import '../User/UserData.dart';
import '../User/UserPref.dart';
import '../Widgets/ProfileWidgets/AppBarWidget.dart';
import '../Widgets/ProfileWidgets/BottomProfileWidget.dart';
import '../Widgets/ProfileWidgets/Profile widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? image;
  Future pickImage() async{
    try{
      final image=await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image==null) return;
      final imageTemp=image.path;
      setState(() {
        //this.image=imageTemp;
      });

    } on PlatformException catch(e){
      print("Failed to pick image $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    /* Dark Theme Text causing Error!
     final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';
     */
    const user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {
              //image != null ?image.file(image!):user.imagePath;
              if (image!=null){
                //imagePath: imageTemp;
              }
            },
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
