extension DateOnlyDayDufference on DateTime {
  int difOnlyDay(DateTime other) {
    return DateTime(this.year, this.month, this.day)
        .difference(DateTime(other.year, other.month, other.day))
        .inDays;
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}

extension DateOnlyGet on DateTime {
  DateTime myDateTime() {
    return DateTime(this.year, this.month, this.day);
  }
}
