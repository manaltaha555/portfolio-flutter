import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/core.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({
    super.key,
    required this.imgPath,
    required this.socialLink,
  });
  final String socialLink;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        await openLink(socialLink);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: AppColors.bgGlass,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: SvgPicture.asset(imgPath, color: AppColors.textPrimary,),
      ),
    );
  }
}
