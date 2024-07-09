class OnboardingModel {
  final int id;
  final String title;
  final String image;
  final String description;

  OnboardingModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.description});
  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        description: json["description"]);
  }
}
