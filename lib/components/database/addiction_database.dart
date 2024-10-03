import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:minimal_addiciton_beater/components/database/addiction.dart';
import 'package:path_provider/path_provider.dart';

class AddictionDatabase extends ChangeNotifier {
  static late Isar isar;

  // initalize
  static Future<void> initialize() async {
    final dir = await getApplicationCacheDirectory();
    isar = await Isar.open(
      [AddictionSchema],
      directory: dir.path,
    );
  }

  final List<Addiction> currentAddictions = [];

  Future<void> fetchAddictions() async {
    List<Addiction> fetched = await isar.addictions.where().findAll();
    currentAddictions.clear();
    currentAddictions.addAll(fetched);

    notifyListeners();
  }

  Future<void> addAddiction(String addiction, DateTime date) async {
    final newAddiction = Addiction()
      ..name = addiction
      ..dates.add(date);

    await isar.writeTxn(() => isar.addictions.put(newAddiction));

    fetchAddictions();
  }

  Future<void> deleteAddiction(String addiction) async {
    await isar.writeTxn(() async {
      Addiction? addictionToDelete =
          await isar.addictions.filter().nameEqualTo(addiction).findFirst();

      if (addictionToDelete != null) {
        await isar.addictions.delete(addictionToDelete.id);
      }
    });
  }
}
