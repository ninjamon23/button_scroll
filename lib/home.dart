import 'package:flutter/material.dart';

class ButtonScrollDemo extends StatefulWidget {
  ButtonScrollDemo({Key? key}) : super(key: key);

  @override
  State<ButtonScrollDemo> createState() => _ButtonScrollDemoState();
}

class _ButtonScrollDemoState extends State<ButtonScrollDemo> {
  double scrollPosition = 0;
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ElevatedButton(
          //     onPressed: () {
          //       scrollController.animateTo(0,
          //           duration: Duration(seconds: 1), curve: Curves.easeIn);
          //     },
          //     child: Text("go top")),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            scrollPosition -= 200;
                            if (scrollPosition < 0) {
                              scrollPosition = 0;
                            }
                          });

                          scrollController.animateTo(scrollPosition,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeIn);
                        },
                        child: const Icon(Icons.chevron_left))),
                Expanded(
                  flex: 8,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: scrollController,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)),
                        child: Text('My Awesome Border $index'),
                      );
                    },
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          primary: Colors.red.withOpacity(.3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(2),
                              ),
                              side: BorderSide(color: Colors.white)),
                        ),
                        onPressed: () {
                          setState(() {
                            scrollPosition += 200;
                            if (scrollPosition < 0) {
                              scrollPosition = 0;
                            }
                          });
                          scrollController.animateTo(scrollPosition,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeIn);
                        },
                        child: const Icon(Icons.chevron_right))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
