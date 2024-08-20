import 'package:flutter/material.dart';
import 'package:project/news/model/articelModel.dart';
import 'package:project/news/screens/categoryModel.dart';
import 'package:project/news/screens/details.dart';
import 'package:project/news/service/newsService.dart';

class horizontalscroll extends StatefulWidget {
  horizontalscroll({super.key});

  @override
  State<horizontalscroll> createState() => _horizontalscrollState();
}

class _horizontalscrollState extends State<horizontalscroll> {
  List categories = [
    {"img": "assets/business.avif", "title": "business"},
    {
      "img": "assets/entertaiment.avif",
      "title": "environment"
    }, // التايتل عباره عن تايتل وفي نفس الوقت الجزء اللي محتاجينه علشان نعمل الريكوست
    {"img": "assets/general.avif", "title": "world"},
    {"img": "assets/health.avif", "title": "health"},
    {"img": "assets/science.avif", "title": "science"},
  ];
  // List<String> categoryName = [
  //   "business",
  //   "environment",
  //   "world",
  //   "health",
  //   "science",
  // ];

  late final categoryModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, i) {
            return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return categoryModel(category: categories[i]["title"]);
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Container(
                    width: 320,
                    height: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 124, 121, 110),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(categories[i]["img"]))),
                    child: Center(
                      child: Text(
                        categories[i]["title"],
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ));
          }),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class verticalscroll extends StatefulWidget {
  verticalscroll({super.key, required this.category});

  final String category;
  @override
  State<verticalscroll> createState() => _verticalscrollState();
}

class _verticalscrollState extends State<verticalscroll> {
  List<ArticalModel> results = [];
  var future;
  @override
  void initState() {
    super.initState();
    future = newsService().getNews(
      category: widget.category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticalModel>>(
        future: future,
        builder: (context, snapshot) {
          results = snapshot.data ?? [];
          if (snapshot.hasData) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: results.length,
                  itemBuilder: (context, i) {
                    final articalModel = results[i];
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => details(
                                  articleModel: articalModel,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 121, 117, 104),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(articalModel.image ?? ""),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          articalModel.title ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          articalModel.description ?? "",
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[500]),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
              child: Text('Oops there was an error'),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////