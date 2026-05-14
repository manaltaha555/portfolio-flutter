import 'package:flutter/material.dart';

class AppColors {
  static const Color darkBg = Color(0xFF0A0E27);
  static const Color darkerBg = Color(0xFF060918);
  static const Color cardBg = Color(0xFF1A1F3A);
  static const Color bgGlass = Color.fromRGBO(255, 255, 255, 0.05);

  static const Color accent = Color(0xFF6366F1);
  static const Color accentHover = Color(0xFF4F46E5);

  static const Color textPrimary = Color(0xFFE2E8F0);
  static const Color textSecondary = Color(0xFF94A3B8);

  static const Color border = Color(0xFF2D3250);


  //*for navbar
  static final navBar = Color.fromRGBO(10, 10, 15, 0.9);

  
  //*for skills card
  static final skillCardGradient = LinearGradient(colors: [
    Color(0XFF7c3aed),
    Color(0XFFa855f7),
    Color(0XFF8b5cf6)
    
  ]);
  static final skillCardGradientAfterHover = LinearGradient(
  colors: [
    Color(0xFF9F67FF), 
    Color(0xFFE0C3FF),
    Color(0xFFC084FC),
    Color(0xFFA78BFA), 
  ],
  stops: [0.0, 0.4, 0.7, 1.0],
);

  static const shadowSm = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.3),
      offset: Offset(0, 4),
      blurRadius: 6,
    ),
  ];

  static const shadowMd = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.4),
      offset: Offset(0, 10),
      blurRadius: 15,
    ),
  ];

  static const shadowLg = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.6),
      offset: Offset(0, 25),
      blurRadius: 50,
    ),
  ];

  static const shadowPurple = [
    BoxShadow(
      color: Color.fromRGBO(139, 92, 246, 0.4),
      offset: Offset(0, 10),
      blurRadius: 30,
    ),
  ];

  static const shadowGlow = [
    BoxShadow(
      color: Color.fromRGBO(139, 92, 246, 0.3),
      offset: Offset(0, 0),
      blurRadius: 30,
    ),
  ];

  static const hovershadowGlow = [
    BoxShadow(
      color: Color.fromRGBO(124, 58, 237, 0.6),
      offset: Offset(0, 8),
      blurRadius: 35,
    ),
  ];
  // static final projectCardShadow = [
  // BoxShadow(
  //     color: Colors.black.withAlpha(102), 
  //     offset: Offset(0, ), 
  //     blurRadius: 20, // blur
  //   ),
  // ];
}
