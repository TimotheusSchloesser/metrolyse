import 'package:flutter/material.dart';
import 'package:metrolyse/constants/constants.dart';
import 'package:metrolyse/control/button_to_metrolyse.dart';

import 'model/diary_list.dart';

class MetrolyseStats extends StatefulWidget {
  const MetrolyseStats({super.key});

  @override
  State<MetrolyseStats> createState() => _MetrolyseStats();
}

class _MetrolyseStats extends State<MetrolyseStats> {
  final List<DiaryList> _items = [DiaryList(0, DateTime.now(), 80)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: const Text(
            'Metrolyse - Traindiary',
            style: titelTextStyle,
          ),
        ),
        body: Column(children: [
          Row(children: [
            Expanded(
              child: SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, int itemIndex) {
                      return ItemWidget(_items[itemIndex]);
                    },
                  )),
            ),
          ]),
          const ButtonToMetro(),
        ]));
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget(this.model, {Key? key}) : super(key: key);

  final DiaryList model;
  // final Function onItemTap;

  idText(id) {
    return "ID $id";
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // Useful standard widget for displaying something in ListView.
      title: Text(
        idText(model.id + 1),
        style: mainRegularTextStyle,
      ),
      subtitle: Text(
        model.time.toString(),
        style: mainRegularTextStyle,
      ),
      trailing: Text(
        model.accuracy.toString(),
        style: mainRegularTextStyle,
      ),
    );
  }
}
