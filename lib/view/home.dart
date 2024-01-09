import 'package:dataspot_machine_test/common_widgets/appbar/home_appbar.dart';
import 'package:dataspot_machine_test/common_widgets/card/profile_card.dart';
import 'package:dataspot_machine_test/common_widgets/textfield/common_textfield.dart';
import 'package:dataspot_machine_test/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeState>(context, listen: false).fetchUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    final HomeState homeState = Provider.of<HomeState>(context);
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonTextField(
              hintText: "Search",
              textEditingController: homeState.userSearchController,
              onChanged: (String value) {
                homeState.userSearch();
              },
            ),
          ),
          homeState.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 10),
                      itemCount: homeState.userDetailsList.length,
                      itemBuilder: (BuildContext context, index) {
                        return ProfileCard(
                            name: homeState.userDetailsList[index].name,
                            mobileNumber:
                                homeState.userDetailsList[index].mobile,
                            location: homeState.userDetailsList[index].zone,
                            email: homeState.userDetailsList[index].email,
                            image: homeState.userDetailsList[index].image);
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
