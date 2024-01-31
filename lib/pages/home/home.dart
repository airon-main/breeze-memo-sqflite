import 'package:breeze_memo/pages/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.createNote,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: const Color(0xfff0f0f0),
      ),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.notes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.notes[index].title),
                      subtitle: Text(controller.notes[index].content),
                      trailing: PopupMenuButton(
                          itemBuilder: (BuildContext context) => [
                                PopupMenuItem(
                                  child: Text("Edit"),
                                  onTap: () => controller.updateNote(index),
                                ),
                                PopupMenuItem(
                                  child: const Text("Delete"),
                                  onTap: () => controller
                                      .deleteNote(controller.notes[index].id!),
                                ),
                              ]),
                    );
                  }),
        ),
      ),
    );
  }
}
