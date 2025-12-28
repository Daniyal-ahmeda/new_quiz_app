import 'package:flutter/material.dart';
import '../widgets/quiz_home_banner.dart';
import '../widgets/featured_quiz_carousel.dart';
import '../widgets/character_section.dart';

class QuizHomePage extends StatelessWidget {
  const QuizHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: const [
          // 1. Premium Header with Gradient
          QuizHomeBanner(),

          // 2. Horizontal Carousel of Quizzes
          FeaturedQuizCarousel(),

          // 3. Link to Character Collection
          CharacterSection(),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// QUIZ HOME PAGE DOCUMENTATION
// ---------------------------------------------------------------------------
// This page serves as the main dashboard for the application.
// It uses a CustomScrollView to provide a premium, sliver-based scrolling experience.
//
// Key Components:
// 1. QuizHomeBanner: A collapsable sliver app bar with a gradient background.
// 2. FeaturedQuizCarousel: A horizontal list of available mock quizzes.
// 3. CharacterSection: A quick link to the User's Character Collection (Clean Arch).
//
// Future Improvements:
// - Add "Recent Activity" section.
// - Implement real quiz navigation.
// - Add animations for card entry.
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
