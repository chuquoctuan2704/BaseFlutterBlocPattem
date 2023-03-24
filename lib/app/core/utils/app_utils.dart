import 'dart:math';

String removeLastTag(String value) {
  if (value.contains('Powered by')) {
    return value.substring(0, value.length - 230);
  }
  return value;
}

String convertDateString(String dateString) {
  //var date = DateTime.parse(dateString.substring(0, 34));
  //var dateFormat = DateFormat('MMM DD, YYYY');
  //return dateFormat.format(date);
  return dateString.substring(0, 15);
}

T randomObject<T>(List<T> list) {
  final random = Random();
  return list[random.nextInt(list.length)];
}

String stringDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}
