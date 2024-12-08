// ignore_for_file: prefer_const_constructors

import 'package:chat_task/domain/constants/asset_paths.dart';
import 'package:chat_task/domain/models/models.dart';
import 'package:chat_task/domain/utils/responcive.dart';
import 'package:chat_task/presentation/course_screen/widgets/action_tab_body.dart';
import 'package:chat_task/presentation/course_screen/widgets/action_tabbar_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../../application/provider.dart';
import '../../domain/constants/app_strings.dart';

class CourseScreen extends ConsumerWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isQuestionBody = ref.watch(questionNotifierProvider);
    final isSubmitValidator = ref.watch(submitQuestionNotifierProvider);
    final qnas = ref.watch(getQnAdataProvider);
    final qnadataNotifier = ref.watch(qnaDataNotifierProvider);
    final isexpandedQuestion = ref.watch(expandedQuestionNotifierProvider);
    final index = ref.watch(selectedIndexNotifierProvider);
        final selectedtabindex = ref.watch(seletedTabIndexNotifierProvider);


    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: isQuestionBody
          ? GestureDetector(
              onTap: () {
                if (isSubmitValidator) {
                  QnAModel data = QnAModel(
                    details: questionDetailsTextEditingController.text,
                    question: questionTextEditingController.text,
                    date: '9th Dec',
                    replies: [],
                    studentName: "Lee Fernadis",
                    studentProfilePic: "https://images.pexels.com/photos/2104252/pexels-photo-2104252.jpeg",
                  );
                  ref.watch(qnaDataNotifierProvider.notifier).addData(data);

                  questionDetailsTextEditingController.text = "";
                  questionTextEditingController.text = "";
                  ref.read(questionNotifierProvider.notifier).setFalse();
                }
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  right: 10,
                  top: 5.h,
                ),
                height: 46.h,
                width: 328.w,
                decoration: BoxDecoration(border: Border.all(color: isSubmitValidator ? Colors.purple : Colors.grey.shade400), borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "Submit",
                  style: GoogleFonts.aBeeZee(fontSize: 18, color: isSubmitValidator ? Colors.purple : Colors.grey.shade600),
                ),
              ),
            )
          : isexpandedQuestion
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                      width: 280.w,
                      child: TextFormField(
                          maxLines: null,
                          controller: replayTextEditingController,
                          decoration: InputDecoration(
                            hintText: "Write a replay",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(width: 3)),
                          )),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    GestureDetector(
                        onTap: () {
                          QnAModel data = QnAModel(
                            details: replayTextEditingController.text,
                            question: "",
                            date: '9th Dec',
                            replies: [],
                            studentName: "Lee Fernadis",
                            studentProfilePic: "https://images.pexels.com/photos/2104252/pexels-photo-2104252.jpeg",
                          );
                          ref.watch(qnaDataNotifierProvider.notifier).addReplay(data: data, index: index);
                          replayTextEditingController.text = '';
                          ref.watch(expandedQuestionNotifierProvider.notifier).setFalse();
                        },
                        child: SvgPicture.asset(AssetPaths.courseScreenAssets.sendIcon))
                  ],
                )
              : SizedBox(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Responsive.width(100, context),
            ),
            Stack(
              children: [
                SizedBox(
                  height: 200.h,
                  width: 375.w,
                  child: Image.asset(
                    AssetPaths.courseScreenAssets.bannerImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Color.fromARGB(149, 76, 68, 82), borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(4),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 4,
                            ),
                            SvgPicture.asset(
                              AssetPaths.courseScreenAssets.people,
                              height: 20,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "34.7K",
                              style: GoogleFonts.inter(color: Colors.white, fontSize: 12),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 17.h,
            ),
            isQuestionBody
                ? NewQuestionWidget()
                : isexpandedQuestion
                    ? Container(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      ref.read(expandedQuestionNotifierProvider.notifier).setFalse();
                                    },
                                    child: Text(
                                      "Back",
                                      style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14.sp),
                                    ),
                                  ),
                                  Text(
                                    "Question",
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
                              height: 18,
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              height: 120.h,
                              // width: 300.w,
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
                                        height: 12.h,
                                      ),
                                      Text(
                                        '${qnas[index].studentName}  ${qnas[index].date}',
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: 10.sp,
                                          color: Color.fromARGB(197, 125, 125, 125),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Column(
                              children: qnas[index].replies.map((e) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 30),
                                  // height: 120.h,
                                  // width: 300.w,
                                  // color: Colors.amber,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          SizedBox(
                                            width: 270.w,
                                            child: Text(
                                              e.details,
                                              style: GoogleFonts.aBeeZee(color: Colors.grey[500], height: 1.6),
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 2,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Text(
                                            '${e.studentName}  ${e.date}',
                                            style: GoogleFonts.aBeeZee(
                                              fontSize: 10.sp,
                                              color: Color.fromARGB(197, 125, 125, 125),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      )
                    : QnaListWidget(context,selectedtabindex),
          ],
        ),
      )),
    );
  }

  Padding QnaListWidget(BuildContext context,int selectedtabindex) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.courseScreenStings.title,
            style: GoogleFonts.aDLaMDisplay(fontSize: 22.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            width: Responsive.width(90, context),
            child: ReadMoreText(Strings.courseScreenStings.courseDesription,
                trimMode: TrimMode.Line,
                trimLength: 200,
                trimLines: 2,
                colorClickableText: Color(0xff7D23E0),
                trimCollapsedText: 'more',
                trimExpandedText: 'Show less',
                style: GoogleFonts.inter(
                  fontSize: 15.sp,
                ),
                moreStyle: GoogleFonts.inter(fontSize: 15.sp, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 18.h,
          ),
          ActionTabBat(),
          // ActionTabBody()
          getTabBody(selectedtabindex)
        ],
      ),
    );
  }

  Widget getTabBody(int number) {
  switch (number) {
    case 0:
      return Column(
        children:const [
          SizedBox(height:250,),
          Center(child: Text("Chat",style: TextStyle(fontSize: 22),)),
        ],
      );
    case 1:
   return ActionTabBody();
    case 2:
      return   Column(
        children:const [
          SizedBox(height:250,),
          Center(child: Text("Notes",style: TextStyle(fontSize: 22),)),
        ],
      );
    case 3:
      return Column(
        children:const [
          SizedBox(height:250,),
          Center(child: Text("Rewards",style: TextStyle(fontSize: 22),)),
        ],
      );
    case 4:
      return Column(
        children:const [
          SizedBox(height:250,),
          Center(child: Text("Share",style: TextStyle(fontSize: 22),)),
        ],
      );
    default:
      return Text(""); // Handles inputs not in the range 0-4
  }
}


}

class NewQuestionWidget extends ConsumerWidget {
  const NewQuestionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
