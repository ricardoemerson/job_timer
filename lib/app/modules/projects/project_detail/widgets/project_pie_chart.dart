import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/app_colors_extension.dart';
import '../../../../core/extensions/app_text_styles_extension.dart';

class ProjectPieChart extends StatelessWidget {
  final int projectHoursEstimated;
  final int hoursAccomplished;

  const ProjectPieChart({
    super.key,
    required this.projectHoursEstimated,
    required this.hoursAccomplished,
  });

  @override
  Widget build(BuildContext context) {
    final residual = projectHoursEstimated - hoursAccomplished;

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
                  value: hoursAccomplished.toDouble(),
                  color: context.colors.primary,
                  showTitle: true,
                  title: '${hoursAccomplished}h',
                  titleStyle: context.textStyles.textMedium.copyWith(color: Colors.white),
                ),
                PieChartSectionData(
                  value: residual.toDouble(),
                  color: context.colors.primaryLight,
                  showTitle: true,
                  title: '${residual}h',
                  titleStyle: context.textStyles.textMedium.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          Text(
            '${projectHoursEstimated}h',
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
