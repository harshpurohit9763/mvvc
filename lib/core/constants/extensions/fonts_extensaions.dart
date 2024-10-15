import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsExtensation extends TextStyle {
  // static TextStyle get montesartTitle => GoogleFonts.montserrat(
  //       fontSize: 22.sp, // ScreenUtil responsive size
  //       // fontWeight: FontWeight.bold,
  //       color: Colors.white,
  //       // color: Colors.black
  //     );

  // static TextStyle get montesartHeading => GoogleFonts.montserrat(
  //       fontSize: 18.sp, // ScreenUtil responsive size
  //       // fontWeight: FontWeight.w600,
  //       color: Colors.white,
  //       // color: Colors.black,
  //     );

  // static TextStyle get montesartButton => GoogleFonts.montserrat(
  //       fontSize: 18.sp, // ScreenUtil responsive size
  //       // fontWeight: FontWeight.bold,
  //       color: Colors.white,
  //     );

  // // Lora Font Styles
  // static TextStyle get loraBodyText => GoogleFonts.lora(
  //       fontSize: 18.sp, // ScreenUtil responsive size
  //       // fontWeight: FontWeight.normal,
  //       color: Colors.white,
  //     );

  // static TextStyle get loraSubtitle => GoogleFonts.lora(
  //       fontSize: 16.sp, // ScreenUtil responsive size
  //       // fontWeight: FontWeight.w600,
  //       color: Colors.white,
  //     );

  // static TextStyle get loraDescription => GoogleFonts.lora(
  //       fontSize: 14.sp, // ScreenUtil responsive size
  //       // fontWeight: FontWeight.normal,
  //       fontStyle: FontStyle.italic, color: Colors.white,
  //     );

  // // Hindi Madhurai Font Styles
  // static TextStyle get hindiMadhuraiTitle => GoogleFonts.hindMadurai(
  //       fontSize: 22.sp, // ScreenUtil responsive size
  //       // fontWeight: FontWeight.bold,
  //       color: Colors.white,
  //     );

  // static TextStyle get hindiMadhuraiBody => GoogleFonts.hindMadurai(
  //       fontSize: 16.sp, // ScreenUtil responsive size
  //       // fontWeight: FontWeight.normal,
  //       color: Colors.white,
  //     );

  // static TextStyle get hindiMadhuraiCaption => GoogleFonts.hindMadurai(
  //       fontSize: 12.sp, // ScreenUtil responsive size
  //       // fontWeight: FontWeight.w500,
  //       color: Colors.white,
  //     );

  // ///////////////////////////////dark
  // static TextStyle get montesartTitledark => GoogleFonts.montserrat(
  //     fontSize: 22.sp, // ScreenUtil responsive size
  //     // fontWeight: FontWeight.bold,
  //     color: Colors.black);

  // static TextStyle get montesartHeadingdark => GoogleFonts.montserrat(
  //       fontSize: 18.sp, // ScreenUtil responsive size
  //       // fontWeight: FontWeight.w600,
  //       color: Colors.black,
  //     );

  // static TextStyle get montesartButtondark => GoogleFonts.montserrat(
  //       fontSize: 18.sp, // ScreenUtil responsive size
  //       color: Colors.black,
  //       // fontWeight: FontWeight.bold,
  //     );

  // // Lora Font Styles
  // static TextStyle get loraBodyTextdark => GoogleFonts.lora(
  //       fontSize: 18.sp, // ScreenUtil responsive size
  //       color: Colors.black,
  //       fontWeight: FontWeight.normal,
  //     );

  // static TextStyle get loraSubtitledark => GoogleFonts.lora(
  //       fontSize: 16.sp, // ScreenUtil responsive size
  //       color: Colors.black,
  //       // fontWeight: FontWeight.w600,
  //     );

  // static TextStyle get loraDescriptiondark => GoogleFonts.lora(
  //       fontSize: 14.sp, // ScreenUtil responsive size
  //       fontWeight: FontWeight.normal,
  //       // fontStyle: FontStyle.italic,
  //     );

  // // Hindi Madhurai Font Styles
  // static TextStyle get hindiMadhuraiTitledark => GoogleFonts.hindMadurai(
  //       fontSize: 22.sp, // ScreenUtil responsive size
  //       color: Colors.black,
  //       // fontWeight: FontWeight.bold,
  //     );

  // static TextStyle get hindiMadhuraiBodydark => GoogleFonts.hindMadurai(
  //       fontSize: 16.sp, // ScreenUtil responsive size
  //       color: Colors.black,
  //       // fontWeight: FontWeight.normal,
  //     );

  // static TextStyle get hindiMadhuraiCaptiondark => GoogleFonts.hindMadurai(
  //     fontSize: 12.sp, // ScreenUtil responsive size
  //     // fontWeight: FontWeight.w500,
  //     color: Colors.black);

  static TextStyle get headingBig => GoogleFonts.montserrat(
        fontSize: 24.sp, // ScreenUtil responsive size
        fontWeight: FontWeight.w500,
      );

  static TextStyle get headingMid => GoogleFonts.montserrat(
        fontSize: 22.sp, // ScreenUtil responsive size
        fontWeight: FontWeight.w500,
      );
  static TextStyle get headingSmall => GoogleFonts.montserrat(
        fontSize: 20.sp, // ScreenUtil responsive size
        fontWeight: FontWeight.w500,
      );

  static TextStyle get bodyTextBig => GoogleFonts.lora(
        fontSize: 22.sp, // ScreenUtil responsive size
        // fontWeight: FontWeight.w500,
      );
  static TextStyle get bodyTextMedium => GoogleFonts.lora(
        fontSize: 18.sp, // ScreenUtil responsive size
        // fontWeight: FontWeight.w500,
      );
  static TextStyle get bodyTextSmall => GoogleFonts.lora(
        fontSize: 16.sp, // ScreenUtil responsive size
        // fontWeight: FontWeight.w500,
      );

  static TextStyle get otherTextBig => GoogleFonts.lora(
        fontSize: 18.sp, // ScreenUtil responsive size
        // fontWeight: FontWeight.w500,
      );
  static TextStyle get otherTextMedium => GoogleFonts.lora(
        fontSize: 16.sp, // ScreenUtil responsive size
        // fontWeight: FontWeight.w500,
      );
  static TextStyle get otherTextSmall => GoogleFonts.lora(
        fontSize: 14.sp, // ScreenUtil responsive size
        // fontWeight: FontWeight.w500,
      );

  static TextStyle get miniText => GoogleFonts.hindMadurai(
        fontSize: 10.sp, // ScreenUtil responsive size
        // fontWeight: FontWeight.w500,
      );

  static TextStyle get buttonText => GoogleFonts.hindMadurai(
      fontSize: 16.sp, // ScreenUtil responsive size
      // fontWeight: FontWeight.w500,
      color: Colors.white);

  static TextStyle get buttonTextBold => GoogleFonts.hindMadurai(
      fontSize: 18.sp, // ScreenUtil responsive size
      fontWeight: FontWeight.w500,
      color: Colors.white);

  static TextStyle get fanticfont => GoogleFonts.coveredByYourGrace(
      fontSize: 36.sp, // ScreenUtil responsive size
      fontWeight: FontWeight.bold,
      color: Colors.black);

  static TextStyle get alertSmall => GoogleFonts.montserrat(
      fontSize: 14.sp, // ScreenUtil responsive size
      color: Colors.red
      // fontWeight: FontWeight.w500,
      );
  //////////////////////////////////////////////////////

  // static TextStyle get headingBigDark => GoogleFonts.montserrat(
  //     fontSize: 24.sp, // ScreenUtil responsive size
  //     // fontWeight: FontWeight.w500,
  //     color: Colors.black);

  // static TextStyle get headingMidDark => GoogleFonts.montserrat(
  //     fontSize: 22.sp, // ScreenUtil responsive size
  //     // fontWeight: FontWeight.w500,
  //     color: Colors.black);
  // static TextStyle get headingSmallDark => GoogleFonts.montserrat(
  //     fontSize: 20.sp, // ScreenUtil responsive size
  //     // fontWeight: FontWeight.w500,
  //     color: Colors.black);

  // static TextStyle get bodyTextBigDark => GoogleFonts.lora(
  //     fontSize: 20.sp, // ScreenUtil responsive size
  //     // fontWeight: FontWeight.w500,
  //     color: Colors.black);
  // static TextStyle get bodyTextMediumDark => GoogleFonts.lora(
  //     fontSize: 18.sp, // ScreenUtil responsive size
  //     // fontWeight: FontWeight.w500,
  //     color: Colors.black);
  // static TextStyle get bodyTextSmallDark => GoogleFonts.lora(
  //     fontSize: 16.sp, // ScreenUtil responsive size
  //     // fontWeight: FontWeight.w500,
  //     color: Colors.black);

  static TextStyle get otherTextBigDark => GoogleFonts.lora(
      fontSize: 18.sp, // ScreenUtil responsive size
      // fontWeight: FontWeight.w500,
      color: Colors.black);
  static TextStyle get otherTextMediumDark => GoogleFonts.lora(
      fontSize: 16.sp, // ScreenUtil responsive size
      // fontWeight: FontWeight.w500,
      color: Colors.black);
  static TextStyle get otherTextSmallDark => GoogleFonts.lora(
      fontSize: 14.sp, // ScreenUtil responsive size
      // fontWeight: FontWeight.w500,
      color: Colors.black);

  // static TextStyle get buttonTextDark => GoogleFonts.hindMadurai(
  //     fontSize: 16.sp, // ScreenUtil responsive size
  //     // fontWeight: FontWeight.w500,
  //     color: Colors.black);
}
