class UserAccount {
  String username;
  String? avatar;
  String email;
  String targetlang;
  String nativelang;
  int level;
  int coin;
  int streak;
  List<Map<String, dynamic>>? learningprogress;

  UserAccount({
    required this.username,
    this.avatar,
    required this.email,
    required this.level,
    required this.targetlang,
    required this.nativelang,
    required this.coin,
    required this.streak,
    this.learningprogress,
  });
}
