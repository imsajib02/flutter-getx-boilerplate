class AuthEntity {

  final String? accessToken;
  final String? tokenType;

  const AuthEntity({this.accessToken, this.tokenType});

  factory AuthEntity.fromJson(Map<String, dynamic> json) => AuthEntity(
    accessToken: json['access_token'] as String?,
    tokenType: json['token_type'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'token_type': tokenType,
  };

  String get keyWithToken => '$tokenType $accessToken';
}