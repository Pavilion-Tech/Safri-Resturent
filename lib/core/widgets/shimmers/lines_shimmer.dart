import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'default_shimmer.dart';

class LinesShimmer extends StatelessWidget {
  const LinesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (c,i)=>CustomShimmer(height: 10,radius: 4,),
        separatorBuilder: (c,i)=>const Gap(30),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 20
    );
  }
}