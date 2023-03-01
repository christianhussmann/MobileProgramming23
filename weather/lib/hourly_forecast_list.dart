import 'package:flutter/material.dart';

class HourlyForecastList extends StatelessWidget {
  const HourlyForecastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Card(child: TemperatureChart()),
        childCount: 1,
      ),
    );
  }
}

class TemperatureChart extends StatelessWidget {
  const TemperatureChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
