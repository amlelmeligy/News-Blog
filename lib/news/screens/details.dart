import 'package:flutter/material.dart';
import 'package:project/news/model/articelModel.dart';

class details extends StatefulWidget {
  final ArticalModel articleModel;

  const details({super.key, required this.articleModel});

  @override
  State<details> createState() => _DetailsState();
}

class _DetailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 32, 65, 91),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              child: Text(
                widget.articleModel.title ?? '',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 32, 65, 91),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 121, 117, 104),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.articleModel.image ?? ''),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.articleModel.title ?? '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              widget.articleModel.description ?? '',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              'Published At: ${widget.articleModel.description ?? ''}',
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}
