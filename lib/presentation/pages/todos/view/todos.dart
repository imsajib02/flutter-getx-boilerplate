import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/localization_constants.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../components/appbar/my_app_bar.dart';
import '../../../components/cards/todo_card.dart';
import '../../../components/others/error_view.dart';
import '../../../components/others/loader.dart';
import '../../../getx/todos/controller/todos_controller.dart';

class Todos extends StatelessWidget {

  final _controller = Get.find<TodosController>();

  Todos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          title: strMyTodoList.tr,
          backButtonEnabled: false,
          onBackPressed: () {},
        ),
        body: Obx(() => IndexedStack(
          index: _controller.activeIndex.value,
          children: [

            const Loader(),

            ErrorView(
              errorMessage: _controller.errorMessage.value,
              onBtnPressed: () => _controller.getTodoList(),
            ),

            _buildTodoList(),
          ],
        )),
      ),
    );
  }

  Widget _buildTodoList() {

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: _controller.todoList.length,
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      separatorBuilder: (context, index) => 5.h,
      itemBuilder: (context, index) {

        return TodoCard(
          todo: _controller.todoList[index],
        );
      },
    );
  }
}
