import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef Factory<Bloc> = Bloc Function(BuildContext context);

class BlocFactory<Bloc extends StateStreamableSource<State>, State>
    extends StatelessWidget {
  const BlocFactory({
    super.key,
    required this.create,
    this.lazy = true,
    required this.builder,
  });

  final BlocWidgetBuilder<State> builder;
  final Factory<Bloc> create;
  final bool lazy;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Bloc>(
      create: create,
      lazy: lazy,
      child: BlocBuilder<Bloc, State>(builder: builder),
    );
  }
}
