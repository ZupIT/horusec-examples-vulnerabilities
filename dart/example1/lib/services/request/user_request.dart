// Copyright 2021 ZUP IT SERVICOS EM TECNOLOGIA E INOVACAO SA
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:async';

import 'package:simple_form_crud/models/user.dart';
import 'package:simple_form_crud/data/query/user_ctr.dart';

class UserRequest {
  UserCtr con = new UserCtr();

 Future<int> createUser(User user) {
    var result = con.saveUser(user);
    return result;
  }

  Future<List<User>> getUser() {
    var result = con.getAllUser();
    return result;
  }

  Future<int> deleteUser(int user) {
    var result = con.deleteUser(user);
    return result;
  }
}