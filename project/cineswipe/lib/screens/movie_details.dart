import 'package:cineswipe/models/constants.dart';
import 'package:cineswipe/models/movie.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool isFavorite = false;
  List<Movie> favoriteMovies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              height: 70,
              width: 70,
                  margin: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF23272E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
            backgroundColor: const Color(0xFF23272E),
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  '${Constants.imagePath}${widget.movie.backDropPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    widget.movie.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Overview',
                    style: TextStyle(fontSize: 30, color: Colors.amberAccent),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.movie.overview,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.amberAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(children: [
                              Text(
                                'Release date: ' '${widget.movie.releaseDate}',
                                style:
                                    const TextStyle(color: Colors.amberAccent),
                              )
                            ]),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.amberAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(children: [
                              Text(
                                'Rating: '
                                '${widget.movie.voteAverage.toStringAsFixed(1)}/10',
                                style:
                                    const TextStyle(color: Colors.amberAccent),
                              )
                            ]),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
