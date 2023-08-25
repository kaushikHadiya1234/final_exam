
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam/Screen/Model/covid_model.dart';

class FirebaseHelper
{
  static FirebaseHelper firebaseHelper = FirebaseHelper();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void insert(CovidModel model)
  {
    firestore.collection("Countries").add({
      "cases":model.cases,
      "country":model.country,
      "active":model.active,
      "critical":model.critical,
      "deaths":model.deaths,
      "oneCasePerPeople":model.oneCasePerPeople,
      "oneDeathPerPeople":model.oneDeathPerPeople,
      "oneTestPerPeople":model.oneTestPerPeople,
      "population":model.population,
      "casesPerOneMillion":model.casesPerOneMillion,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readData()
  {
    return firestore.collection("Countries").snapshots();
  }

}
