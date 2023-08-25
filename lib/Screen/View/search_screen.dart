import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/covid_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  CovidController controller = Get.put(CovidController());

  TextEditingController txtsearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Padding(
        padding:  EdgeInsets.all(10.sp),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: () {
                  Get.back();
                },icon: Icon(Icons.arrow_back)),
                SizedBox(width: 5.w,),
                Expanded(
                  child: TextField(
                    controller: txtsearch,
                    onChanged: (value) {
                      controller.searchFilter(value);
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                        borderSide: BorderSide(color: Colors.grey)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.sp),
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.sp),
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                      hintText: "Search country name"
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Obx(
                () =>  ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed("read",arguments:controller.filterList[index] );
                      },
                      child: ListTile(
                        leading: Container(
                          height: 7.h,
                          width: 7.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            image: DecorationImage(
                              image: NetworkImage("${controller.filterList[index].countryInfo!.flag}"),fit: BoxFit.cover
                            )
                          ),
                        ),
                        title: Text("${controller.filterList[index].country}",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  );
                },itemCount: controller.filterList.length,),
              ),
            ))
          ],
        ),
      ),
    ),);
  }
}
