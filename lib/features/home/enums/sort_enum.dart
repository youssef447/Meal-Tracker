enum SortEnum {
  name,
  time,
  calories,
}

extension SortEnumExtension on SortEnum {
  String get getName {
    switch (this) {
      case SortEnum.name:
        return 'Name';
      case SortEnum.time:
        return 'Time';
      case SortEnum.calories:
        return 'KCal';
    }
  }
}
