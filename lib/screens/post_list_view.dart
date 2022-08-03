import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:locals_test/api/locals_api.dart';
import 'package:locals_test/models/request/get_posts_request_body.dart';
import 'package:locals_test/models/response/post.dart';
import 'package:locals_test/models/response/user.dart';
import 'package:locals_test/screens/widgets/network_error.dart';
import 'package:locals_test/screens/widgets/post_tile.dart';
import 'package:locals_test/theme/primary_theme.dart';

class PostListView extends StatefulWidget {
  const PostListView({Key? key}) : super(key: key);

  @override
  State<PostListView> createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> {
  final _scrollController = ScrollController();
  int pageSize = 10;
  String order = 'recent';
  int lpid = 0;
  int lastLpid = 0;
  List<int> lpidList = <int>[0];

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;
    final api = LocalsApi();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Sort by: ', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 5),
                DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                  value: order,
                  onChanged: (String? text) {
                    setState(() {
                      order = text as String;
                      lpid = 0;
                      lastLpid = 0;
                      lpidList = <int>[0];
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                        value: 'recent',
                        child: Text('Recent', style: TextStyle(fontSize: 16))),
                    DropdownMenuItem(
                        value: 'oldest',
                        child: Text('Oldest', style: TextStyle(fontSize: 16)))
                  ],
                ))
              ],
            ),
            Expanded(
              child: FutureBuilder(
                  future: api.getPosts(
                      user,
                      GetPostsRequestBody(
                          pageSize: pageSize, order: order, lpid: lpid)),
                  builder: (context, AsyncSnapshot<List<Post>> snapshot) {
                    if (snapshot.hasData) {
                      lastLpid = snapshot.data![snapshot.data!.length - 1].id;
                      return ListView.builder(
                          controller: _scrollController,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final post = snapshot.data![index];
                            return PostTile(post: post);
                          });
                    } else if (snapshot.hasError) {
                      return const Center(child: NetworkError());
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            )
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                  width: 1, color: PrimaryTheme.primary.colorScheme.outline),
            ),
          ),
          child: Row(
            children: [
              if (lpid != 0)
                IconButton(
                    onPressed: () async {
                      setState(() {
                        final index = lpidList.indexOf(lpid);
                        if (index > 0) {
                          final prevLpid = lpidList[index - 1];
                          lpid = prevLpid;
                        } else {
                          lpid = 0;
                        }
                      });
                      _scrollToTop();
                    },
                    icon: const Icon(Icons.navigate_before)),
              const Spacer(),
              IconButton(
                  onPressed: () async {
                    setState(() {
                      lpid = lastLpid;
                      if (!lpidList.contains(lastLpid)) {
                        lpidList.add(lastLpid);
                      }
                    });
                    _scrollToTop();
                  },
                  icon: const Icon(Icons.navigate_next))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _scrollToTop() async {
    await Future.delayed(const Duration(milliseconds: 300));
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(_scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn);
    });
  }
}
