import 'package:flutter/material.dart';

import '../models/movie.dart';

class DetailsView extends StatelessWidget {

  final Movie movie;

  const DetailsView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 15, 15 , 100),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                  movie.poster,
                height: screenHeight * 0.62,
                width: screenWidth,
              ),
              const SizedBox(height: 16.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        movie.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: screenWidth * 0.04,
                  ),


                  Row(
                   children: [
                     Container(
                       padding: const EdgeInsets.all(5),
                       decoration: BoxDecoration(
                         color: const Color.fromRGBO(27, 31, 41, 10),
                         borderRadius: BorderRadius.circular(20.0),
                       ),
                       child: IconButton(
                         onPressed: () {  },
                         icon: const Icon(
                           Icons.download,
                           color: Colors.white,
                         ),
                       ),
                     ),

                     SizedBox(
                       width: screenWidth * 0.03,
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
                           Icons.share,
                           color: Colors.white,
                         ),
                       ),
                     ),
                   ],
                 )

                ],
              ),

              SizedBox(
                height: screenHeight * 0.03,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      movie.year,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: screenWidth * 0.04,
                  ),

                  const Text(
                      '·',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),

                  SizedBox(
                    width: screenWidth * 0.04,
                  ),


                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      movie.imdbID,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: screenWidth * 0.04,
                  ),

                  const Text(
                    '·',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),

                  SizedBox(
                    width: screenWidth * 0.04,
                  ),

                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      movie.type,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
