

class UserModel {
  int? id;
  String? name;
  String? email;
  UserModel({
    this.id,
    this.name,
    this.email,
  });

   

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

 

  

  


    static List<UserModel> fromJsonList(dynamic jsonList) {
    final userList = <UserModel>[];
    if (jsonList == null) return userList;

    if (jsonList is List<dynamic>) {
      for (final json in jsonList) {
        userList.add(
          UserModel.fromMap(json),
        );
      }
    }
    return userList;
  }
}
