import 'package:flutter/material.dart';
import 'package:movie_db_mock_app/components/movie_card.dart';
import 'package:movie_db_mock_app/views/details_view.dart';
import 'package:provider/provider.dart';

import '../providers/movie_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 15, 15 , 100),
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            bottom: screenHeight * 0.01,
            top: screenHeight * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                      ),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: Colors.white.withOpacity(0.5),
                        hintText: 'Search for movies, series & more',
                        hintStyle:TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                        fillColor: const Color.fromRGBO(27, 31, 41, 10),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.3),
                              width: 2,
                            )
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onSubmitted: (value){
                        if (value.isEmpty) {
                          movieProvider.clearMovies();
                        } else {
                          movieProvider.fetchMovieData(value);
                        }
                      },
                    ),
                  ),

                  SizedBox(
                    width: screenWidth * 0.05,
                  ),

                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(27, 31, 41, 10),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: IconButton(
                      onPressed: () {  },
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.03)
              ),

              FittedBox(
                fit: BoxFit.scaleDown,
                child: movieProvider.movies.isNotEmpty
                 ? const Text(
                    'Featured results',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ) : const Text(
                  'Search for movies and series & more',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ) ,
              ),

              Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.03)
              ),

              SizedBox(
                height: screenHeight * 0.77,
                child: movieProvider.movies.isNotEmpty
                ? GridView.builder(
                  gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: movieProvider.movies.length,
                    itemBuilder: (context , index) {
                      final movie = movieProvider.movies[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MovieCard(
                            movie: movie,
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=> DetailsView(movie: movie,))
                              );
                            }
                        ),
                      );
                  },
                ):
                  const Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                      "No movies found",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
