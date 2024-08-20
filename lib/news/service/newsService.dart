import 'package:dio/dio.dart';
import 'package:project/news/model/articelModel.dart';

class newsService {
  final dio = Dio();

  newsService();
  Future<List<ArticalModel>> getNews({
    required String category,
  }) async {
    try {
      Response response = await dio.get(
          'https://newsdata.io/api/1/latest?apikey=pub_4965396eb08bc78a46d8bc0d5a2525dfbaf20&language=en&category=$category');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> results = jsonData['results'];
      List<ArticalModel> articlesList =
          []; // عملت ليست فاضيه علشان انقل البيانات اللي في الماب ليها
      for (var result in results) {
        ArticalModel articleModel = ArticalModel(
            image: result['image_url'],
            title: result['title'],
            description: result['description']);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
//
