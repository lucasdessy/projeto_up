// Essa classe ira carregar e armazenar as startups temporariamente.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:projeto_up/models/startup.dart';

class StartupService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const colName = "startups";
  final RxBool _loading = false.obs;
  Map<String, List<Startup>> startups = Map<String, List<Startup>>();
  List<Startup> startupsList = List<Startup>();
  @override
  void onReady() async {
    await _getCompanies();
    super.onReady();
  }

  bool get loading {
    return _loading();
  }

  void _setLoading(bool v) {
    _loading.value = v;
    _loading.refresh();
  }

  Future<void> _getCompanies() async {
    _setLoading(true);
    startups = Map<String, List<Startup>>(); // Reset
    startupsList = List<Startup>(); // Reset
    QuerySnapshot snap = await _firestore.collection(colName).get();
    List<Startup> _startupsTemp =
        snap.docs.map((e) => Startup.fromDocument(e)).toList();
    for (final _startup in _startupsTemp) {
      startupsList.add(_startup);
      if (startups[_startup.segmento] != null) {
        startups[_startup.segmento].add(_startup);
      } else {
        startups[_startup.segmento] = List<Startup>();
        startups[_startup.segmento].add(_startup);
      }
    }
    _setLoading(false);
  }

  Future<void> reloadCompanies() async {
    await _getCompanies();
  }

  Future<Startup> getStartup(String startupId) async {
    _setLoading(true);
    DocumentSnapshot snap =
        await _firestore.collection(colName).doc(startupId).get();
    Startup _tempStartup = Startup.fromDocument(snap);
    _setLoading(false);
    return _tempStartup;
  }

  Future<String> uploadStartup(Startup _startup) async {
    _setLoading(true);
    DocumentReference ref =
        await _firestore.collection(colName).add(_startup.toJson());
    _setLoading(false);
    return ref.id;
  }
}
