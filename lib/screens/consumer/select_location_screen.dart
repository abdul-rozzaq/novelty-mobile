import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novelty/controllers/app_controller.dart';
import 'package:novelty/models/location_models.dart';
import 'package:novelty/models/user_model.dart';
import 'package:novelty/services/local_storage.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  District? location = Get.find<AppController>().district;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData().copyWith(color: Colors.black),
        title: const Text(
          'Sizning joylashuvingiz',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: GetBuilder<AppController>(
        init: AppController(),
        builder: (controller) => ListView.builder(
          itemCount: controller.regions.length,
          itemBuilder: (context, index) {
            Region region = controller.regions[index];

            return ExpansionTile(
              shape: Border.all(color: Colors.transparent),
              title: Text(region.name),
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: region.districts.length,
                  itemBuilder: (context, index) {
                    District district = region.districts[index];

                    return ListTile(
                      contentPadding: const EdgeInsets.only(left: 40, right: 16),
                      title: Text(
                        district.name,
                        style: TextStyle(color: location == district ? Theme.of(context).primaryColor : null),
                      ),
                      trailing: Radio(
                        activeColor: Theme.of(context).primaryColor,
                        value: district,
                        groupValue: location,
                        onChanged: (x) => setState(() => location = x),
                      ),
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          User user = Get.find<UserService>().get();

          user.district = location;

          Get.find<UserService>().save(user);
          Get.find<AppController>().loadUser();

          Get.back();
        },
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'Saqlash',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
