import "package:flutter/material.dart";

void main()=> const Zumba();

class Zumba extends StatefulWidget {
  const Zumba({super.key});

  @override
  State<Zumba> createState() => _ZumbaState();
}

class _ZumbaState extends State<Zumba> with SingleTickerProviderStateMixin {
  // String appDropdownText = 'Notify App';
  // var appDropDown = ['Notify App', 'OLMS App'];'

  late AnimationController _animatemove;

  @override
  void initState() {
    _animatemove = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.white30,
        backgroundColor: Colors.amber,
        title: const Text(
          'Zumba',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FittedBox(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Stack(
                    children: [
                      CustomPaint(
                        painter: Slashpainter(),
                        size: Size(
                          MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height / 1.5,
                        ),
                      ),
                      Positioned(
                          left: MediaQuery.of(context).size.width / 10,
                          top: MediaQuery.of(context).size.height / 7,
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: FittedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  'WE WILL DELIVER YOUR \n PACKAGE AROUND THE WORLD',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 45,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/appstore.png',
                                        height:
                                            MediaQuery.of(context).size.height /
                                                15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 40,
                                        ),
                                        child: Image.asset(
                                          'assets/googleplaystore.png',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              15,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1, 0),
                          end: const Offset(1, 0),
                        ).animate(_animatemove),
                        child: Positioned(
                          right: 0,
                          top: MediaQuery.of(context).size.height / 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Container(
                          height: 200, width: 200, color: Colors.red),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class Slashpainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.amber;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(
        size.width,
        // size.height,
        size.height / 2.7,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

