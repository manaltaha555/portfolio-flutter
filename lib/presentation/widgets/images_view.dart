import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/presentation/widgets/animated_container_icon.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesView extends StatefulWidget {
  const ImagesView({
    super.key,
    required this.projectTitle,
    required this.projectImages,
  });
  final String projectTitle;
  final List<String> projectImages;

  @override
  State<ImagesView> createState() => _ImagesViewState();
}

class _ImagesViewState extends State<ImagesView> {
  int currentIndex = 0;
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            if (currentIndex < widget.projectImages.length - 1) {
              setState(() {
                currentIndex += 1;
                _controller.animateToPage(
                  currentIndex,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              });
            }
          }

          if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            if (currentIndex > 0) {
              setState(() {
                currentIndex -= 1;
                _controller.animateToPage(
                  currentIndex,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              });
            }
          }
        }

        return KeyEventResult.handled;
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.projectTitle, style: theme.textTheme.labelSmall),
                AnimatedContainerIcon(
                  icon: Icons.close,
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      bottom: 50,
                      top: 50,
                      child: AnimatedContainerIcon(
                        icon: Icons.arrow_back_ios_new_rounded,
                        onTap: () {
                          if (currentIndex > 0) {
                            setState(() {
                              currentIndex -= 1;
                              _controller.animateToPage(
                                currentIndex,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                              );
                            });
                          }
                        },
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 50,
                      top: 50,
                      child: AnimatedContainerIcon(
                        icon: Icons.arrow_forward_ios_rounded,
                        onTap: () {
                          if (currentIndex < widget.projectImages.length - 1) {
                            setState(() {
                              currentIndex += 1;
                              _controller.animateToPage(
                                currentIndex,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                              );
                            });
                          }
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentGeometry.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: PageView.builder(
                          controller: _controller,
                          onPageChanged: (index) =>
                              setState(() => currentIndex = index),
                          itemCount: widget.projectImages.length,
                          itemBuilder: (contex, index) => InteractiveViewer(
                            minScale: 1,
                            maxScale: 3,
                            child: Image.asset(widget.projectImages[index]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: widget.projectImages.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.accentHover,
                  dotHeight: 10,
                  dotColor: AppColors.bgGlass.withAlpha(50),
                ),
              ),
            ),
            Container(
              height: 100,
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.projectImages.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      if (currentIndex != index) {
                        setState(() {
                          currentIndex = index;
                          _controller.animateToPage(
                            currentIndex,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        });
                      }
                    },
                    child: Container(
                      height: 80,
                      width: 100,
                      margin: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: currentIndex == index
                                  ? Border.all(
                                      color: AppColors.accent,
                                      width: 1.5,
                                    )
                                  : null,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              image: DecorationImage(
                                image: AssetImage(widget.projectImages[index]),
                                fit: BoxFit.cover
                              ),
                            ),
                          ),
                          if (currentIndex == index)
                            Container(color: Colors.black.withAlpha(120)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
