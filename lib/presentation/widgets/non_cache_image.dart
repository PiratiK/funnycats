import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NonCacheNetworkImage extends StatelessWidget {
  final String imageUrl;

  const NonCacheNetworkImage(
    this.imageUrl, {
    Key? key,
  }) : super(key: key);

  Future<Uint8List> getImageBytes() async {
    Response response = await Dio()
        .get(imageUrl, options: Options(responseType: ResponseType.bytes));
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: getImageBytes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Image.memory(
            snapshot.data!,
            fit: BoxFit.cover,
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.blue,
            highlightColor: Colors.yellow,
            child: const ColoredBox(
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}
