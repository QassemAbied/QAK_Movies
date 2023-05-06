import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class PageViewItem {
  final String image;
  final String SubTitle;
  final String OverTitle;

  PageViewItem(
      {required this.image, required this.SubTitle, required this.OverTitle});
}

List PageViewList = [
  PageViewItem(
    image: 'assets/image/clapperboard.png',
    SubTitle: 'All Movies',
    OverTitle:
        "You can find all the movies in our app with ease, with an easy and convenient interface for all users You can find all the movies in our app with ease, with an easy and convenient interface for all users ",
  ),
  PageViewItem(
    image: 'assets/image/camera.png',
    SubTitle: 'Easy Search',
    OverTitle:
        "You can find all the movies in our app with ease, with an easy and convenient interface for all users  You can find all the movies in our app with ease, with an easy and convenient interface for all users",
  ),
  PageViewItem(
    image: 'assets/image/roll-film.png',
    SubTitle: 'Favorites & watchList',
    OverTitle:
        "You can find all the movies in our app with ease, with an easy and convenient interface for all users  You can find all the movies in our app with ease, with an easy and convenient interface for all users",
  ),
];

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final Controller = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: PageView.builder(
          controller: Controller,
          onPageChanged: (int index) {
            if (index == PageViewList.length - 1) {
              setState(() {
                isLast = true;
              });
            } else {
              setState(() {
                isLast = false;
              });
            }
          },
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: PageViewList.length,
          itemBuilder: (context, index) {
            final Size1 = MediaQuery.of(context).size.height;
            final Size = MediaQuery.of(context).size.height / 2;

            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: Size,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(50)),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(
                        PageViewList[index].image,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          PageViewList[index].SubTitle,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                blurRadius: 0.2,
                                color: Colors.blueGrey.shade400,
                                offset: Offset.fromDirection(100),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          PageViewList[index].OverTitle,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                blurRadius: 0.2,
                                color: Colors.blueGrey.shade400,
                                offset: Offset.fromDirection(100),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        SmoothPageIndicator(
                          controller: Controller,
                          count: 3,
                          axisDirection: Axis.horizontal,
                          effect: WormEffect(
                              spacing: 5.0,
                              radius: 9.0,
                              dotWidth: 20.0,
                              dotHeight: 16.0,
                              paintStyle: PaintingStyle.stroke,
                              strokeWidth: 1.5,
                              dotColor: Colors.grey,
                              activeDotColor: Colors.indigo),
                          onDotClicked: (value) {
                            setState(() {
                              value = Controller.nextPage(
                                  duration: Duration(milliseconds: 750),
                                  curve: Curves.fastLinearToSlowEaseIn) as int;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        MaterialButton(
                          textColor: Colors.indigo,
                          color: Colors.grey,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text('Skip'),
                        ),
                        Spacer(),
                        FloatingActionButton(
                          foregroundColor: Colors.indigo,
                          onPressed: () {
                            if (isLast == true) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            } else {
                              Controller.nextPage(
                                  duration: Duration(milliseconds: 750),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            }
                          },
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
