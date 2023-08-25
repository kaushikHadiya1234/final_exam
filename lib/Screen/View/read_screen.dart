import 'package:final_exam/Screen/Model/covid_model.dart';
import 'package:final_exam/Screen/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  CovidModel? model;
 @override
  void initState() {
   
    super.initState();
   model = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${model!.country}"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {
              CovidModel m = CovidModel(
                cases:model!.cases,
                active:model!.active,
                critical:model!.critical,
                deaths:model!.deaths,
                country: model!.country,
                oneCasePerPeople:model!.oneCasePerPeople,
                oneDeathPerPeople:model!.oneDeathPerPeople,
                oneTestPerPeople:model!.oneTestPerPeople,
                population:model!.population,
                casesPerOneMillion:model!.casesPerOneMillion,
              );
              print(m.country);
              FirebaseHelper.firebaseHelper.insert(m);
              Get.snackbar('Suceesfully!', 'Data BookMark');
            }, icon: Icon(Icons.bookmark_outline))
          ],
        ),
        body: Padding(
          padding:  EdgeInsets.all(10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("cases :${model!.cases}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
              SizedBox(height: 10.sp,),
              Text("active :${model!.active}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
              SizedBox(height: 10.sp,),
              Text("critical :${model!.critical}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
              SizedBox(height: 10.sp,),
              Text("activePerOneMillion : ${model!.activePerOneMillion}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
              SizedBox(height: 10.sp,),
              Text("deaths :${model!.deaths}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
              SizedBox(height: 10.sp,),
              Text("oneCasePerPeople :${model!.oneCasePerPeople}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
              SizedBox(height: 10.sp,),
              Text("oneDeathPerPeople :${model!.oneDeathPerPeople}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
              SizedBox(height: 10.sp,),
              Text("oneTestPerPeople :${model!.oneTestPerPeople}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
              SizedBox(height: 10.sp,),
              Text("population :${model!.population}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
              // SizedBox(height: 10.sp,),
              // Text("continent :${model!.continent}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
              SizedBox(height: 10.sp,),
              Text("casesPerOneMillion :${model!.casesPerOneMillion}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
              SizedBox(height: 10.sp,),
              Text("criticalPerOneMillion :${model!.criticalPerOneMillion}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
            ],
          ),
        ),
      ),
    );
  }
}
