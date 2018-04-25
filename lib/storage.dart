import 'package:angular2/core.dart';
import 'package:angular2/src/facade/browser.dart';
import 'package:matpraktika/model.dart';

@Injectable()
class AppStorage {
  void saveResult(Result result) {
    window.localStorage['right'] = result.right.toString();
    window.localStorage['wrong'] = result.wrong.toString();
  }

  Result loadResult() {
    return new Result()
      ..right = int.parse(window.localStorage['right']??"0", onError: (_) => 0)
      ..wrong = int.parse(window.localStorage['wrong']??"0", onError: (_) => 0);
  }

  int loadLevel() {
    return int.parse(window.localStorage['level']??"1", onError: (_) => 1);
  }

  void saveLevel(int level ) {
    window.localStorage['level'] = level.toString();
  }


}