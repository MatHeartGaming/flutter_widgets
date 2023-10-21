import 'dart:math' show Random;
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfinteScrollScreen extends StatefulWidget {
  static const name = "InfinteScrollScreen";
  const InfinteScrollScreen({super.key});

  @override
  State<InfinteScrollScreen> createState() => _InfinteScrollScreenState();
}

class _InfinteScrollScreenState extends State<InfinteScrollScreen> {
  List<int> imageIds = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true;

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    isMounted = false;
    scrollController.dispose();
  }

  void addFiveImages() {
    final int lastId = imageIds.last;

    imageIds.addAll(
      [1, 2, 3, 4, 5].map((e) => lastId + e),
    );
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) {
      return;
    }
    scrollController.animateTo(scrollController.position.pixels + 180,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn);
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    final random = Random();
    final secondsToLoad = random.nextInt(3);

    await Future.delayed(Duration(seconds: secondsToLoad));
    addFiveImages();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    if (isLoading || !isMounted) return;
    isLoading = true;

    setState(() {});

    final random = Random();
    final secondsToLoad = random.nextInt(3);
    await Future.delayed(Duration(seconds: secondsToLoad));
    final int lastId = imageIds.last;
    imageIds.clear();
    imageIds.add(lastId + 1);
    addFiveImages();

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: SpinPerfect(
          animate: isLoading,
          infinite: true,
          child: Icon(
              isLoading ? Icons.refresh_outlined : Icons.arrow_back_ios_new),
        ),
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: () => onRefresh(),
          child: ListView.builder(
              controller: scrollController,
              itemCount: imageIds.length,
              itemBuilder: (context, index) {
                return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder:
                        const AssetImage("assets/images/jar-loading.gif"),
                    image: NetworkImage(
                        "https://picsum.photos/id/$index/600/300"));
              }),
        ),
      ),
    );
  }
}
