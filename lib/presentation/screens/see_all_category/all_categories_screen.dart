import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management_system/presentation/constants/categories_list.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          flexibleSpace: const FlexibleSpaceBar(
            title: Text('Categories'),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                color: ColorManager.black,
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: categorySeeAllList.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {},
                    tileColor: ColorManager.black,
                    iconColor: ColorManager.darkWhite1,
                    focusColor: ColorManager.darkGrey,
                    hoverColor: ColorManager.darkGrey,
                    textColor: ColorManager.darkWhite1,
                    leading: Icon(Icons.developer_mode),
                    // leading:
                    //     SvgPicture.string(categorySeeAllList[index].picture),
                    title: Text(categorySeeAllList[index].name),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
