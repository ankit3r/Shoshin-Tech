import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:shoshin_tech/model/event_model.dart';
import 'package:shoshin_tech/model/task_model.dart';

class AllOfferController extends GetxController {
  RxList<TaskModel> tasks = <TaskModel>[].obs;
  RxList<EventModel> event = <EventModel>[].obs;

  Future<Color?> getImageDominantColor(String imageUrl) async {
    final ImageProvider imageProvider = NetworkImage(imageUrl);
    final paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor?.color;
  }

  Future<List<TaskModel>> parseTasksFromAsset() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/json/dummy_tasks.json');

      List<dynamic> jsonList = json.decode(jsonString);
      tasks.value = jsonList.map((json) => TaskModel.fromJson(json)).toList();
      return tasks;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<EventModel>> getEvent() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/json/dummy_details.json');

      List<dynamic> jsonList = json.decode(jsonString);
      event.value = jsonList.map((json) => EventModel.fromJson(json)).toList();

      return event;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onInit() async {
    await parseTasksFromAsset();
    await getEvent();
    super.onInit();
  }
}
