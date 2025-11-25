import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getx_local/API_Practice/Models/posts_models.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {

  List<PostModel> postList = [] ;

  Future<List<PostModel>> getPostAPi () async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200){
      for (Map<String, dynamic> p in data) {
        postList.add(PostModel.fromJson(p));
      }
      return postList;
    }else{
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Screen"),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getPostAPi(),
                builder: (context, snapshot){
                  if(!snapshot.hasData){
                    return Text("Loading...");
                  }else{
                    return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          tileColor: Colors.grey,
                          title: Text("Title: "+postList[index].title.toString()),
                          subtitle: Text("Description- "+postList[index].body.toString()),

                        );
                      }
                    );
                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
