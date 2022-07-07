import 'dart:convert';

import 'package:bwa_cozy/models/space.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  static const String url = "https://staycozyhotel.herokuapp.com/hotel/";

  void dioCoba(
    String name,
    String imageUrl,
    int price,
    String city,
    String country,
    int rating,
    String address,
    String phone,
    String mapUrl,
    int numberOfKitchens,
    int numberOfBedrooms,
    int numberOfCupboards,
  ) async {
    List<Space> data = [];
    var dio = Dio();

    dio.post(
      url,
      data: jsonEncode({
        "name": name,
        "city": city,
        "country": country,
        "price": price,
        "image_url": imageUrl,
        "rating": rating,
        "address": address,
        "phone": phone,
        "map_url": mapUrl,
        "number_of_kitchens": numberOfKitchens,
        "number_of_bedrooms": numberOfBedrooms,
        "number_of_cupboards": numberOfCupboards
      }),
    );

    notifyListeners();
  }

  Future post(
    String name,
    String imageUrl,
    int price,
    String city,
    String country,
    int rating,
    String address,
    String phone,
    String mapUrl,
    int numberOfKitchens,
    int numberOfBedrooms,
    int numberOfCupboards,
  ) async {
    var dio = Dio();

    try {
      final result = await dio.post(
        url,
        data: jsonEncode({
          "name": name,
          "city": city,
          "country": country,
          "price": price,
          "image_url": imageUrl,
          "rating": rating,
          "address": address,
          "phone": phone,
          "map_url": mapUrl,
          "number_of_kitchens": numberOfKitchens,
          "number_of_bedrooms": numberOfBedrooms,
          "number_of_cupboards": numberOfCupboards
        }),
      );

      return result.data;
    } catch (e) {
      print(e);
    }
  }

  Future delete(String id) async {
    var dio = Dio();

    try {
      final result = await dio.delete(
        "${url}/${id}",
      );

      return result.data;
    } catch (e) {
      print(e);
    }
  }

  Future path(
    String name,
    // String imageUrl,
    int price,
    // String city,
    // String country,
    int rating,
    // String address,
    String phone,
    // String mapUrl,
    int numberOfKitchens,
    int numberOfBedrooms,
    int numberOfCupboards,
    String id,
  ) async {
    var dio = Dio();

    try {
      final result = await dio.patch(
        "${url}/${id}",
        data: jsonEncode({
          "name": name,
          // "city": city,
          // "country": country,
          "price": price,
          // "image_url": imageUrl,
          "rating": rating,
          // "address": address,
          "phone": phone,
          // "map_url": mapUrl,
          "number_of_kitchens": numberOfKitchens,
          "number_of_bedrooms": numberOfBedrooms,
          "number_of_cupboards": numberOfCupboards
        }),
      );
      return result.data;
    } catch (e) {
      print(e);
    }
  }
}
