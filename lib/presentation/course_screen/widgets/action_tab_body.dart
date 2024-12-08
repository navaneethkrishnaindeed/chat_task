import 'package:chat_task/domain/constants/asset_paths.dart';
import 'package:chat_task/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../application/provider.dart';

class ActionTabBody extends ConsumerWidget {
  const ActionTabBody({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemtabs = ref.watch(itemsNotifierProvider);
    final qnas = ref.watch(getQnAdataProvider);
    final isQuestionBody = ref.watch(questionNotifierProvider);
    return QuestionListBody(qnas, ref);
  }

  Column QuestionListBody(List<QnAModel> qnas, WidgetRef ref) {
    final isexpandedQuestion = ref.watch(expandedQuestionNotifierProvider);

    return Column(
      children: [
        SizedBox(
          height: 18.h,
        ),
        Row(
          children: [
            Text(
              "Q&A",
              style: GoogleFonts.aBeeZee(fontSize: 18.sp),
            ),
            const Spacer(),
            Text(
              "see all",
              style: GoogleFonts.aBeeZee(color: Colors.purple, fontSize: 14, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 18.h,
        ),
        SizedBox(
          height: 320.h,
          child: ListView.builder(
            // physics:const NeverScrollableScrollPhysics(),
            itemCount: qnas.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                print("0$isexpandedQuestion");
                ref.watch(selectedIndexNotifierProvider.notifier).setActiveIndexas(index);
                ref.read(expandedQuestionNotifierProvider.notifier).setTrue();
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                height: 120.h,
                width: 300.w,
                // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(AssetPaths.courseScreenAssets.face),
                          radius: 20.r,
                        ),
                        // Expanded(child: SizedBox())
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '@${qnas[index].studentName}',
                          style: GoogleFonts.aBeeZee(
                            fontSize: 10.sp,
                            color: Color.fromARGB(197, 125, 125, 125),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          width: 270.w,
                          child: Text(
                            qnas[index].question,
                            style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w600, height: 1.5),
                          ),
                        ),
                        SizedBox(
                          width: 270.w,
                          child: Text(
                            qnas[index].details,
                            style: GoogleFonts.aBeeZee(color: Colors.grey[500], height: 1.6),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          '${qnas[index].replies.length} Replies',
                          style: GoogleFonts.aBeeZee(color: Colors.purple),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            ref.read(questionNotifierProvider.notifier).setTrue();
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 5.h,
            ),
            height: 46.h,
            width: 300.w,
            decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(15)),
            child: Text(
              "Ask a Question",
              style: GoogleFonts.aBeeZee(fontSize: 18),
            ),
          ),
        )
      ],
    );
  }

  Column QnA_Section(List<QnAModel> qnas) {
    return Column(
      children: [
        SizedBox(
          height: 18.h,
        ),
        Row(
          children: [
            Text(
              "Q&A",
              style: GoogleFonts.aBeeZee(fontSize: 18.sp),
            ),
            const Spacer(),
            Text(
              "see all",
              style: GoogleFonts.aBeeZee(color: Colors.purple, fontSize: 14, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 18.h,
        ),
        SizedBox(
          height: 320.h,
          child: ListView.builder(
            // physics:const NeverScrollableScrollPhysics(),
            itemCount: qnas.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(5),
              height: 120.h,
              width: 300.w,
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(AssetPaths.courseScreenAssets.face),
                        radius: 20.r,
                      ),
                      // Expanded(child: SizedBox())
                    ],
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '@${qnas[index].studentName}',
                        style: GoogleFonts.aBeeZee(
                          fontSize: 14.sp,
                          color: Color.fromARGB(197, 125, 125, 125),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 270.w,
                        child: Text(
                          qnas[index].question,
                          style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w600, height: 1.5),
                        ),
                      ),
                      SizedBox(
                        width: 270.w,
                        child: Text(
                          qnas[index].details,
                          style: GoogleFonts.aBeeZee(color: Colors.grey[500], height: 1.6),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        '${qnas[index].replies.length} Replies',
                        style: GoogleFonts.aBeeZee(color: Colors.purple),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 5.h,
          ),
          height: 46.h,
          width: 300.w,
          decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(15)),
          child: Text(
            "Ask a Question",
            style: GoogleFonts.aBeeZee(fontSize: 18),
          ),
        )
      ],
    );
  }
}
