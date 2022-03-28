import 'package:flutter/material.dart';
import 'package:metaweather/core/global/keys.dart';
import 'package:metaweather/core/navigation/pages.dart';
import 'package:metaweather/core/utils/extension.dart';
import 'package:metaweather/core/utils/textstyle.dart';

const _cityId = {
  'London': '44418',
  'Paris': '615702,',
  'Berlin': '638242',
};

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _cityId.entries.map((entry) {
          return InkWell(
            onTap: () {
              context.storage.putData(Keys.cityId, entry.value);
              Navigator.pushReplacementNamed(
                context,
                Pages.forecast,
                arguments: entry.value,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                entry.key,
                style: AppTextStyle.boldWhite22,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
