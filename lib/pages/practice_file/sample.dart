import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              delegate: WhatsappAppbar(MediaQuery.of(context).size.width),
              pinned: true),
          SliverToBoxAdapter(
            child: Column(
              children: [ProfileIconButtons()],
            ),
          ),
          const WhatsappProfileBody(),
        ],
      ),
    ));
  }
}

class WhatsappAppbar extends SliverPersistentHeaderDelegate {
  double screenWidth;
  Tween<double>? profilePicTranslateTween;

  WhatsappAppbar(this.screenWidth) {
    profilePicTranslateTween =
        Tween<double>(begin: screenWidth / 2 - 45 - 40 + 15, end: 40.0);
  }

  static final appBarColorTween = ColorTween(
      begin: Colors.white, end: const Color.fromARGB(255, 4, 94, 84));

  static final phoneNumberTranslateTween = Tween<double>(begin: 20.0, end: 0.0);

  static final phoneNumberFontSizeTween = Tween<double>(begin: 20.0, end: 18.0);

  static final profileImageRadiusTween = Tween<double>(begin: 3.5, end: 1.0);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    final relativeScroll = min(shrinkOffset, 45) / 45;
    final relativeScroll70px = min(shrinkOffset, 70) / 70;
    return Container(
      color: appBarColorTween.transform(relativeScroll),
      child: Stack(children: [
        Stack(
          children: [
            Stack(
              children: [
                // Positioned(
                //   left: 0,
                //   child: IconButton(
                //     onPressed: () {},
                //     icon: const Icon(Icons.arrow_back, size: 25),
                //     color: appbarIconColorTween.transform(relativeScroll),
                //   ),
                // ),
                // Positioned(
                //   right: 0,
                //   child: IconButton(
                //     onPressed: () {},
                //     icon: const Icon(Icons.more_vert, size: 25),
                //     color: appbarIconColorTween.transform(relativeScroll),
                //   ),
                // ),
                Positioned(
                  top: 15,
                  left: 90,
                  child: displayPhoneNumber(relativeScroll70px),
                ),
                Positioned(
                    top: 5,
                    left:
                        profilePicTranslateTween!.transform(relativeScroll70px),
                    child: displayProfilePicture(relativeScroll70px)),
              ],
            ),
          ],
        ),
      ]),
    );
  }

  Widget displayProfilePicture(double relativeFullScrollOffset) {
    return Transform(
      transform: Matrix4.identity()
        ..scale(
          profileImageRadiusTween.transform(relativeFullScrollOffset),
        ),
      child: CircleAvatar(
        radius: 18.r,
        backgroundImage: const NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEgzwHNJhsADqquO7m7NFcXLbZdFZ2gM73x8I82vhyhg&s"),
      ),
    );
  }

  Widget displayPhoneNumber(double relativeFullScrollOffset) {
    if (relativeFullScrollOffset >= 0.8) {
      return Transform(
        transform: Matrix4.identity()
          ..translate(
            -phoneNumberTranslateTween
                .transform((relativeFullScrollOffset - 0.8) * 5),
            0.0,
          ),
        child: Text(
          "Vaibhav",
          style: TextStyle(
            fontSize: phoneNumberFontSizeTween
                .transform((relativeFullScrollOffset - 0.8) * 5),
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 120;

  @override
  // TODO: implement minExtent
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}

class WhatsappProfileBody extends StatelessWidget {
  const WhatsappProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(const [
      SizedBox(height: 20),
      ListTile(
        title: Text("Custom Notifications"),
        leading: Icon(Icons.notification_add),
      ),
      ListTile(
        title: Text("Disappearing messages"),
        leading: Icon(Icons.message),
      ),
      ListTile(
        title: Text("Mute Notifications"),
        leading: Icon(Icons.mic_off),
      ),
      ListTile(
        title: Text("Media visibility"),
        leading: Icon(Icons.save),
      ),
      // to fill up the rest of the space to enable scrolling
      SizedBox(
        height: 550,
      ),
    ]));
  }
}

class ProfileIconButtons extends StatelessWidget {
  const ProfileIconButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: const [
            Icon(
              Icons.call,
              size: 30,
              color: Color.fromARGB(255, 8, 141, 125),
            ),
            SizedBox(height: 5),
            Text(
              "Call",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 8, 141, 125),
              ),
            )
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: const [
            Icon(
              Icons.video_call,
              size: 30,
              color: Color.fromARGB(255, 8, 141, 125),
            ),
            SizedBox(height: 5),
            Text(
              "Video",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 8, 141, 125),
              ),
            )
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: const [
            Icon(
              Icons.save,
              size: 30,
              color: Color.fromARGB(255, 8, 141, 125),
            ),
            SizedBox(height: 5),
            Text(
              "Save",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 8, 141, 125),
              ),
            )
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: const [
            Icon(
              Icons.search,
              size: 30,
              color: Color.fromARGB(255, 8, 141, 125),
            ),
            SizedBox(height: 5),
            Text(
              "Search",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 8, 141, 125),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class PhoneAndName extends StatelessWidget {
  const PhoneAndName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 35),
        Text(
          "+3 3333333333",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "~Walter Hartwell White",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
