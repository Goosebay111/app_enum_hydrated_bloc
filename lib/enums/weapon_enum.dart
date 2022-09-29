enum Item {
  magical(7),
  sharp(5),
  heavy(3);

  const Item(this.bonus);
  final int bonus;

  int amount() => bonus;
}
