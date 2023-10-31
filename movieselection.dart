import 'package:flutter/material.dart';

void main() {
  runApp(MovieSelectionApp());
}

class Movie {
  final String title;
  final String description;
  final String imagePath; // Add this property

  Movie(this.title, this.description, this.imagePath);
}

class MovieSelectionApp extends StatefulWidget {
  @override
  _MovieSelectionAppState createState() => _MovieSelectionAppState();
}

class _MovieSelectionAppState extends State<MovieSelectionApp> {
  final List<Movie> movies = [
    Movie('Perfectly Imperfect', 'Grace Vanderwaal', 'assets/img/movie1.jpg'),
    Movie('Just the Beginning', 'Grace Vanderwaal', 'assets/img/movie2.jpg'),
    Movie('Moonlight', 'Grace Vanderwaal', 'assets/img/movie3.jpg'),
  ];

  int selectedIndex = -1; // Initialize selectedIndex in the parent widget

  void selectMovie(int index) {
    setState(() {
      selectedIndex = index; // Update selectedIndex
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Movie Selection App'),
          backgroundColor: Colors.blue, // Set the app bar color
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: MovieList(
                  movies: movies,
                  selectMovie: selectMovie,
                  selectedIndex: selectedIndex),
            ),
            Expanded(
              child: MovieDetails(
                movies: movies,
                selectedIndex: selectedIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieList extends StatefulWidget {
  final List<Movie> movies;
  final Function(int) selectMovie; // Function to select a movie
  final int selectedIndex; // Pass selectedIndex

  MovieList(
      {required this.movies,
      required this.selectMovie,
      required this.selectedIndex});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.movies[index].title),
            onTap: () {
              widget.selectMovie(index); // Call the selectMovie function
            },
            selected: index ==
                widget.selectedIndex, // Use selectedIndex from the parent
          );
        },
      ),
    );
  }
}

class MovieDetails extends StatelessWidget {
  final List<Movie> movies;
  final int selectedIndex;

  MovieDetails({required this.movies, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: selectedIndex == -1
            ? Text(
                'Select a movie to see details',
                style: TextStyle(fontSize: 18),
              )
            : Card(
                margin: EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    // Center the content
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Title: ${movies[selectedIndex].title}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Image.asset(
                          movies[selectedIndex]
                              .imagePath, // Display the movie image
                          height: 200, // Adjust the height as needed
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Description: ${movies[selectedIndex].description}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
