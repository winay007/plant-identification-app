import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class ImageClassificaion {
  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  Future<String?> classifyImage(XFile image) async {
    var _output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 4,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    if (_output == null) return "Unable to identify image";
    String label = _output[0]['label'];
    double maxConfidence = _output[0]['confidence'];
    print(_output.length);

    for (int i = 0; i < _output.length; i++) {
      if (_output[0]['confidence'] > maxConfidence) {
        print(_output[i]['confidence']);
        print(_output[i]["label"]);
        print("------------------------");
        maxConfidence = _output[i]['confidence'];
        label = _output[i]['label'];
      }
    }
    print(label);
    return label;
  }
}
