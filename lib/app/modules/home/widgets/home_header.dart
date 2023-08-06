import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/extensions/extensions.dart';
import '../../../data/enums/project_status_enum.dart';

class HomeHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            height: constraints.maxHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  width: context.percentWidth(.5),
                  child: DropdownButtonFormField<ProjectStatusEnum>(
                    onChanged: (value) {},
                    items: ProjectStatusEnum.values
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.label),
                          ),
                        )
                        .toList(),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      isCollapsed: true,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => Modular.to.pushNamed('/projects/project-register'),
                  icon: const Icon(Icons.add),
                  label: const Text('Novo Projeto'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
