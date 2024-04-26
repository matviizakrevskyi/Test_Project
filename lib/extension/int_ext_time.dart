extension IntTimeFormatter on int {
  String formatTime() {
    int hours = this ~/ 3600;
    int minutes = (this % 3600) ~/ 60;
    int seconds = this % 60;
    return '${_pad(hours)}:${_pad(minutes)}:${_pad(seconds)}';
  }

  String _pad(int value) {
    return value.toString().padLeft(2, '0');
  }
}