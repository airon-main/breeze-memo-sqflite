import 'package:breeze_memo/pages/create/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePage extends GetView<CreateController> {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create"),
        backgroundColor: const Color(0xfff0f0f0),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
                labelText: "Title", border: OutlineInputBorder()),
            controller: controller.titleController,
          ),
          TextField(
            decoration: const InputDecoration(
                labelText: "Content", border: OutlineInputBorder()),
            controller: controller.contentController,
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: controller.onSubmit, child: const Text("Submit"))
        ],
      ),
    );
  }
}
