import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:minimal_addiciton_beater/components/database/addiction.dart';
import 'package:path_provider/path_provider.dart';

class AddictionDatabase extends ChangeNotifier {
  static late Isar isar;

  int _currentIndex = 0;
  get currentIndex {
    return _currentIndex;
  }

  set currentIndex(val) {
    _currentIndex = val;
    notifyListeners();
  }

  Future<void> fetchAddictionsNoNoti() async {
    List<Addiction> fetched = await isar.addictions.where().findAll();
    currentAddictions.clear();
    currentAddictions.addAll(fetched);
  }

  Future<void> fetchAddictions() async {
    List<Addiction> fetched = await isar.addictions.where().findAll();
    currentAddictions.clear();
    currentAddictions.addAll(fetched);

    notifyListeners();
  }

  // initalize
  static Future<void> initialize() async {
    final dir = await getApplicationCacheDirectory();
    isar = await Isar.open(
      [AddictionSchema],
      directory: dir.path,
    );
  }

  final List<Addiction> currentAddictions = [];

  Future<void> addAddiction(String addiction, DateTime date) async {
    final newAddiction = Addiction()
      ..name = addiction
      ..dates = [date]
      ..startDate = date;

    await isar.writeTxn(() => isar.addictions.put(newAddiction));

    await fetchAddictions();
  }

  Future<void> deleteAddiction(String addiction) async {
    await isar.writeTxn(() async {
      Addiction? addictionToDelete =
          await isar.addictions.filter().nameEqualTo(addiction).findFirst();

      if (addictionToDelete != null) {
        await isar.addictions.delete(addictionToDelete.id);
      }
    });

    fetchAddictions();
  }

  Future<void> clearDatabase() async {
    await isar.writeTxn(() => isar.addictions.clear());
  }
}
