import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:radio_app/src/presentation/home/view/widgets/channel_box.dart';
import '../../../../config/languages/generated/l10n.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_state.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        String name = '${L().radioFan} ';
        final double screenWidth = MediaQuery.of(context).size.width;
        final bool rotated = MediaQuery.of(context).size.height < screenWidth;
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Stack(
              children: [
                NestedScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: context.read<HomeCubit>().scrollController,
                  headerSliverBuilder: (
                    BuildContext context,
                    bool innerBoxScrolled,
                  ) {
                    return <Widget>[
                      SliverAppBar(
                        expandedHeight: 115,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        toolbarHeight: 65,
                        automaticallyImplyLeading: false,
                        flexibleSpace: LayoutBuilder(
                          builder: (
                            BuildContext context,
                            BoxConstraints constraints,
                          ) {
                            return FlexibleSpaceBar(
                              background: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15.0,
                                        ),
                                        child: Text(
                                          L().homeGreet,
                                          style: TextStyle(
                                            letterSpacing: 2,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15.0,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          name,
                                          style: const TextStyle(
                                            letterSpacing: 2,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Lottie.asset(
                                            'assets/animations/ax_headphone.json',
                                            width: 50),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        pinned: true,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        stretch: true,
                        toolbarHeight: 85,
                        title: AnimatedBuilder(
                          animation: context.read<HomeCubit>().scrollController,
                          builder: (context, child) {
                            ScrollController scrollController =
                                context.read<HomeCubit>().scrollController;
                            return Stack(
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: AnimatedContainer(
                                      width: (!scrollController.hasClients ||
                                              scrollController
                                                      .positions.length >
                                                  1)
                                          ? 0
                                          : 40,
                                      height: 55.0,
                                      duration: const Duration(
                                        milliseconds: 150,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      // margin: EdgeInsets.zero,

                                      child: Lottie.asset(
                                        'assets/animations/ax_headphone.json',
                                      ),
                                    )),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      child: AnimatedContainer(
                                        width: (!scrollController.hasClients ||
                                                scrollController
                                                        .positions.length >
                                                    1)
                                            ? MediaQuery.of(context).size.width
                                            : max(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    scrollController.offset
                                                        .roundToDouble(),
                                                MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    (rotated ? 0 : 75),
                                              ),
                                        height: 55.0,
                                        duration: const Duration(
                                          milliseconds: 150,
                                        ),
                                        padding: const EdgeInsets.all(2.0),
                                        // margin: EdgeInsets.zero,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10.0,
                                          ),
                                          color: Theme.of(context).cardColor,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 5.0,
                                              offset: Offset(1.5, 1.5),
                                              // shadow direction: bottom right
                                            )
                                          ],
                                        ),

                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            Icon(
                                              CupertinoIcons.search,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              L().searchText,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .color,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () => null,
                                      /*
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) => const SearchPage(
                                                                  query: '',
                                                                  fromHome: true,
                                                                  autofocus: true,
                                                                ),
                                                              ),
                                                            ),
                                  */
                                    )),
                              ],
                            );
                          },
                        ),
                      ),
                    ];
                  },
                  body: const ChannelBox(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
