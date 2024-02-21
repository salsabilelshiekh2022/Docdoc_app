class UserData {
  final String? token;
  final String? username;

  const UserData({this.token, this.username});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        token: json['token'] as String?,
        username: json['username'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'username': username,
      };
}
