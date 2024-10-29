import 'package:get/get.dart';

import '../../../../core/abstractions/data_state.dart';
import '../../../../domain/entities/todo_entity.dart';
import '../../../../domain/usecases/todos/todos_use_case.dart';

class TodosController extends GetxController {

  var activeIndex = 0.obs;
  var errorMessage = ''.obs;
  var todoList = <TodoEntity>[].obs;

  final TodosUseCase _todosUseCase;

  TodosController(this._todosUseCase);

  @override
  void onReady() {
    super.onReady();
    getTodoList();
  }

  Future<void> getTodoList() async {

    activeIndex.value = 0; // show loader indicator

    final result = await _todosUseCase.getTodos(); // Network API request

    _handleResult(result);
  }

  void _handleResult(DataState result) {

    if(result is DataError) { // Response has error. Exception or invalid data.
      _handleDataError(result);
      return;
    }

    // Valid response
    todoList.value = (result as DataSuccess).data as List<TodoEntity>; // Type cast as List of entity
    activeIndex.value = 2; // show data view
  }

  void _handleDataError(DataError error) {
    activeIndex.value = 1; // show error view
    errorMessage.value = error.failure?.errorMessage ?? '';
  }
}