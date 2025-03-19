import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/project_tags_controller.dart';

class ProjectTagsView extends GetView<ProjectTagsController> {
  const ProjectTagsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProjectTagsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProjectTagsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
