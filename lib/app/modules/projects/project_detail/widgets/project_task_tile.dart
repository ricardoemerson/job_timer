import 'package:flutter/material.dart';

import '../../../../core/extensions/app_text_styles_extension.dart';

class ProjectTaskTile extends StatelessWidget {
  const ProjectTaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Task name', style: context.textStyles.textRegular),
              Text.rich(
                TextSpan(
                  style: context.textStyles.textRegular,
                  children: [
                    TextSpan(
                      text: 'Duração',
                      style: context.textStyles.textRegular.copyWith(color: Colors.grey),
                    ),
                    const TextSpan(text: '  '),
                    TextSpan(
                      text: '4h',
                      style: context.textStyles.textBold,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
