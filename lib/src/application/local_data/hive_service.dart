import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    // Hive.registerAdapter(LogMeasureListModelAdapter());
    // await Hive.openBox<LogMeasureListModel>('logMeasureBox');

    // Uncomment and register additional adapters if needed
    // Hive.registerAdapter(UserModelAdapter());
    // Hive.registerAdapter(AddressAdapter());
    // Hive.registerAdapter(GeoAdapter());
    // Hive.registerAdapter(CompanyAdapter());
  }

  // static Future<void> clearAllData() async {
  //   try {
  //     // List all box names used in the application
  //     final boxNames = ['logMeasureBox']; // Add more box names as needed
  //
  //     // Iterate through the list and clear each open box
  //     for (var boxName in boxNames) {
  //       if (Hive.isBoxOpen(boxName)) {
  //         // If the box is already open, retrieve it
  //         var box = Hive.box(boxName);
  //         await box.clear();
  //       } else {
  //         // If the box is not open, open it, clear it, and then close it
  //         var box = await Hive.openBox(boxName);
  //         await box.clear();
  //         await box.close();
  //       }
  //     }
  //     print("All Hive data cleared successfully.");
  //   } catch (e) {
  //     print("Error while clearing Hive data: $e");
  //   }
  // }
  //
  // static Future<void> clearBoxData(String boxName) async {
  //   try {
  //     // Check if the box is already open
  //     if (Hive.isBoxOpen(boxName)) {
  //       // Get the open box and clear it
  //       var box = Hive.box(boxName);
  //       await box.clear();
  //       print("Data cleared from box: $boxName");
  //     } else {
  //       // If the box is not open, open it, clear it, and close it
  //       var box = await Hive.openBox(boxName);
  //       await box.clear();
  //       await box.close();
  //       print("Data cleared from box: $boxName and box closed.");
  //     }
  //   } catch (e) {
  //     print("Error while clearing data from box $boxName: $e");
  //   }
  // }


}

