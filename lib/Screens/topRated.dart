import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_app/Models/topModel.dart';
import 'package:task_app/Screens/details_page.dart';

import '../StateManagement/controller.dart';

class TopRated extends StatefulWidget {
  const TopRated({Key? key}) : super(key: key);

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  
  final ControllerPage _controller = Get.put(ControllerPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<TopRatedModel>(
        future: _controller.getTopRatedApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.results.length,
                itemBuilder: (context, index) {
                  final items = snapshot.data!.results;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Dismissible(
                        key: Key(items.toString()),
                        onDismissed: (direction) {
                          setState(() {
                            items.removeAt(index);
                          });
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                      title:
                                          snapshot.data!.results[index].title,
                                      description: snapshot
                                          .data!.results[index].overview,
                                      imageurl: snapshot
                                          .data!.results[index].posterPath
                                          .toString(),
                                    )));
                          },
                          child: Card(
                            child: Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: 100,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://image.tmdb.org/t/p/original" +
                                                  snapshot.data!.results[index]
                                                      .posterPath
                                                      .toString()),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            snapshot.data!.results[index].title,
                                            softWrap: false,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Popularity : " +
                                              snapshot.data!.results[index]
                                                  .popularity
                                                  .toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              snapshot.data!.results[index]
                                                  .voteAverage
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            margin: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 5.0),
                          ),
                        ),
                      )
                    ],
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
