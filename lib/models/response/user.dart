class User {
  final String username;
  final String email;
  final int userId;
  final String uniqueId;
  final String authToken;
  final int activeSubscriber;
  final int unclaimedGift;

  User(
      {required this.username,
      required this.email,
      required this.userId,
      required this.uniqueId,
      required this.authToken,
      required this.activeSubscriber,
      required this.unclaimedGift});

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        email = json['email'],
        userId = json['user_id'],
        uniqueId = json['unique_id'],
        authToken = json['ss_auth_token'],
        activeSubscriber = json['active_subscriber'],
        unclaimedGift = json['unclaimed_gift'];
}
