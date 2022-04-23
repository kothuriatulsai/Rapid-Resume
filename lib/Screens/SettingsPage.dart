import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:medizine2/Screens/Userprofile.dart';
import 'package:medizine2/globalConst.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget settingButton({title, icon}) {
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.grey[200]),
            animationDuration: Duration(milliseconds: 100)),
        child: Padding(
          padding: EdgeInsets.only(left: 0),
          child: Container(
              width: MediaQuery.of(context).size.width - 55,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: secondaryColor, size: 25),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(title,
                            style: GoogleFonts.roboto(
                                fontSize: 17,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, size: 17, color: Colors.grey),
                ],
              )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 220, 0),
                child: Text(
                  'Settings',
                  style: GoogleFonts.ptSans(
                      fontSize: 32, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(height: 5), //spacing
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => Userprofile()));
              },
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.grey[200]),
                  animationDuration: Duration(milliseconds: 100)),
              child: Container(
                  width: MediaQuery.of(context).size.width - 55,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 32,
                            //temporary avatar image
                            backgroundImage: AssetImage(
                                'lib/assets/hireme.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Jonathan',
                                    style: GoogleFonts.roboto(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87)),
                                Text('Edit Profile',
                                    style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black87))
                              ],
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 17, color: Colors.grey)
                    ],
                  )),
            ),
            //spacing
            //extra settings can be added with this widget class
            settingButton(icon: Icons.palette, title: 'Theme'),
            settingButton(icon: Icons.notifications, title: 'Notifications'),
            settingButton(icon: Icons.admin_panel_settings, title: 'Privacy'),
            settingButton(icon: Icons.menu_book, title: 'About Us'),
            settingButton(icon: Icons.support_agent, title: 'Help'),
            SizedBox(height: 10), //spacing
            //logout button may change
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(heavyprimary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                    backgroundColor: MaterialStateProperty.all(secondaryColor)),
                child: Container(
                    width: MediaQuery.of(context).size.width - 90,
                    height: 30,
                    child: Center(
                        child: Text('Log Out',
                            style: GoogleFonts.roboto(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w400)))))
          ],
        ));
  }
}
