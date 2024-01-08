import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project1/common/helpers/db_helper.dart';
import 'package:project1/common/models/user_model.dart';

final userProvider = StateNotifierProvider<UserState, List<UserModel>>((ref) {
  return UserState();
});

class UserState extends StateNotifier<List<UserModel>> {
  UserState() : super([]);

  void refresh() async {
    final data = await DBHelper.getUsers();

    state = data.map((e) => UserModel.fromJson(e)).toList();
  }
}
