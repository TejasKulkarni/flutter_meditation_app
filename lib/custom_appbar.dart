import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black87,
            Colors.transparent,
          ],
        ),
      ),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: AppbarClipper(),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFaba197),
            ),
          ),
          Positioned(
            top: 35,
            left: MediaQuery.of(context).size.width / 2 - 25,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.shade100,
                ),
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('assets/face.jpg'),
                ),
              ],
            ),
          ),
          Positioned(
            top: 75,
            left: MediaQuery.of(context).size.width / 2 - 10,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.white,
              child: FittedBox(
                child: Icon(
                  Icons.add,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.wifi_tethering,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.lineTo(0, sh);
    path.lineTo(4 * sw / 12, sh);
    path.cubicTo(5 * sw / 12, sh, 5 * sw / 12, sh / 2, 6 * sw / 12, sh / 2);
    path.cubicTo(7 * sw / 12, sh / 2, 7 * sw / 12, sh, 8 * sw / 12, sh);
    path.lineTo(sw, sh);
    path.lineTo(sw, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
