import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: ClipPath(
            clipper: NavbarClipper(),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF1e1e1e),
            ),
          ),
        ),
        Positioned(
          bottom: 55,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NavIcon(icon: Icons.bubble_chart, active: false),
              SizedBox(width: 1),
              NavIcon(icon: Icons.landscape, active: true),
              SizedBox(width: 1),
              NavIcon(icon: Icons.brightness_3, active: false),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Focus',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 1),
              Text(
                'Relax',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 1),
              Text(
                'Sleep',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NavbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.cubicTo(sw / 12, 0, sw / 12, 2 * sh / 5, 2 * sw / 12, 2 * sh / 5);
    path.cubicTo(3 * sw / 12, 2 * sh / 5, 3 * sw / 12, 0, 4 * sw / 12, 0);
    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.cubicTo(
        9 * sw / 12, 0, 9 * sw / 12, 2 * sh / 5, 10 * sw / 12, 2 * sh / 5);
    path.cubicTo(11 * sw / 12, 2 * sh / 5, 11 * sw / 12, 0, sw, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class NavIcon extends StatelessWidget {
  final IconData icon;
  final bool active;

  const NavIcon({Key key, this.icon, this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Color(0xFF1e1e1e),
      child: CircleAvatar(
        radius: 25,
        backgroundColor: active ? Colors.grey.shade100 : Colors.transparent,
        child: Icon(
          icon,
          color: active ? Colors.black87 : Colors.white,
        ),
      ),
    );
  }
}
