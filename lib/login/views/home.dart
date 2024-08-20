import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/login/widget/textandbutton.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

final List<String> images = [
  "assets/images/1.jpg",
  "assets/images/2.jpg",
  "assets/images/3.jpg",
];

late List<Widget> _pages;

int _activePage = 0;
final PageController _pageController =
    PageController(initialPage: 1, viewportFraction: 0.9);

class _homeState extends State<home> {
  @override
  void initState() {
    super.initState();
    _pages = List.generate(
      images.length,
      (index) => imageplaceholder(
        images: images[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [
            SizedBox(
              height: 550,
              width: double.infinity,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    _activePage = value;
                  });
                },
                physics: BouncingScrollPhysics(),
                itemCount: images.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    child: _pages[index],
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Positioned(
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      _pages.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: InkWell(
                              onTap: () {
                                _pageController.animateToPage(
                                  index,
                                  duration: Duration(microseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: _activePage == index
                                    ? Color.fromARGB(255, 32, 65, 91)
                                    : Colors.grey,
                              ),
                            ),
                          )),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Welcome to News Blog",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Get the lastest news from reliable sources.",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 102, 97, 97),
              fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            defaultButton(
              textcolor: Colors.white,
              background: Color.fromARGB(255, 32, 65, 91),
              width: 150,
              onpressed: () {},
              text: "Skip",
            ),
            defaultButton(
              textcolor: Colors.white,
              background: Color.fromARGB(255, 32, 65, 91),
              width: 150,
              onpressed: () {
                Navigator.pushNamed(context, "login");
              },
              text: "Next",
            ),
          ],
        )
      ],
    ));
  }
}

class imageplaceholder extends StatelessWidget {
  final String? images;
  const imageplaceholder({super.key, this.images});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      images!,
      fit: BoxFit.cover,
    );
  }
}
