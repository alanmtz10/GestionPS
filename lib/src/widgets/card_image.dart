import 'package:GestionPS/src/helpers/theme.dart';
import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String marca;
  final String image;
  final String route;
  final Map<String, dynamic> arguments;

  const CardImage({
    Key key,
    String this.marca,
    String this.image,
    String this.route = null,
    Map<String, dynamic> this.arguments = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(this.image),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [
                      0.1,
                      0.4
                    ],
                    colors: [
                      GPSColors.tertiary[700],
                      Colors.transparent,
                    ]),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                this.marca,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: this.marca.length < 20 ? 22 : 15,
                  color: GPSColors.white,
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        if (this.arguments != null && this.route != null) {
          Navigator.pushNamed(context, this.route, arguments: this.arguments);
        } else if (this.route != null) {
          Navigator.pushNamed(context, this.route);
        }
      },
    );
  }
}
