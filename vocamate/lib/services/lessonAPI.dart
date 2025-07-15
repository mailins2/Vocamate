import 'package:vocamate/models/lessonsModel.dart';
import 'package:http/http.dart' as http;
class LessonsAPIService {
  Future<List<Lessons>?> getLessons() async{
    var client = http.Client();
    var uri = Uri.parse('https://686b277be559eba908719b72.mockapi.io/api/vocamate/lessons');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return lessonsFromJson(json);
    }
  }

}