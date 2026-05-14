import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/data/local_data/experience_local_source.dart';
import 'package:portfolio/data/local_data/projects_local_source.dart';
import 'package:portfolio/presentation/sections/about_me_section.dart';
import 'package:portfolio/presentation/sections/contact_section.dart';
import 'package:portfolio/presentation/sections/home_section.dart';
import 'package:portfolio/presentation/sections/nav_bar.dart';
import 'package:portfolio/presentation/sections/skills_section.dart';
import 'package:portfolio/presentation/widgets/app_end_drawer.dart';
import 'package:portfolio/presentation/widgets/education_widget.dart';
import 'package:portfolio/presentation/widgets/experience_widget.dart';
import 'package:portfolio/presentation/widgets/headline_text.dart';
import 'package:portfolio/presentation/widgets/project_card.dart';
import '../../data/local_data/education_local_source.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();

  int selectedIndex = 0;

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final educationKey = GlobalKey();
  final contactKey = GlobalKey();

  Timer? _holdTimer;

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: 0.05,
      );
    }
  }

  void _updateCurrentSection() {
    final sections = [
      homeKey,
      aboutKey,
      skillsKey,
      projectsKey,
      experienceKey,
      educationKey,
      contactKey,
    ];

    for (int i = 0; i < sections.length; i++) {
      final context = sections[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;

        if (position >= 0 && position < 200) {
          if (selectedIndex != i) {
            setState(() {
              selectedIndex = i;
            });
          }
        }
      }
    }
  }

  double getHorizontalPadding() {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1200) return width * 0.08;
    if (width >= 800) return width * 0.06;
    return 32;
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_updateCurrentSection);
  }

  @override
  Widget build(BuildContext context) {
    final hPadding = getHorizontalPadding();
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      endDrawer: AppEndDrawer(
        onHomeTap: () => scrollToSection(homeKey),
        onAboutTap: () => scrollToSection(aboutKey),
        onSkillsTap: () => scrollToSection(skillsKey),
        onProjectsTap: () => scrollToSection(projectsKey),
        onExperienceTap: () => scrollToSection(experienceKey),
        onEducationTap: () => scrollToSection(educationKey),
        onContactTap: () => scrollToSection(contactKey),
      ),
      body: Focus(
        autofocus: true,
        onKeyEvent: (node, event) {
          final max = scrollController.position.maxScrollExtent;
          final min = 0.0;

          if (event is KeyDownEvent) {
            if (_holdTimer != null) return KeyEventResult.handled;

            if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
              _holdTimer = Timer.periodic(Duration(milliseconds: 50), (_) {
                final next = scrollController.offset + 25;

                scrollController.jumpTo(next.clamp(min, max));
              });
            }

            if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
              _holdTimer = Timer.periodic(Duration(milliseconds: 50), (_) {
                final prev = scrollController.offset - 25;

                scrollController.jumpTo(prev.clamp(min, max));
              });
            }
          }

          if (event is KeyUpEvent) {
            _holdTimer?.cancel();
            _holdTimer = null;
          }

          return KeyEventResult.handled;
        },
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            /// NAVBAR
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomPresistentHeader(
                max: MediaQuery.of(context).size.height * 0.1,
                min: MediaQuery.of(context).size.height * 0.1,
                child: NavBar(
                  selectedIndex: selectedIndex,
                  onMenuTap: () => scaffoldKey.currentState!.openEndDrawer(),
                  onHomeTap: () => scrollToSection(homeKey),
                  onAboutTap: () => scrollToSection(aboutKey),
                  onSkillsTap: () => scrollToSection(skillsKey),
                  onProjectsTap: () => scrollToSection(projectsKey),
                  onExperienceTap: () => scrollToSection(experienceKey),
                  onEducationTap: () => scrollToSection(educationKey),
                  onContactTap: () => scrollToSection(contactKey),
                ),
              ),
            ),

            /// HOME
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth < 700 ? 0 : hPadding,
              ),

              sliver: SliverToBoxAdapter(
                child: HomeSection(
                  key: homeKey,
                  onGetInTouchPressed: () => scrollToSection(contactKey),
                ),
              ),
            ),

            /// ABOUT
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: hPadding),
              sliver: SliverToBoxAdapter(child: AboutMeSection(key: aboutKey)),
            ),

            /// SKILLS
            SliverToBoxAdapter(child: SkillsSection(key: skillsKey)),

            /// PROJECTS (FULL RESPONSIVE FIX)
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: hPadding),

              sliver: SliverToBoxAdapter(
                child: Column(
                  key: projectsKey,
                  children: [
                    const SizedBox(height: 40),
                    const Center(child: HeadlineText(text: "Projects")),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        // horizontal: hPadding,
                        vertical: 30,
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: ProjectsLocalSource.projects.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 550,
                          mainAxisSpacing: 24,
                          crossAxisSpacing: 24,
                          mainAxisExtent: 420,
                        ),
                        itemBuilder: (context, index) {
                          return ProjectCard(
                            project: ProjectsLocalSource.projects[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// EXPERIENCE
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: hPadding),

              sliver: SliverToBoxAdapter(
                child: Column(
                  key: experienceKey,
                  children: [
                    const Center(
                      child: HeadlineText(text: "Professional Experience"),
                    ),
                    const SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: ExperienceLocalSource().experiences.length,
                      itemBuilder: (context, index) {
                        return ExperienceWidget(
                          experience:
                              ExperienceLocalSource().experiences[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 110.h)),

            /// EDUCATION
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: hPadding),

              sliver: SliverToBoxAdapter(
                child: Column(
                  key: educationKey,
                  children: [
                    const Center(
                      child: HeadlineText(text: "Education & Courses"),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: EducationLocalSource().educationList.length,
                      itemBuilder: (context, index) {
                        return EducationWidget(
                          education:
                              EducationLocalSource().educationList[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            /// CONTACT
            SliverToBoxAdapter(
              child: Column(
                key: contactKey,
                children: [
                  const Center(child: HeadlineText(text: "Get In Touch")),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: hPadding),
                    child: const ContactSection(),
                  ),
                ],
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 60)),
          ],
        ),
      ),
    );
  }
}

class CustomPresistentHeader extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double max;
  final double min;

  CustomPresistentHeader({
    required this.child,
    required this.max,
    required this.min,
  });

  @override
  double get minExtent => min;

  @override
  double get maxExtent => max;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
