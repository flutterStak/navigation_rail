import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Details2 extends StatelessWidget {
  final int _selectedIndex;

  Details2(this._selectedIndex);

  final List<String> images3 = [
    "assets/images/pro.jpg",
    "assets/images/fort.jpg",
  ];

  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView(
            children: <Widget>[
              Text(
                "Library",
                style: GoogleFonts.roboto(
                  fontSize: 50,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              for (var i in images3) ImageData(i),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageData extends StatelessWidget {
  final data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 0, 24, 24),
      child: Image.asset(data),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  const ImageData(this.data);
}
