import 'package:flutter/material.dart';

class DebugSection extends StatelessWidget {
  final Iterable lst;
  final String title;
  const DebugSection({required this.lst, required this.title, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black38, width: 1)),
      child: Column(
        children: [
          Expanded(
              child: Text(title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900))),
          Expanded(
            flex: 10,
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(
                    lst.length,
                    (index) => Text(lst.skip(index).first),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
