class GetPostsRequestBody {
  final int pageSize;
  final String order;
  final int lpid;

  GetPostsRequestBody(
      {required this.pageSize, required this.order, required this.lpid});

  Map<String, dynamic> toJson() {
    final json = {
      'data': {'page_size': pageSize, 'order': order, 'lpid': lpid}
    };
    return json;
  }
}
