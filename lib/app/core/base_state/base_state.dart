import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../mixins/loader_mixin.dart';
import '../mixins/message_mixin.dart';

abstract class BaseState<T extends StatefulWidget, C extends BlocBase> extends State<T>
    with LoaderMixin, MessageMixin {
  late final C cubit;

  @override
  void initState() {
    super.initState();

    cubit = Modular.get<C>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      onReady();
    });
  }

  void onReady() {}
}
