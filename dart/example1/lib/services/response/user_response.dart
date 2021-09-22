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

import 'package:simple_form_crud/services/request/user_request.dart';
import 'package:simple_form_crud/models/user.dart';

abstract class CreateUserCallBack {
  void onCreateUserSuccess(int user);
  void onCreateUserError(String error);
}

abstract class GetUserCallBack {
  void onGetUserSuccess(List<User> user);
  void onGetUserError(String error);
}

abstract class DeleteUserCallBack {
  void onDeleteUserSuccess(int user);
  void onDeleteUserError(String error);
}

class CreateUserResponse {
  CreateUserCallBack _callBackCreate;
  UserRequest userRequest = new UserRequest();
  CreateUserResponse(this._callBackCreate);

  doCreate(String username, String password) {
    var fido = User(username, password);
    
    userRequest
        .createUser(fido)
        .then((user) => _callBackCreate.onCreateUserSuccess(user))
        .catchError((onError) => _callBackCreate.onCreateUserError(onError.toString()));
  } 
}

class GetUserResponse {
  GetUserCallBack _callBackGet;
  UserRequest userRequest = new UserRequest();
  GetUserResponse(this._callBackGet);

  doGet() {    
    userRequest
        .getUser()
        .then((user) => _callBackGet.onGetUserSuccess(user))
        .catchError((onError) => _callBackGet.onGetUserError(onError.toString()));
  } 
}

class DeleteUserResponse {
  DeleteUserCallBack _callBackDelete;
  UserRequest userRequest = new UserRequest();
  DeleteUserResponse(this._callBackDelete);

  doDelete(int id) {
    
    userRequest
        .deleteUser(id)
        .then((user) => _callBackDelete.onDeleteUserSuccess(user))
        .catchError((onError) => _callBackDelete.onDeleteUserError(onError.toString()));
  } 
}