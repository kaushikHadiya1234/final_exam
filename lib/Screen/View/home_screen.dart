import 'package:final_exam/Screen/controller/covid_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CovidController controller = Get.put(CovidController());

  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          title: Text("Covid 19"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {
              Get.toNamed('bmark');
            }, icon: Icon(Icons.bookmark)),
            IconButton(onPressed: () {
              Get.toNamed('search');
            }, icon: Icon(Icons.search)),
          ],
        ),
        drawer: Drawer(),
        body:  Obx(
          () =>  Padding(
            padding:  EdgeInsets.only(top: 5.sp),
            child: GridView.builder(
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisExtent: 15.h),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed('read',arguments: controller.dataList[index]);
                    },
                    child: Column(mainAxisSize: MainAxisSize.min,children: [
                      Container(
                        height: 10.h,
                        width: 10.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          image: DecorationImage(
                            image: NetworkImage("${controller.dataList[index].countryInfo!.flag}"),fit: BoxFit.cover
                          )
                        ),
                      ),
                      SizedBox(height: 10.sp,),
                      Text("${controller.dataList[index].country}",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),maxLines: 1,)
                    ],),
                  );
                },
                itemCount: controller.dataList.length,
              ),
          ),
        ),
        ),
    );
  }
}
