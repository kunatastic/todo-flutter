import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    _foo([1, 2, 3], 1);
    _foo(['a', 'b', 'c'], 'a');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  _foo(List<dynamic> array, dynamic update) {
    //array operations
  }
}
