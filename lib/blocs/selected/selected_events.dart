import 'package:app_enum_hydrated_bloc/enums/weapon_enum.dart';

abstract class SelectedEvents {}

class AddItem extends SelectedEvents {
  AddItem(this.weapon);
  final Item weapon;
}

class RemoveItem extends SelectedEvents {
  RemoveItem(this.weapon);
  final Item weapon;
}
