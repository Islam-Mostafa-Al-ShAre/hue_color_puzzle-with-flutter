import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hue_color_puzzle/controllers/home_screen_controller.dart';
import 'package:hue_color_puzzle/helpers/spaces.dart';
import 'package:hue_color_puzzle/models/Levels.dart';
import 'package:hue_color_puzzle/views/custom_widget/keys_number.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenController _homeScreenController;
  @override
  void initState() {
    if (!Get.isRegistered<HomeScreenController>()) {
      _homeScreenController = Get.put<HomeScreenController>(
          HomeScreenController(),
          permanent: true);
      _homeScreenController.setLevels();
    } else {
      _homeScreenController = Get.find<HomeScreenController>();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedBuilder(
          animation: _homeScreenController,
          builder: ((context, child) {
            return Column(
              children: [
                const VerticalSpace(height: 50),
                KeysNumber(homeScreenController: _homeScreenController),
                const VerticalSpace(height: 150),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5),
                      itemBuilder: (context, index) {
                        Level level = _homeScreenController.levels[index];
                        return InkWell(
                          onTap: () {
                            if (level.isOpen) {
                              _homeScreenController.currentLevel = level;
                              Get.offNamed("/gameScreen");
                            } else {
                              _homeScreenController.openLevel(index);
                            }
                          },
                          child: Container(
                            color: level.isOpen ? Colors.green : primaryColor,
                            child: AnimatedSwitcher(
                              transitionBuilder: (child, animation) {
                                return ScaleTransition(
                                  child: child,
                                  scale: animation,
                                );
                              },
                              duration: const Duration(milliseconds: 400),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  level.isOpen
                                      ? const Icon(
                                          Icons.lock_open,
                                          color: Colors.white,
                                          key: ValueKey("lockOpen"),
                                        )
                                      : const Icon(Icons.lock,
                                          color: Colors.white,
                                          key: ValueKey("lock")),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: level.stars >= 1
                                            ? primaryColor
                                            : Colors.white24,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: level.stars >= 2
                                            ? primaryColor
                                            : Colors.white24,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: level.stars >= 3
                                            ? primaryColor
                                            : Colors.white24,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      itemCount: _homeScreenController.levelCount,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    ));
  }
}

const Color primaryColor = const Color.fromARGB(255, 144, 13, 28);
