import 'package:vocamate/models/lessonsModel.dart';
import 'package:http/http.dart' as http;
import 'package:vocamate/models/vocabularyModel.dart';
class LessonsAPIService {
  Future<List<Lessons>?> getLessons() async{
    try{
      var client = http.Client();
      var uri = Uri.parse('https://686b277be559eba908719b72.mockapi.io/api/vocamate/lessons');
      var response = await client.get(uri);
      if(response.statusCode == 200){
        var json = response.body;
        return lessonsFromJson(json);
      }
      else{
        print('Failed to load lessons: ${response.statusCode}');
        return null;
      }
    }
    catch(e){
      print("Error to fetch Lessons: $e");
    }
  }

  Future<List<Vocabulary>?> getVocabulary()async{
    try{
      var client = http.Client();
      var uri = Uri.parse('https://686b277be559eba908719b72.mockapi.io/api/vocamate/vocabularies');
      var response = await client.get(uri);
      if(response.statusCode == 200){
        var json = response.body;
        return vocabularyFromJson(json);
      }
      else{
        print("Failied to load vocabularies: ${response.statusCode}");
        return null;
      }
    }
    catch(e){
      print("Error to fetch vocabularies data: $e");
      return null;
    }
  }
}