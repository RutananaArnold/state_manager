import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manager/model/ui.dart';

class Reports extends StatefulWidget {
  Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Consumer<UI>(
          builder: (context, ui, child) {
            return RichText(
                text: TextSpan(
                    text:
                        "Language instructors are often frustrated by the fact that students do not automatically transfer the strategies they use when reading in their native language to reading in a language they are learning. Instead, they seem to think reading means starting at the beginning and going word by word, stopping to look up every unknown vocabulary item, until they reach the end. When they do this, students are relying exclusively on their linguistic knowledge, a bottom-up strategy. One of the most important functions of the language instructor, then, is to help students move past this idea and use top-down strategies as they do in their native language.",
                    style: TextStyle(fontSize: ui.fontSize)));
          },
        ),
      ),
    );
  }
}
