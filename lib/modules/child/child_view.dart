import 'package:conditional_builder/conditional_builder.dart';
import 'package:elshaima/models/elshaima_app/child_model.dart';
import 'package:elshaima/modules/child/cubit/cubit.dart';
import 'package:elshaima/modules/child/cubit/statas.dart';
import 'package:elshaima/modules/home/home_view.dart';

import 'package:elshaima/shared/components/components.dart';

import 'package:elshaima/shared/styles/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildScreen extends StatelessWidget {
  static final routname = "/child";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.14),
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "الطفل",
                alignment: Alignment.center,
                fontSize: 30,
                color: Colors.white,
                fontweight: FontWeight.w900,
              ),
            ],
          ),
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) => ElshaimaChildCubit()..getChildData(),
        child: BlocConsumer<ElshaimaChildCubit, ElshaimaChildStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var model = ElshaimaChildCubit.get(context).elshaimaChildModel;

            return ConditionalBuilder(
              condition: model != null ?? null,
              builder: (context) => ChildFather(
                  ElshaimaChildCubit.get(context).elshaimaChildModel, height),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ChildFather(ElshaimaChildModel model, double height) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: Container(
            child: GestureDetector(
              onTap: ()=>navigateTo(context,HomeScreen()),
              child: Card(
                elevation: 1,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                        backgroundColor: primaryColor,
                        radius: 22,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${model.data.kids[index].name}",
                        fontSize: 22,
                        color: primaryColor,
                        fontweight: FontWeight.bold,
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "دار الشيماء لتحفيظ القران الكريم",
                        fontSize: 26,
                        color: kColor,
                        fontweight: FontWeight.w700,
                        alignment: Alignment.center,
                        fontFamily: 'ArefRuqaa',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            height: height * 0.3,
          ),
        ),
        itemCount: model.data.kids.length,
      ),
    );
  }
}

//
// import 'package:conditional_builder/conditional_builder.dart';
// import 'package:elshaima/models/elshaima_app/child_model.dart';
// import 'package:elshaima/modules/child/cubit/cubit.dart';
// import 'package:elshaima/modules/child/cubit/statas.dart';
//
// import 'package:elshaima/shared/components/components.dart';
//
//
// import 'package:elshaima/shared/styles/colors.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ChildScreen extends StatefulWidget {
//   static final routname = "/child";
//
//   @override
//   _ChildScreenState createState() => _ChildScreenState();
// }
//
// class _ChildScreenState extends State<ChildScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(height * 0.14),
//         child: Container(
//           decoration: BoxDecoration(
//             color: primaryColor,
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(40),
//               bottomRight: Radius.circular(40),
//             ),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CustomText(
//                 text: "الطفل",
//                 alignment: Alignment.center,
//                 fontSize: 30,
//                 color: Colors.white,
//                 fontweight: FontWeight.w900,
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: MultiBlocProvider(
//         providers: [
//           BlocProvider(
//             create: (BuildContext context) =>
//             ElshaimaChildCubit()..getChildData(),
//           ),
//         ],
//         child: BlocConsumer<ElshaimaChildCubit, ElshaimaChildStates>(
//           listener: (context, state) {},
//           builder: (context, state) {
//             var model = ElshaimaChildCubit.get(context).elshaimaChildModel;
//
//             return ConditionalBuilder(
//               condition: model != null ?? null,
//               builder: (context) => ChildFather(
//                   ElshaimaChildCubit.get(context).elshaimaChildModel),
//               fallback: (context) => Center(child: CircularProgressIndicator()),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   // ignore: non_constant_identifier_names
//   Widget ChildFather(ElshaimaChildModel model) {
//     return Container(
//       child: ListView.builder(
//         itemBuilder: (context, index) => ListTile(
//
//           leading: Text("${model.data.kids[index].name}"),
//         ),
//         itemCount: model.data.kids.length,
//       ),
//     );
//   }
// }
