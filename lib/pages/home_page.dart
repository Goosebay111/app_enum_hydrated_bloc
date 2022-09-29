import 'package:app_enum_hydrated_bloc/blocs/selected/selected_bloc.dart';
import 'package:app_enum_hydrated_bloc/blocs/selected/selected_events.dart';
import 'package:app_enum_hydrated_bloc/blocs/selected/selected_state.dart';
import 'package:app_enum_hydrated_bloc/enums/weapon_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  int _getSum(items) =>
      items.fold(0, (previous, element) => previous + element.bonus());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedBloc, SelectedState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(title: const Text('New Enums with Hydrated Bloc')),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                CircleAvatar(
                  radius: 100,
                  child: Text(_getSum(state.selected).toString()),
                ),
                Wrap(children: [
                  ...Item.values
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: ActionChip(
                                backgroundColor: state.selected.contains(e)
                                    ? Colors.blue
                                    : null,
                                label: Text(e.name.toString()),
                                onPressed: () {
                                  state.selected.contains(e)
                                      ? BlocProvider.of<SelectedBloc>(context)
                                          .add(RemoveItem(e))
                                      : BlocProvider.of<SelectedBloc>(context)
                                          .add(AddItem(e));
                                }),
                          ))
                      .toList()
                ])
              ])));
    });
  }
}
