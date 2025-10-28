import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/credits_respond.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;

  const CastingCards(this.movieId);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            constraints: BoxConstraints(maxWidth: 150),
            height: 180,
            child: CupertinoActivityIndicator(),
          );
        }

        final List<Cast> cast = snapshot.data!;

        if (cast.isEmpty) {
          return Container(
            constraints: BoxConstraints(maxWidth: 150),
            height: 180,
            alignment: Alignment.center,
            child: Text('No hay actores disponibles', textAlign: TextAlign.center),
          );
        }

        return Container(
          margin: EdgeInsets.only(top: 20),
          height: 180,
          width: double.infinity,
          //color: Colors.red,
          child: ListView.builder(
            itemCount: cast.length < 10 ? cast.length : 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: ( _,int index) => _CastCard(cast[index]),
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {

  final Cast actor;

  const _CastCard(this.actor);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 110,
        height: 150, // Reducida para evitar overflow
        //color: Colors.green,
        child: Column(
          children: [
            ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/no-image.jpg'),
                        image: NetworkImage(
                            actor.fullProfilePath),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/no-image.jpg', width: 100, height: 120, fit: BoxFit.cover);
                        },
                        height: 120,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
            ),
            SizedBox(height: 4),
            SizedBox(
              height: 28,
              child: Text(
                actor.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }
}
