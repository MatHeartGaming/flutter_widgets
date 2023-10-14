import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: "Busca la comida",
      caption:
          "Nunc eu sem ut metus suscipit ultricies. Donec porttitor ac purus et cursus. Nunc tempor vehicula libero,",
      imageUrl: "assets/images/1.png"),
  SlideInfo(
      title: "Entrega rapida",
      caption:
          "Fusce malesuada risus eget varius varius. Duis placerat scelerisque fermentum.",
      imageUrl: "assets/images/2.png"),
  SlideInfo(
      title: "Disfruta la comida",
      caption:
          "Nulla facilisi. Fusce non dapibus quam. Suspendisse tempus est et leo interdum placerat.",
      imageUrl: "assets/images/3.png"),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = "AppTutorialScreen";
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        endReached = true;
        setState(() {});
      }
      //print("Current page: ${pageViewController.page}");
    });
  }

  @override
  void dispose() {
    pageViewController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: [
              ...slides.map((slide) => _Slide(
                  title: slide.title,
                  caption: slide.caption,
                  imageUrl: slide.imageUrl)),
            ],
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                onPressed: () => context.pop(),
                child: const Text("Salir"),
              )),
          endReached
              ? Positioned(
                  bottom: 50,
                  right: 20,
                  child: FadeInRight(
                    delay: const Duration(milliseconds: 500),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text("Comenzar"),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(imageUrl),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: titleStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            caption,
            style: captionStyle,
          )
        ],
      ),
    );
  }
}
