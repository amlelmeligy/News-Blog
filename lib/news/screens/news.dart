import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/login/views/login.dart';
import 'package:project/news/components/drawer.dart';
import '../components/components.dart';

class news extends StatelessWidget {
  news({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Color.fromARGB(255, 32, 65, 91),
              width: double.infinity,
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 120,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/aml.jpg",
                        ),
                      ),
                    ),
                  ),
                  Text(
                    email!.split('@')[0].split(' ')[0],
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    email!,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
            ),
            drawerComponent(
              icon: Icons.home,
              name: "Home",
              onTap: () {
                Navigator.pop(context);
              },
            ),
            drawerComponent(
              icon: Icons.newspaper_rounded,
              name: 'Create New Article',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            drawerComponent(
              icon: Icons.book,
              name: "Bookmark",
              onTap: () {
                Navigator.pop(context);
              },
            ),
            drawerComponent(
              icon: Icons.card_membership_rounded,
              name: "Membership",
              onTap: () {
                Navigator.pop(context);
              },
            ),
            drawerComponent(
              icon: Icons.info,
              name: "About app",
              onTap: () {
                Navigator.pop(context);
              },
            ),
            drawerComponent(
              icon: Icons.login_outlined,
              name: 'Log Out',
              onTap: () {
                Navigator.pushNamed(context, "login");
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 32, 65, 91),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "Cloud",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      // body: ListView(
      //   children: [
      //     horizontalscroll(),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     verticalscroll()
      //   ],
      // )
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: horizontalscroll(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lastest News",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Show More",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 32, 65, 91),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: verticalscroll(
              category: "top",
            ),
          )
        ],
      ),
    );
  }
}
