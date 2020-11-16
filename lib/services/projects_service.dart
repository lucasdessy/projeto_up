import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:projeto_up/models/projeto.dart';

class ProjectsService extends GetxService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const colName = "projetos";
  RxBool loading = false.obs;
  List<Projeto> projectsList = List<Projeto>();

  @override
  void onReady() async {
    await _getProjects();
    super.onReady();
  }

  void _setLoading(bool v) {
    loading.value = v;
    loading.refresh();
  }

  Future<void> _getProjects() async {
    _setLoading(true);
    projectsList = List<Projeto>(); // Reset
    QuerySnapshot snap = await _firestore.collection(colName).get();
    List<Projeto> _projectsTemp =
        snap.docs.map((e) => Projeto.fromDocument(e)).toList();
    projectsList = _projectsTemp;
    _setLoading(false);
  }

  Future<void> reloadProjects() async {
    await _getProjects();
  }
}
