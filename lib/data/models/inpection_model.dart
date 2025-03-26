class InspectionModel {
  final bool? isVerified;
  final String? title;
  final String? imagePath;

  const InspectionModel({this.title, this.isVerified, this.imagePath});

  InspectionModel copyWith(
      {bool? isVerified, String? title, String? imagePath}) {
    return InspectionModel(
        isVerified: isVerified ?? this.isVerified,
        title: title ?? this.title,
        imagePath: imagePath ?? imagePath);
  }
}
