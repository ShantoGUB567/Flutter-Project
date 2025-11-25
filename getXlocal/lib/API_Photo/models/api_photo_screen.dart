import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiPhotoScreen extends StatefulWidget {
  const ApiPhotoScreen({super.key});

  @override
  State<ApiPhotoScreen> createState() => _ApiPhotoScreenState();
}

class _ApiPhotoScreenState extends State<ApiPhotoScreen> {
  // We won't rely on an external list for the builder; the Future returns the list
  Future<List<PhotoModel>> getPhotos() async {
    final response =
    await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      // Map each JSON object to PhotoModel
      final List<PhotoModel> photos = data
          .map<PhotoModel>((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return photos;
    } else {
      // In error case return empty list (or throw Exception to handle upstream)
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo from API"),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: FutureBuilder<List<PhotoModel>>(
          future: getPhotos(),
          builder: (context, snapshot) {
            // Loading state
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            // Error state
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            // No data or empty list
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return RefreshIndicator(
                onRefresh: () async => setState(() {}),
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    SizedBox(height: 200),
                    Center(child: Text('No photos available')),
                  ],
                ),
              );
            }

            // Success: build list using snapshot.data
            final photos = snapshot.data!;

            return RefreshIndicator(
              onRefresh: () async {
                // trigger rebuild & reload future
                setState(() {});
              },
              child: ListView.separated(
                padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                itemCount: photos.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final photo = photos[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: NetworkImage(photo.url),
                    ),
                    title: Text(
                      photo.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // For performance avoid loading heavy images in trailing
                    onTap: () {
                      // show full image dialog
                      showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.network(photo.url),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(photo.title),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class PhotoModel {
  final String title;
  final String url;

  PhotoModel({
    required this.title,
    required this.url,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      title: json['title']?.toString() ?? '',
      url: json['url']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'url': url,
  };
}
