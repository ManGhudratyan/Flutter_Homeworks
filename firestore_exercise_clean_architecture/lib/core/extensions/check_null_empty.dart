// ignore: strict_raw_type
extension CheckIsNullOrEmpty on List? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty == true;
  }
}
