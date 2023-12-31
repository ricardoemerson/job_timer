import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/extensions/extensions.dart';
import '../../../data/enums/project_status_enum.dart';
import '../home_cubit.dart';

class HomeHeader extends SliverPersistentHeaderDelegate {
  final HomeCubit cubit;

  HomeHeader({
    required this.cubit,
  });

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
                    onChanged: (status) {
                      if (status != null) {
                        cubit.filter(status);
                      }
                    },
                    value: ProjectStatusEnum.em_andamento,
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
                  onPressed: () async {
                    await Modular.to.pushNamed('/projects/project-register');

                    cubit.loadProjects();
                  },
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
