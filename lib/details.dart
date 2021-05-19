import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class Details extends StatelessWidget {
  final int _selectedIndex;

  Details(this._selectedIndex);

  final List<String> images1 = [
    "assets/images/wolfs.jpg",
    "assets/images/theft.jpg",
  ];
  



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeTransition(
        
        opacity: animation,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView(
              children: <Widget>[
                Text(
                  "Home",
                  style: GoogleFonts.roboto(
                    fontSize: 50,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                for (var i in images1) ImageData(i),
              ],
            ),
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
