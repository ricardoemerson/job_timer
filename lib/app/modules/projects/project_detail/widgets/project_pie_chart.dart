import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/app_colors_extension.dart';
import '../../../../core/extensions/app_text_styles_extension.dart';

class ProjectPieChart extends StatelessWidget {
  const ProjectPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: 50,
                  color: context.colors.primary,
                  showTitle: true,
                  title: '50h',
                  titleStyle: context.textStyles.textMedium.copyWith(color: Colors.white),
                ),
                PieChartSectionData(
                  value: 150,
                  color: context.colors.primaryLight,
                  showTitle: true,
                  title: '150h',
                  titleStyle: context.textStyles.textMedium.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          Text(
            '200h',
            style: context.textStyles.textBold.copyWith(
              fontSize: 25,
              color: context.colors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
