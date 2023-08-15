import 'package:flutter/material.dart';
import 'package:metrolyse/constants/constants.dart';
import 'diary_list.dart';

class ListViewDetails extends StatefulWidget {
  final DiaryList model;

  const ListViewDetails(this.model, {Key? key}) : super(key: key);

  @override
  State<ListViewDetails> createState() => _ListViewDetailsState();
}

class _ListViewDetailsState extends State<ListViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.model.id.toString(),
          style: mainRegularTextStyle,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              widget.model.time.toString(),
              style: mainRegularTextStyle,
            ),
            const SizedBox(height: 16),
            Text(
              widget.model.accuracy.toString(),
              style: mainRegularTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
