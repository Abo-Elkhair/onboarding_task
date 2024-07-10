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
  static List<OnboardingModel> get onBoardingList => [
        OnboardingModel(
          id: 1,
          title: 'title',
          description: 'description 1',
          image:
              'https://img.freepik.com/free-photo/creative-light-bulb-abstract-glowing-blue-background-generative-ai_188544-8090.jpg',
        ),
        OnboardingModel(
          id: 2,
          title: 'title',
          description: 'description 2',
          image:
              'https://img.freepik.com/free-photo/creative-light-bulb-abstract-glowing-blue-background-generative-ai_188544-8090.jpg',
        ),
        OnboardingModel(
          id: 3,
          title: 'title',
          description: 'description 3',
          image:
              'https://img.freepik.com/free-photo/creative-light-bulb-abstract-glowing-blue-background-generative-ai_188544-8090.jpg',
        ),
      ];
}
