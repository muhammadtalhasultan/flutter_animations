import 'package:flutter/material.dart';
import 'package:sliverappbar/Curved.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _controller = ScrollController();

  double _offset = 0.0;
  double data = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _offset = _controller.offset;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              CustomScrollviewAppBar(offset: _offset),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    controller: _controller,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8.0)),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
