import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_11pplg1_14/Models/Team_model.dart';
import 'package:pas1_11pplg1_14/Widget/mycard.dart';
import 'package:pas1_11pplg1_14/Widget/mycolors.dart';
import 'package:pas1_11pplg1_14/controllers/teamData_controller.dart';

class TeamsMenu extends StatelessWidget {
  final TeamdataController controller = Get.put(TeamdataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Team Inggris',
          style: TextStyle(fontWeight: FontWeight.bold, color: colortextW),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 255, 251),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
          ),
          itemCount: controller.teams.length,
          itemBuilder: (context, index) {
            final league = controller.teams[index] as TeamModel;

            return MyCard(
              image: league.image,
              teamname: league.teamName,
              onTap: () => controller.togglelike(index),
              facebook: league.facebook,
              website: league.website,
              twitter: league.twitter,
              liked: controller.liked[index],
              num: index,
            );
          },
        );
      }),
    );
  }
}
