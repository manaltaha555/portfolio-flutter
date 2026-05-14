import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/data/models/education_model.dart';
import 'package:portfolio/presentation/widgets/gradient_border_painter.dart';
import 'package:portfolio/presentation/widgets/gradient_text.dart';

class EducationWidget extends StatelessWidget {
  EducationWidget({super.key, required this.education});

  final EducationModel education;
  final ValueNotifier<bool> hoverNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => hoverNotifier.value = true,
      onExit: (_) => hoverNotifier.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: hoverNotifier,
        builder: (context, isHover, _) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.only(bottom: 16),
            transform: Matrix4.translationValues(
              isHover ? 3 : 0,
              isHover ? 3 : 0,
              0,
            ),
            child: CustomPaint(
              painter: GradientBorderPainter(progress: isHover ? 1 : 0),
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: AppColors.bgGlass,
                  borderRadius: BorderRadius.all(const Radius.circular(12)),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = constraints.maxWidth < 600;

                    if (isMobile) {
                      return EducationMobileLayout(
                        education: education,
                        theme: theme,
                      );
                    }

                    return EducationDesktopLayout(
                      education: education,
                      theme: theme,
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class EducationDesktopLayout extends StatelessWidget {
  const EducationDesktopLayout({
    super.key,
    required this.education,
    required this.theme,
  });

  final EducationModel education;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EducationImage(image: education.image),

        Expanded(
          flex: 4,
          child: EducationContent(
            education: education,
            theme: theme,
            isMobile: false,
          ),
        ),
      ],
    );
  }
}

class EducationMobileLayout extends StatelessWidget {
  const EducationMobileLayout({
    super.key,
    required this.education,
    required this.theme,
  });

  final EducationModel education;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: EducationImage(image: education.image)),

        const SizedBox(height: 16),

        EducationContent(education: education, theme: theme, isMobile: true),
      ],
    );
  }
}

class EducationImage extends StatelessWidget {
  const EducationImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fitHeight),
      ),
    );
  }
}

class EducationContent extends StatelessWidget {
  const EducationContent({
    super.key,
    required this.education,
    required this.theme,
    required this.isMobile,
  });

  final EducationModel education;
  final ThemeData theme;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          education.title,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineMedium,
        ),

        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 12),
          child: GradientText(
            text: education.body,
            style: theme.textTheme.labelSmall,
          ),
        ),

        Text(
          education.grade != null
              ? "${education.date} | ${education.grade}"
              : education.date,
          style: theme.textTheme.bodySmall,
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(education.location, style: theme.textTheme.bodySmall),
        ),

        if (education.details != null)
          ...education.details!.map(
            (resp) => EducationDetailItem(text: resp, theme: theme),
          ),
      ],
    );
  }
}

class EducationDetailItem extends StatelessWidget {
  const EducationDetailItem({
    super.key,
    required this.text,
    required this.theme,
  });

  final String text;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 8),
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.accent.withAlpha(179),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Expanded(child: Text(text, style: theme.textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
