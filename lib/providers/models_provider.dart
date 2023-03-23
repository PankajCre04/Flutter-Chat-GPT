import 'package:chat_gpt/models/models_model.dart';
import 'package:chat_gpt/services/api_services.dart';
import 'package:flutter/cupertino.dart';

class ModelsProvider extends ChangeNotifier {
  List<ModelsModel> modelList = [];
  String currentModel = "text-davinci-003";
  List<ModelsModel> get getModelsList {
    return modelList;
  }

  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  Future<List<ModelsModel>> getAllModels() async {
    modelList = await ApiServices.getModels();
    notifyListeners();
    return modelList;
  }
}
