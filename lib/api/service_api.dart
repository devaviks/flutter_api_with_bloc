import 'package:flutter_api_with_bloc/model/album_model.dart';
import 'package:http/http.dart' as http;

abstract class ServiceApi{
  Future<List<Albums>>getAlbums();

}

class AlbumService extends ServiceApi{
String BASE_URL="https://jsonplaceholder.typicode.com";
String ALBUMS="/albums";
  @override
  Future<List<Albums>> getAlbums() async{

    try {
      var uri = Uri.parse("https://jsonplaceholder.typicode.com/albums");
      var response = await http.get(
          uri, headers: {"ContentType": "application/json"});
      var albumslist = albumsFromJson(response.body);

      return albumslist;
    } catch(e){

      return List<Albums>.empty();
    }
  }

}