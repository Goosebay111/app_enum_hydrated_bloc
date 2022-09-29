import 'package:app_enum_hydrated_bloc/blocs/selected/selected_events.dart';
import 'package:app_enum_hydrated_bloc/blocs/selected/selected_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SelectedBloc extends HydratedBloc<SelectedEvents, SelectedState> {
  SelectedBloc() : super(SelectedState.initial()) {
    on<AddItem>(
      ((event, emit) => emit(
            state.copyWith(
              selectedWeapons: [...state.selected, event.weapon],
            ),
          )),
    );
    on<RemoveItem>(
      ((event, emit) => emit(
            state.copyWith(
              selectedWeapons: state.selected..remove(event.weapon),
            ),
          )),
    );
  }

  @override
  SelectedState? fromJson(Map<String, dynamic> json) {
    return SelectedState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SelectedState state) {
    return state.toJson();
  }
}
