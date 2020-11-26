// Essa classe ira carregar e armazenar os projetos temporariamente.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:projeto_up/models/projeto.dart';

class ProjectsService extends GetxService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const colName = "projetos";
  RxBool _loading = false.obs;
  List<Projeto> projectsList = List<Projeto>();

  @override
  void onReady() async {
    await _getProjects();
    super.onReady();
  }

  bool get loading {
    return _loading();
  }

  void _setLoading(bool v) {
    _loading.value = v;
    _loading.refresh();
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

  Future<List<Projeto>> getProjectsById(String startupId) async {
    _setLoading(true);
    QuerySnapshot snap = await _firestore
        .collection(colName)
        .where('id_startup', isEqualTo: startupId)
        .get();
    List<Projeto> _projectsTemp =
        snap.docs.map((e) => Projeto.fromDocument(e)).toList();
    _setLoading(false);
    return _projectsTemp;
  }

  Future<void> saveProject(Projeto projeto) async {
    _setLoading(true);
    await _firestore.collection(colName).add(projeto.toJson());
    _setLoading(false);
  }
}
