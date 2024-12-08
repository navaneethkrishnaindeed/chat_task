import 'package:chat_task/domain/utils/responcive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../application/provider.dart';

class ActionTabBat extends ConsumerWidget {
  const ActionTabBat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemtabs = ref.watch(itemsNotifierProvider);
    final selectedtabindex = ref.watch(seletedTabIndexNotifierProvider);

    return Column(
      children: [
        SizedBox(
          height: Responsive.height(4, context),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: itemtabs.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  ref.read(itemsNotifierProvider.notifier).updateSeletedTab(itemtabs[index]);
                  ref.read(seletedTabIndexNotifierProvider.notifier).setIndex(index);
                },
                child: Container(
                  height: 30,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 13),
                  decoration: BoxDecoration(
                    border: Border.all(color: itemtabs[index].isActive ? const Color(0xffD8B4FF) : Colors.transparent),
                    borderRadius: BorderRadius.circular(30),
                    color: itemtabs[index].isActive ? const Color(0xffF6EDFF) : const Color(0xfff5f5f5),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            // left: 3,
                            // right: 5,
                            ),
                        child: SvgPicture.asset(
                          itemtabs[index].image,
                          color: itemtabs[index].isActive ? const Color(0xff7D23E0) : const Color(0xff7C7C7C),
                          height: 30,
                          width: 30,
                        ),
                      ),
                      Text(
                        itemtabs[index].title,
                        style: GoogleFonts.inter(fontSize: 13.6),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
