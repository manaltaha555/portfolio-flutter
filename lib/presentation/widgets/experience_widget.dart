import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/data/models/experience_model.dart';
import 'package:portfolio/presentation/widgets/gradient_text.dart';

class ExperienceWidget extends StatelessWidget {
  ExperienceWidget({super.key, required this.experience});

  final ExperienceModel experience;
  final ValueNotifier<bool> hoverNotifier = ValueNotifier(false);

  static final double _dotSize = 12.0.h;
  static final double _lineWidth = 2.0.w;
  static final double _cardBottomGap = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Stack(
        children: [
          // Timeline line
          Positioned(
            left: (_dotSize / 2) - (_lineWidth / 2),
            top: _dotSize,
            bottom: _cardBottomGap,
            child: Container(
              width: _lineWidth,
              color: AppColors.accent.withAlpha(77),
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExperienceTimelineDot(
                hoverNotifier: hoverNotifier,
              ),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  margin: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.bgGlass,
                    border: Border.all(
                      color: AppColors.border,
                    ),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isMobile = constraints.maxWidth < 700;

                      if (isMobile) {
                        return ExperienceMobileLayout(
                          experience: experience,
                        );
                      }

                      return ExperienceDesktopLayout(
                        experience: experience,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExperienceTimelineDot extends StatelessWidget {
  const ExperienceTimelineDot({
    super.key,
    required this.hoverNotifier,
  });

  final ValueNotifier<bool> hoverNotifier;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => hoverNotifier.value = true,
      onExit: (_) => hoverNotifier.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: hoverNotifier,
        builder: (context, isHover, _) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: ExperienceWidget._dotSize,
            height: ExperienceWidget._dotSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accent,
              boxShadow: isHover
                  ? [
                      BoxShadow(
                        color: AppColors.accent.withAlpha(128),
                        blurRadius: 12,
                        spreadRadius: 4,
                      ),
                    ]
                  : [],
            ),
          );
        },
      ),
    );
  }
}

class ExperienceDesktopLayout extends StatelessWidget {
  const ExperienceDesktopLayout({
    super.key,
    required this.experience,
  });

  final ExperienceModel experience;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExperienceImage(
          image: experience.image,
        ),

        Expanded(
          flex: 4,
          child: ExperienceContent(
            experience: experience,
            isMobile: false,
          ),
        ),
      ],
    );
  }
}

class ExperienceMobileLayout extends StatelessWidget {
  const ExperienceMobileLayout({
    super.key,
    required this.experience,

  });

  final ExperienceModel experience;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ExperienceImage(
            image: experience.image,
          ),
        ),

        const SizedBox(height: 16),

        ExperienceContent(
          experience: experience,
          isMobile: true,
        ),
      ],
    );
  }
}

class ExperienceImage extends StatelessWidget {
  const ExperienceImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

class ExperienceContent extends StatelessWidget {
  const ExperienceContent({
    super.key,
    required this.experience,
    required this.isMobile
  });

  final ExperienceModel experience;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isMobile? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          experience.companyName,
          style: theme.textTheme.headlineMedium,
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: GradientText(
            text: experience.role,
          ),
        ),

        Text(
          experience.info,
          style: theme.textTheme.bodySmall,
        ),

        SizedBox(height: 10.h),

        ...experience.responsibilities.map(
          (resp) => ExperienceResponsibilityItem(
            text: resp,
          ),
        ),
      ],
    );
  }
}

class ExperienceResponsibilityItem extends StatelessWidget {
  const ExperienceResponsibilityItem({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              right: 8,
            ),
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.accent.withAlpha(179),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}