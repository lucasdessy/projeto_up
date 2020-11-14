// Essa classe ira carregar e armazenar as startups temporariamente.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:projeto_up/models/startup.dart';

class StartupService extends GetxService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const colName = "startups";
  RxBool loading = false.obs;
  Map<String, List<Startup>> startups = Map<String, List<Startup>>();

  @override
  void onReady() async {
    _getCompanies();
    super.onReady();
  }

  void _setLoading(bool v) {
    loading.value = v;
  }

  void _getCompanies() async {
    _setLoading(true);
    QuerySnapshot snap = await _firestore.collection(colName).get();
    List<Startup> _startupsTemp =
        snap.docs.map((e) => Startup.fromDocument(e)).toList();
    for (final _startup in _startupsTemp) {
      if (startups[_startup.segmento] != null) {
        startups[_startup.segmento].add(_startup);
      } else {
        startups[_startup.segmento] = List<Startup>();
        startups[_startup.segmento].add(_startup);
      }
    }
    _setLoading(false);
  }
}
