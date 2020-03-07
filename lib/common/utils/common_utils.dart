class CommonUtils {
  static final double MILLIS_LIMIT = 1000;
  static final double SECONDS_LIMIT = 60 * MILLIS_LIMIT;
  static final double MINUTES_LIMIT = 60 * SECONDS_LIMIT;
  static final double HOURS_LIMIT = 24 * MINUTES_LIMIT;
  static final double DAYS_LIMIT = 30 * HOURS_LIMIT;

  static String getDataStr(DateTime dateTime) {
    return "${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}:${dateTime.second}";
  }

  static String getNewsTimeStr(DateTime dateTime) {
    int subTime = DateTime.now().millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch;

    if (subTime < MINUTES_LIMIT) {
      return "刚刚";
    } else if (subTime < SECONDS_LIMIT) {
      return "${(subTime / MILLIS_LIMIT).round().toString()} 秒前";
    } else if (subTime < MINUTES_LIMIT) {
      return "${(subTime / SECONDS_LIMIT).round().toString()} 分钟前";
    } else if (subTime < HOURS_LIMIT) {
      return "${(subTime / MINUTES_LIMIT).round().toString()} 小时前";
    } else if (subTime < DAYS_LIMIT) {
      return "${(subTime / HOURS_LIMIT).round().toString()} 天前";
    } else {
      return getDataStr(dateTime);
    }
  }
}
