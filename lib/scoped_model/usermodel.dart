class UserModel{
  String uid;
  String email;
  String username;

  UserModel({this.email,this.username,this.uid});

  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      username: map['name']
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'uid': uid,
      'email': email,
      'name': username,
    };
  }
}