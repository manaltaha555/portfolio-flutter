import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_colors.dart';

class AppTextTheme {
  static final textTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(
      fontSize: 40.sp.clamp(32, 50),
      fontWeight: FontWeight.w900,
      color: AppColors.accent,
    ),

    headlineMedium:  GoogleFonts.inter(
      fontSize: 20.sp.clamp(16, 22),
      fontWeight: FontWeight.w900,
      color: AppColors.textPrimary,
    ),

    headlineSmall: GoogleFonts.inter(
      fontSize: 12.sp.clamp(10, 14),
      fontWeight: FontWeight.w700,
      color: AppColors.textSecondary,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 24.sp.clamp(20, 28),
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12.sp.clamp(10, 14),
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14.sp.clamp(12, 16),
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),

    bodyLarge: GoogleFonts.inter(
      fontSize: 16.sp.clamp(14, 18),
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),

    titleMedium: GoogleFonts.inter(
      fontSize: 24.sp.clamp(20, 28),
      fontWeight: FontWeight.w900,
      color: AppColors.accent,
    ),

    titleSmall: GoogleFonts.inter(
      fontSize: 18.sp.clamp(16, 22),
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 16.sp.clamp(16, 18),
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 20.sp.clamp(18, 24),
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),

    displaySmall: GoogleFonts.inter(
      fontSize: 10.sp.clamp(8, 12),
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),

    displayLarge: GoogleFonts.inter(
      fontSize: 16.sp.clamp(14, 18),
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),
  );
}
