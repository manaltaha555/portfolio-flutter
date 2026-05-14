import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/presentation/widgets/headline_text.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        HeadlineText(text: "About me"),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 800) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 250,
                    width: 250,
                    margin: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 24.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: AssetImage("images/portfolio.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: textTheme.bodyLarge,
                      children: [
                        TextSpan(
                          text: 'Flutter Developer & Problem Solver\n\n',
                          style: textTheme.titleMedium?.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const TextSpan(
                          text:
                              'Computer and Data Science graduate with strong expertise in Flutter development, data structures, and problem-solving. Skilled in building and optimizing high-performance mobile applications using Firebase, RESTful APIs, and local databases.\n\n',
                        ),
    
                        const TextSpan(
                          text:
                              'Highly adaptable and fast learner, consistently keeping up with the latest Flutter tools and best practices. Passionate about delivering user-friendly applications with clean architecture and efficient performance.\n\n',
                        ),
    
                        const TextSpan(
                          text:
                              'Currently contributing at Quriv Technologies, with experience in launching applications on the Google Play Store and collaborating on real-world projects from development to deployment.',
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Row(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
    
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 32.w),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/portfolio.jpg"),
                          fit: BoxFit.cover,
                          // alignment: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: RichText(
                    text: TextSpan(
                      style: textTheme.bodyLarge,
                      children: [
                        TextSpan(
                          text: 'Flutter Developer & Problem Solver\n\n',
                          style: textTheme.titleMedium?.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const TextSpan(
                          text:
                              'Computer and Data Science graduate with strong expertise in Flutter development, data structures, and problem-solving. Skilled in building and optimizing high-performance mobile applications using Firebase, RESTful APIs, and local databases.\n\n',
                        ),
    
                        const TextSpan(
                          text:
                              'Highly adaptable and fast learner, consistently keeping up with the latest Flutter tools and best practices. Passionate about delivering user-friendly applications with clean architecture and efficient performance.\n\n',
                        ),
    
                        const TextSpan(
                          text:
                              'Currently contributing at Quriv Technologies, with experience in launching applications on the Google Play Store and collaborating on real-world projects from development to deployment.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
