import 'package:GestionPS/src/helpers/theme.dart';
import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  final String desc;
  final String urlImage;
  final Color backgroundColor;

  const CardHeader(
      {Key key,
      String this.desc,
      String this.urlImage = "",
      Color this.backgroundColor = GPSColors.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Card(
            margin: EdgeInsets.only(left: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Container(
              height: 140,
              width: 200,
              decoration: BoxDecoration(
                color: this.backgroundColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 5),
                  child: Text(
                    this.desc,
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 217, 217, 217),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 200,
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              this.urlImage,
              height: 120,
              width: 120,
            ),
          ),
        ),
      ],
    );
  }
}
