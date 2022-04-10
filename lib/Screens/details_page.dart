import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  final String imageurl;
  final String description;

  DetailsScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.imageurl,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/original" +
                              widget.imageurl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.orange,
                            Colors.purple,
                          ],
                        )),
                        child: Center(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                )
              ]),
              const SizedBox(height: 10.0),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  Icon(
                    Icons.play_circle_outline,
                    size: 35.0,
                    color: Colors.purple,
                  ),
                  Icon(
                    Icons.share,
                    size: 35.0,
                    color: Colors.purple,
                  ),
                  Icon(
                    Icons.watch_later,
                    size: 35.0,
                    color: Colors.purple,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  Text(
                    '  Play Again  ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  Text(
                    'Share',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  Text(
                    'Watch Later',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Container(
                  child: Row(
                children: <Widget>[
                  Flexible(
                      child: Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ))
                ],
              )),
              const SizedBox(height: 10.0),
              const Text(
                'Cast',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Similar movies',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ));
  }
}
