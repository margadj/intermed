import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:intermed/screens/help.dart';
import 'package:intermed/screens/info.dart';
import 'package:intermed/screens/time.dart';
import 'package:intermed/screens/vaccine.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(scaffoldBackgroundColor: Color(0xfff0f8fe)),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final homeImages = [
    "img/intermed.jpeg",
    "img/intermed2.jpeg",
    "img/intermed3.jpeg",
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  // do something
                },
              ),
              title: const Text(
                'Интермед эмнэлэг',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: const Color(0xfff0f8fe),
              elevation: 0,
            ),
            body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(height: 25),
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                        height: 300,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 8),
                        autoPlayAnimationDuration: Duration(milliseconds: 1500),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() => activeIndex = index);
                        }),
                    itemCount: homeImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final images = homeImages[index];
                      return buildImage(images, index);
                    },
                  ),
                  const SizedBox(height: 10),
                  buildIndicator(),
                ],
              )),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.access_time_filled,
                            color: Colors.black, size: 50),
                        Text('Цаг авалт', style: TextStyle(color: Colors.black))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        fixedSize: Size(150, 140),
                        primary: Colors.white,
                        elevation: 1,
                        shadowColor: Colors.grey),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Time()),
                      ); // Navigate to second route when tapped.
                    },
                  ),
                  ElevatedButton(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.favorite, color: Colors.black, size: 50),
                        Text('Миний мэдээлэл',
                            style: TextStyle(color: Colors.black))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        fixedSize: Size(150, 140),
                        primary: Colors.white,
                        elevation: 1,
                        shadowColor: Colors.grey),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Info()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.masks_rounded,
                            color: Colors.black, size: 50),
                        Text('Вакцин хийлгэх байршил',
                            style: TextStyle(color: Colors.black))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        fixedSize: Size(150, 140),
                        primary: Colors.white,
                        elevation: 1,
                        shadowColor: Colors.grey),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Vaccine()),
                      ); // Navigate to second route when tapped.
                    },
                  ),
                  ElevatedButton(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.add_box, color: Colors.black, size: 50),
                        Text('Тусламж үйлчилгээ',
                            style: TextStyle(color: Colors.black))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        fixedSize: Size(150, 140),
                        primary: Colors.white,
                        elevation: 1,
                        shadowColor: Colors.grey),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Help()),
                      ); // Navigate to second route when tapped.
                    },
                  ),
                ],
              )
            ])));
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: homeImages.length,
        effect: ScrollingDotsEffect(),
      );

  Widget buildImage(String image, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.black,
        child: Image.asset(
          image,
          width: 400,
          fit: BoxFit.cover,
        ),
      );
}
