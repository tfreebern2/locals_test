class Post {
  final int id;
  final int authorId;
  final int communityId;
  final String text;
  final String title;
  final bool likedByUs;
  final bool commentedByUs;
  final bool bookmarked;
  final int timestamp;
  final int totalPostViews;
  final bool isBlured;
  final String authorName;
  final String authorAvatarExtension;
  final String authorAvatarUrl;

  Post(
      {required this.id,
      required this.authorId,
      required this.communityId,
      required this.text,
      required this.title,
      required this.likedByUs,
      required this.commentedByUs,
      required this.bookmarked,
      required this.timestamp,
      required this.totalPostViews,
      required this.isBlured,
      required this.authorName,
      required this.authorAvatarExtension,
      required this.authorAvatarUrl});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        authorId = json['author_id'] ?? 0,
        communityId = json['community_id'] ?? 0,
        text = json['text'] ?? '',
        title = json['title'] ?? '',
        likedByUs = json['liked_by_us'] ?? false,
        commentedByUs = json['commented_by_us'] ?? false,
        bookmarked = json['bookmarked'] ?? false,
        timestamp = json['timestamp'] ?? 0,
        totalPostViews = json['total_post_views'] ?? 0,
        isBlured = json['is_blured'] ?? false,
        authorName = json['author_name'] ?? '',
        authorAvatarExtension = json['author_avatar_extension'] ?? '',
        authorAvatarUrl = json['author_avatar_url'] ?? '';
}
