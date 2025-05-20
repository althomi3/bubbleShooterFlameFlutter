import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LevelService {
  final totalLevels = 3;
  int currentLevel = 0;
  List<int> levelIntensities = [2, 4, 8];

  final RxSet<int> completedLevels = <int>{}.obs;

  final _box = Hive.box('storage');
  static const _completedKey = 'completed_levels';

  Future<void> loadCompletedLevels() async {
    final List<dynamic>? savedList = _box.get(_completedKey);
    completedLevels.value = (savedList ?? []).cast<int>().toSet();
    //print('Loaded from Hive: ${completedLevels.value}');
  }

  Future<void> levelCompleted(int level) async {
    completedLevels.add(level); // Automatically updates UI
    await _box.put(_completedKey, completedLevels.toList());
    //print('Stored in Hive: ${completedLevels.toList()}');
  }

  // use for debugging in combo with a button that triggers functionality
  void debugPrintCompletedLevels() {
    print('Completed Levels: $completedLevels');
    print('Stored in Hive: ${_box.get(_completedKey)}');
  }

}
