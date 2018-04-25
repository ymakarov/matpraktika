import 'dart:html';
import 'package:angular2/core.dart';
import 'package:matpraktika/model.dart';
import 'package:matpraktika/storage.dart';

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  providers: const [AppStorage]
)
class AppComponent {

  final ProblemFactory problemFactory = new ProblemFactory();
  Result result;
  ProblemXY problem;
  double answer;
  bool showAnswer;
  AppStorage _storage;

  int level = 1;

  AppComponent (this._storage) {
    loadModel();
    createProblem();
  }

  void submit () {
    if (showAnswer) {
      showAnswer = false;
      createProblem();
    } else {
      if (problem.right(answer.toInt())) {
        result.right += 1;
        createProblem();
      } else {
        result.wrong += 1;
        showAnswer = true;
      }
      _storage.saveResult(result);
    }
  }

  void changeLevel() {
    result = new Result();
    createProblem();
    saveModel();
  }

  void saveModel() {
    _storage.saveResult(result);
    _storage.saveLevel(level);
  }

  void loadModel() {
    result = _storage.loadResult();
    level = _storage.loadLevel();
  }

  createProblem() {
    problem = problemFactory.create(level);
    answer = null;
    showAnswer = false;
  }
}
