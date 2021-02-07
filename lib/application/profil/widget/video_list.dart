import 'package:auto_size_text/auto_size_text.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/container/dnb_add_post.dart';
import 'package:dnbapp/application/container/dnb_play_post.dart';
import 'package:dnbapp/application/profil/profil_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class ProfilVideoList extends HookWidget {
  final ProfilState state;
  const ProfilVideoList(this.state, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(
        initialPage: state.posts.length - 1, viewportFraction: 1.5);
    return LayoutBuilder(
      builder: (context, constraint) {
        if (state.posts.isEmpty)
          return GlassContainer(
              blur: 20,
              child: Container(
                  height: constraint.maxHeight * 0.55,
                  width: constraint.maxHeight * 0.55,
                  child: Center(child: DnbAddPost())));

        return Expanded(
            child: StackedCardCarousel(
          pageController: pageController,
          type: StackedCardCarouselType.cardsStack,
          items: [
            for (var post in state.posts)
              SizedBox(
                key: Key(post.id),
                height: constraint.maxHeight * 0.75,
                width: constraint.maxHeight * 0.75,
                child: GlassContainer(
                  blur: 20,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: AutoSizeText(
                          post.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      DnbPlayPost(post),
                      Text(post.trackName,
                          style: Theme.of(context).textTheme.subtitle1),
                      Text(post.producer,
                          style: Theme.of(context).textTheme.subtitle2),
                    ],
                  ),
                ),
              )
          ],
        ));
      },
    );
  }
}
