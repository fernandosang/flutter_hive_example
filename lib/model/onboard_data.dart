class OnBoarding {
  final String title;
  final String image;
  final String subtitle;

  OnBoarding({
    required this.title,
    required this.image,
    required this.subtitle,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Discover Berlitz Companion App',
    image: 'assets/images/onboarding_image_1.png',
    subtitle: "An app designed to make instructors' lives a bit easier",
  ),
  OnBoarding(
    title: 'Keep track of your income',
    image: 'assets/images/onboarding_image_2.png',
    subtitle: "Always know exactly how much you're making",
  ),
  OnBoarding(
    title: 'Never lose your focus again',
    image: 'assets/images/onboarding_image_3.png',
    subtitle: "Define your monthly expenses and personal goals",
  ),
  OnBoarding(
    title: 'Save notes and reminders',
    image: 'assets/images/onboarding_image_4.png',
    subtitle: "Never miss another meeting, coaching or giveaway",
  ),
];
