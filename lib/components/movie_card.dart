import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieCard extends StatelessWidget {

  final Movie movie;
  final VoidCallback onTap;

  const MovieCard ({super.key , required this.movie , required this.onTap});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final cardWidth = screenWidth * 0.45;
    final cardHeight = cardWidth * 1.7;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(27, 31, 41, 10),
              spreadRadius: 2,
              blurRadius: 1,
              offset: Offset(0, 3),
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child:  movie.poster != 'N/A'
                  ? Image.network(
                movie.poster,
                height: cardHeight * 0.6,
                width: double.infinity,
                fit: BoxFit.cover,
              )
                  : Image.asset(
                'assets/images/placeholder.png',
                height: cardHeight * 0.6,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: screenHeight * 0.015,
                  ),

                  FittedBox(
                    fit:BoxFit.scaleDown,
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                   SizedBox(
                      height: screenHeight * 0.01,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                        movie.year,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
