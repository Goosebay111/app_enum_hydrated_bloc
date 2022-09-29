import 'package:app_enum_hydrated_bloc/enums/weapon_enum.dart';
import 'package:app_enum_hydrated_bloc/helpers/get_item_type.dart';

class SelectedState {
  SelectedState({required this.weapons, required this.selected});
  final List<Item> weapons;
  final List<Item> selected;

  SelectedState copyWith({
    List<Item>? weapons,
    List<Item>? selectedWeapons,
  }) {
    return SelectedState(
      weapons: weapons ?? this.weapons,
      selected: selectedWeapons ?? selected,
    );
  }

  Map<String, dynamic> toJson() {
    try {
      return {
        'weapons': weapons.map((e) => e.toString()).toList(),
        'selectedWeapons': selected.map((e) => e.toString()).toList(),
      };
    } catch (e) {
      print(e);
    }
    return {};
  }

  factory SelectedState.fromJson(Map<String, dynamic> json) {
    try {
      return SelectedState(
          weapons: (json['weapons'].map<Item>((e) => getItemType(e)).toList()),
          selected: json['selectedWeapons']
              .map<Item>((e) => getItemType(e.toString()))
              .toList());
    } catch (e) {
      print(e);
    }
    return SelectedState.initial();
  }

  factory SelectedState.initial() {
    return SelectedState(
      weapons: [Item.magical, Item.sharp, Item.heavy],
      selected: [],
    );
  }
}
