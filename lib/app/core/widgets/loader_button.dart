import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoaderButton<B extends StateStreamable<S>, S> extends StatelessWidget {
  final String label;
  final String? loadingLabel;
  final BlocWidgetSelector<S, bool> selector;
  final B bloc;
  final VoidCallback onPressed;

  const LoaderButton({
    super.key,
    required this.label,
    this.loadingLabel,
    required this.selector,
    required this.bloc,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: BlocSelector<B, S, bool>(
        bloc: bloc,
        selector: selector,
        builder: (context, loading) {
          if (!loading) return Text(label);

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.threeArchedCircle(
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(width: 10),
              Text(loadingLabel ?? label),
            ],
          );
        },
      ),
    );
  }
}
