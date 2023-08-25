
import 'package:final_exam/Screen/Model/covid_model.dart';
import 'package:final_exam/Screen/utils/api_helper.dart';
import 'package:get/get.dart';

class CovidController extends GetxController
{

  RxList<CovidModel> dataList = <CovidModel>[].obs;
  RxList<CovidModel> searchList = <CovidModel>[].obs;
  RxList<CovidModel> filterList = <CovidModel>[].obs;

  Future<void> getData()
  async {
    dataList.value = await ApiHelper.apiHelper.getApiData() as List<CovidModel>;
    print("==================${dataList.length}");
    update();
  }

  void searchFilter(String search)
  {
    searchList.clear();
    if(search.isEmpty)
    {
      searchList.value = List.from(dataList);
    }
    else
    {
      for(var c1 in dataList)
      {
        if( c1.country!.toLowerCase().contains(search.toLowerCase()))
        {
          searchList.add(c1);
        }
        filterList.value = List.from(searchList);
      }
    }
    update();
  }
}