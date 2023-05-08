class LoginResponse {
  String? accessToken;
  String? accessTokenExp;

  LoginResponse({this.accessToken, this.accessTokenExp});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    accessTokenExp = json['access_token_exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['access_token_exp'] = accessTokenExp;
    return data;
  }
}
