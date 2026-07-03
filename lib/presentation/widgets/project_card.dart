import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/data/models/project_model.dart';
import 'package:portfolio/presentation/widgets/animated_link_placeholder.dart';
import 'package:portfolio/presentation/widgets/images_view.dart';
import 'package:portfolio/presentation/widgets/skill_card.dart';

class ProjectCard extends StatelessWidget {
  ProjectCard({super.key, required this.project});

  final ProjectModel project;
  final hoverNotifier = ValueNotifier(false);
  final photoNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return MouseRegion(
      onEnter: (_) => hoverNotifier.value = true,
      onExit: (_) => hoverNotifier.value = false,
      child: ValueListenableBuilder(
        valueListenable: hoverNotifier,
        builder: (context, isHover, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            transform: Matrix4.translationValues(0, isHover ? -3 : 0, 0),
            padding: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.bgGlass,
              border: Border.all(
                color: AppColors.border,
                width: isHover ? 2 : 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(project.imagePath[0], fit: BoxFit.cover),
                          if (project.imagePath.length > 1)
                            AnimatedOpacity(
                              opacity: isHover ? 1 : 0,
                              duration: const Duration(milliseconds: 200),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierColor: Colors.black.withAlpha(250),
                                    builder: (context) {
                                      return Dialog(
                                        backgroundColor: Colors.transparent,
                                        insetPadding: EdgeInsets.zero,
                                        child: ImagesView(
                                          projectTitle: project.projectTitle,
                                          projectImages: project.imagePath,
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withAlpha(120),
                                      ),
                                    ),
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      onHover: (event) =>
                                          photoNotifier.value = true,
                                      onExit: (event) =>
                                          photoNotifier.value = false,
                                      child: ValueListenableBuilder(
                                        valueListenable: photoNotifier,
                                        builder: (context, isPhotoHover, child) {
                                          return TweenAnimationBuilder<double>(
                                            duration: Duration(
                                              milliseconds: 300,
                                            ),
                                            tween: Tween(
                                              begin: 0,
                                              end: isPhotoHover ? 1 : 0,
                                            ),
                                            builder: (context, value, child) {
                                              final animatedColor = Color.lerp(
                                                AppColors.textPrimary,
                                                AppColors.textSecondary,
                                                value,
                                              );
                                              return Align(
                                                alignment: Alignment.center,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.image_outlined,
                                                      color: animatedColor,
                                                    ),
                                                    SizedBox(width: 6.w),
                                                    Text(
                                                      "${project.imagePath.length} Photo",
                                                      style: theme.displaySmall!
                                                          .copyWith(
                                                            color:
                                                                animatedColor,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w.clamp(28, 32),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 16.h.clamp(14, 18),
                            bottom: 10.h.clamp(8, 12),
                          ),
                          child: Text(
                            project.projectTitle,
                            style: theme.labelSmall,
                          ),
                        ),
                        Text(
                          "${DateFormat('MMM yyyy').format(project.startDate)} - ${DateFormat('MMM yyyy').format(project.endDate)}",
                          style: theme.bodySmall,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h.clamp(8, 12),
                          ),
                          child: Text(project.body, style: theme.bodyMedium),
                        ),
                        Wrap(
                          spacing: 6.w.clamp(4, 6),
                          runSpacing: 7.h.clamp(6, 7),
                          children: List.from(project.skills)
                              .map(
                                (skill) =>
                                    SkillCard(text: skill, isInProject: true),
                              )
                              .toList(),
                        ),
                        if (project.demoLink != null ||
                            project.githubLink != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                if (project.demoLink != null)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: AnimatedLinkPlaceholder(
                                      text: 'View Demo',
                                      icon: Icons.open_in_new,
                                      link: project.demoLink!,
                                    ),
                                  ),
                                if (project.githubLink != null)
                                  AnimatedLinkPlaceholder(
                                    text: "View On Github",
                                    icon: Icons.open_in_new,
                                    link: project.githubLink!,
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
