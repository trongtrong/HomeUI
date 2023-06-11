import 'package:flutter/material.dart';
import 'package:we_slide/we_slide.dart';

class Basic extends StatefulWidget {
  Basic({Key? key}) : super(key: key);

  @override
  _BasicState createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final double _panelMinSize = 130.0;
    final double _panelMaxSize = MediaQuery.of(context).size.height;
    final _controller = WeSlideController();
    final _footerController = WeSlideController(initial: true);

    return Scaffold(
      backgroundColor: Colors.black,
      body: WeSlide(
        parallax: true,
        hideAppBar: true,
        hideFooter: true,
        panelMinSize: _panelMinSize,
        panelMaxSize: _panelMaxSize,
        backgroundColor: Color(0xffffffff),
        panelBorderRadiusBegin: 20.0,
        panelBorderRadiusEnd: 20.0,
        parallaxOffset: 0.3,
        appBarHeight: 80.0,
        footerHeight: 60.0,
        controller: _controller,
        footerController: _footerController,
        appBar: AppBar(
          title: Text('1 nồi lẩu'),
          leading: BackButton(),
          backgroundColor: Colors.black,
        ),
        body: GestureDetector(
          onVerticalDragUpdate: (DragUpdateDetails details) {
            if (details.delta.dy > 0) {
              // Vuốt xuống
            } else if (details.delta.dy < -3) {
              // Vuốt lên
              _controller.show();
            }
          },
          child: Container(
              child: Column(
            children: [
              Container(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "14:26",
                      style: TextStyle(fontSize: 34, color: Colors.black),
                    ),
                    Text(
                      'Sun, June 11 (Lunar: 24 Apr)',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
              buildContainer(),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xfff2f3f4),
                          child: Icon(Icons.audiotrack),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          )),
        ),
        panel:

        NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            print('pixels ==   ${notification.metrics.pixels}');
            print('maxScrollExtent ==   ${notification.metrics.maxScrollExtent}');
            print('maxx controller ==   ${controller.position.maxScrollExtent}');
            print('offset ==   ${controller.offset}');
            return false;
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundColor: index % 2 == 0 ? Colors.blue : Color(0xfff2f3f4),
                          child: Icon(Icons.audiotrack),
                        )
                      ],
                    );
                  },
                ),
                buildContainer(),
                Expanded(
                  child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    controller: controller,
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 70,
                        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: index % 2 == 0 ? Colors.red : Colors.blue,
                              child: Icon(Icons.cabin),
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Kiem 1 nồi lẩu của e nam khó quá',
                                        style: TextStyle(color: Colors.black, fontSize: 18),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Kiem 1 nồi lẩu của e nam khó quá, Kiem 1 nồi lẩu của e nam khó quá',
                                        style: TextStyle(color: Colors.grey, fontSize: 18),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),

        panelHeader: GestureDetector(
          onTap: () {
            _controller.show();
          },
          child: Container(
            height: 90.0,
            color: _colorScheme.secondary,
            child: Center(child: Text("Slide to Up ☝️")),
          ),
        ),
        footer: Container(
          height: 60.0,
          color: Colors.orange,
          child: Center(child: Text("This is the footer ")),
        ),
      ),
    );
  }

  Container buildContainer() {
    return Container(
      height: 50,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xfff2f3f4)),
            child: Center(
              child: Text('Device control', style: TextStyle(fontSize: 16, color: Colors.black)),
            ),
          )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xfff2f3f4)),
            child: Center(
              child: Text('Device control', style: TextStyle(fontSize: 16, color: Colors.black)),
            ),
          )),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
