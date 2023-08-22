import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
// import 'package:share_plus/share_plus.dart';

class SharePage extends StatefulWidget {
  const SharePage({super.key});

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Get.back(),
                // color: secondaryColor,
              ),
            ),
            Lottie.asset(
              'images/share.json',
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            Wrap(
              children: [
                Text(
                  'Share the fun. Invite a friend!',
                  textAlign: TextAlign.center,
                  textScaleFactor: 3,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                  'Everyone deserves loyal friends, right? So invite your friends and have fun learning together!',
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                // shareAppLink();
              },
              child: Center(child: Text('Share Invite Link')),
            ),
          ],
        ),
      ),
    );
  }
}

// void shareAppLink() {
//   Share.share('Check out this awesome app: https://doglovers.com',
//       subject: 'Look what I found!');
// }
