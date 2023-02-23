import "package:flutter/material.dart";

void main() => const Zumba();

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

  //TODO: I ADDED THE DISPOSE METHOD FOR THIS ANIMATION
  @override
  void dispose() {
    _animatemove.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //! I ALSO DECLARED A ONE TIME MEDIAQUERY INSTANCE
    final size = MediaQuery.of(context).size;
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
      body: ListView(
        children: [
          FittedBox(
            child: SizedBox(
                height: size.height / 1.5,

                //TODO: I AM STILL YET TO UNDERSTAND THE IMPORTANCE OF THE STACK AND THE SLIDE TRANSITION IN THIS CODE. 
                child: Stack(
                  children: [
                    CustomPaint(
                      painter: Slashpainter(),
                      size: Size(
                        size.width,
                        size.height / 1.5,
                      ),
                    ),
                    Positioned(
                        left: size.width / 10,
                        top: size.height / 7,
                        width: size.width / 2.5,
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
                                      'assets/capturedIcon.png',
                                      height: size.height / 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 40,
                                      ),
                                      child: Image.asset(
                                        'assets/capturedIcon.png',
                                        height: size.height / 15,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),

                        //TODO: THERE WAS AN INCORRECT USE OF WIDGET HERE( swapped the positioned with Slidetransition)
                    Positioned(
                      right: 0,
                      top: size.height / 50,
                      width: size.width / 2,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1, 0),
                          end: const Offset(1, 0),
                        ).animate(_animatemove),
                        child: Container(
                          height: 200,
                          width: 200,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                )),
          )
        ],
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

//TODO: GOODLUCK
//TODO: YOU CAN REPLACE THE ASSETS IMAGE WITH YOURS.