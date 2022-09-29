
import 'package:app_enum_hydrated_bloc/enums/weapon_enum.dart';

Item getItemType(String item) {
  switch (item) {
    case 'Weapon.magical':
      return Item.magical;
    case 'Weapon.sharp':
      return Item.sharp;
    case 'Weapon.heavy':
      return Item.heavy;
    default:
      return Item.heavy;
  }
}
