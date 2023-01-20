import 'dart:math';

import 'package:flutter/material.dart';

import 'custom_icon.dart';

class CustomScrollviewAppBar extends StatefulWidget {
  const CustomScrollviewAppBar({
    Key? key,
    required this.offset,
  }) : super(key: key);

  final double offset;

  @override
  State<CustomScrollviewAppBar> createState() => _CustomScrollviewAppBarState();
}

class _CustomScrollviewAppBarState extends State<CustomScrollviewAppBar> {
  double topChange = 100;
  bool search = false;
  Widget change(double width) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      top: 12,
      left: 25,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 45,
        width: widget.offset > 30
            ? search
                ? width
                : 20
            : width,
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: widget.offset > 30
                ? search
                    ? TextField(
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
                          hintText: 'Search',
                          filled: true,
                          fillColor: Colors.black.withOpacity(.2),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            search = true;
                          });
                        },
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      )
                : TextField(
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                      hintText: 'Search',
                      filled: true,
                      fillColor: Colors.black.withOpacity(.2),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    const double maxExtent = 150;
    const double minExtent = 80;
    final double shrinkOffset = widget.offset;
    final expendPercentage =
        1.0 - min(1, shrinkOffset / (maxExtent - minExtent));

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: minExtent + (maxExtent - minExtent) * expendPercentage,
      width: width,
      color: Colors.red,
      child: Stack(
        children: [
          AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              child: change(width * .8)),
          Positioned(
            top: 22,
            right: 10,
            child: search
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        search = false;
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        child: const Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.black,
                        )),
                  )
                : Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.grey,
                    )),
          ),
          search
              ? Container()
              : AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  top: widget.offset > 30 ? 25 : 70,
                  left: widget.offset > 30 ? 60 : 0,
                  right: widget.offset > 30 ? 50 : 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomIcon(
                        offset: widget.offset,
                        iconData: Icons.logout_outlined,
                        title: 'Deposit',
                      ),
                      CustomIcon(
                        offset: widget.offset,
                        iconData: Icons.attach_money,
                        title: 'Withdraw',
                      ),
                      CustomIcon(
                        offset: widget.offset,
                        iconData: Icons.qr_code,
                        title: 'Qr Code',
                      ),
                      CustomIcon(
                        offset: widget.offset,
                        iconData: Icons.document_scanner_outlined,
                        title: 'Scanning',
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
