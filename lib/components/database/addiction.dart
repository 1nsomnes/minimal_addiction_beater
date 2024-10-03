import 'package:isar/isar.dart';

// lined needed to generate file
// then run: dart run build_runner build
part 'addiction.g.dart';

@Collection()
class Addiction {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;

  late List<DateTime> dates;
}
