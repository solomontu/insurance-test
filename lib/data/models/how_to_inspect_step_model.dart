class HowToInspectModel {
  final int? index;
  final bool? isShown;

  HowToInspectModel({this.index, this.isShown});

  HowToInspectModel copyWith({
    int? index,
    bool? isShown,
  }) {
    return HowToInspectModel(
      index: index ?? this.index,
      isShown: isShown ?? this.isShown,
    );
  }
}
