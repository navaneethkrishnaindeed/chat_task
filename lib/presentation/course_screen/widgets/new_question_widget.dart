

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../application/provider.dart';
import '../../../domain/constants/app_strings.dart';

class NewQuestionWidget extends ConsumerWidget {
  const NewQuestionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      ref.read(questionNotifierProvider.notifier).setFalse();
                    },
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14.sp),
                    ),
                  ),
                  Text(
                    "New Question",
                    style: GoogleFonts.inter(fontSize: 18.sp),
                  ),
                  Text(
                    "          ",
                    style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Divider(
              color: Colors.grey[300],
            ),
            SizedBox(
              height: 18.h,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all()),
              alignment: Alignment.centerLeft,
              child: Text(
                "24.${Strings.courseScreenStings.title}",
                style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            TextField(
              controller: questionTextEditingController,
              style: GoogleFonts.aBeeZee(fontSize: 20),
              decoration: InputDecoration(
                hintText: "Question Title",
                hintStyle: GoogleFonts.aBeeZee(fontSize: 20),
                border: UnderlineInputBorder(borderSide: BorderSide(width: 0.1)),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            TextFormField(
              onChanged: (value) {
                if (questionTextEditingController.text != "") {
                  ref.watch(submitQuestionNotifierProvider.notifier).setTrue();
                }
              },
              maxLines: null,
              controller: questionDetailsTextEditingController,
              style: GoogleFonts.aBeeZee(fontSize: 20),
              decoration: InputDecoration(
                hintText: "Details",
                hintStyle: GoogleFonts.aBeeZee(fontSize: 20),
                border: UnderlineInputBorder(borderSide: BorderSide(width: 0.1)),
              ),
            ),
            SizedBox(
              height: 200.h,
            ),
          ],
        ),
      );
  }
}
