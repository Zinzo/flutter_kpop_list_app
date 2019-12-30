import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Photo {
  // final int albumId;
  // final int id;
  // final String title;
  // final String url;
  final String thumbnailUrl;

  // Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});
  Photo({this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
   return Photo(
    //  albumId: json['albumId'] as int,
    //  id: json["id"] as int,
    //  title: json["title"] as String,
    //  url: json['url'] as String,
     thumbnailUrl: json["snippet"]["thumbnails"]["high"]["url"] as String
   );
  }
}

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get("https://www.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyAR1YOc4WpYMiEJ7XKHHdZmoXzKYzEvdfU");
  // final response = await client.get("https://jsonplaceholder.typicode.com/photos");
  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody)["items"].cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}