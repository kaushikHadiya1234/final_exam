import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam/Screen/Model/covid_model.dart';
import 'package:final_exam/Screen/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/covid_controller.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {

  CovidController controller = Get.put(CovidController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Bookmark"),
        centerTitle: true,
      ),
      body: StreamBuilder(stream: FirebaseHelper.firebaseHelper.readData(),builder: (context, snapshot) {
        if(snapshot.hasError)
          {
            return Text("Something Worng");
          }
        else if(snapshot.hasData)
          {
            QuerySnapshot<Map<String, dynamic>>? qs = snapshot.data;
            List qsList = qs!.docs;
            List<CovidModel> bookmarkList = [];
            print("================${bookmarkList.length}");
            for (var x in qsList) {
              Map m1 = x.data();
              int? cases = m1['cases'];
              int? active = m1['active'];
              String? country = m1['country'];
              int? critical = m1['critical'];
              int? oneCasePerPeople = m1['oneCasePerPeople'];
              int? deaths = m1['deaths'];
              int? oneDeathPerPeople = m1['oneDeathPerPeople'];
              int? oneTestPerPeople = m1['oneTestPerPeople'];
              int? population = m1['population'];
              int? casesPerOneMillion = m1['casesPerOneMillion'];

              CovidModel m = CovidModel(
                cases:cases,
                active:active,
                critical:critical,
                country: country,
                deaths:deaths,
                oneCasePerPeople:oneCasePerPeople,
                oneDeathPerPeople:oneDeathPerPeople,
                oneTestPerPeople:oneTestPerPeople,
                population:population,
                casesPerOneMillion:casesPerOneMillion,
              );

              bookmarkList.add(m);
            }
            
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed('read',arguments: bookmarkList[index]);
                  },
                  child: ListTile(
                      title: Text("${bookmarkList[index].cases}",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),maxLines: 1,)

                  )
                );
              },
              itemCount: bookmarkList.length,
            );
          }
        return Center(child: CircularProgressIndicator(),);
      },),
    ),);
  }
}
