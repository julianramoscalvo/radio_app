import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../config/languages/generated/l10n.dart';
import '../../cubit/home_cubit.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      stretch: true,
      toolbarHeight: 85,
      title: AnimatedBuilder(
        animation: context.read<HomeCubit>().scrollController,
        builder: (context, child) {
          final scrollController = context.read<HomeCubit>().scrollController;
          return Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  width: (!scrollController.hasClients ||
                          scrollController.positions.length > 1)
                      ? 0
                      : 40,
                  height: 55.0,
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Lottie.asset(
                    'assets/animations/ax_headphone.json',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: AnimatedContainer(
                  width: (!scrollController.hasClients ||
                          scrollController.positions.length > 1)
                      ? MediaQuery.of(context).size.width
                      : max(
                          MediaQuery.of(context).size.width -
                              scrollController.offset.roundToDouble(),
                          MediaQuery.of(context).size.width - 75,
                        ),
                  height: 55.0,
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).cardColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        offset: Offset(1.5, 1.5),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10.0),
                      Icon(
                        CupertinoIcons.search,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: TextField(
                          //controller: searchController,
                          decoration: InputDecoration.collapsed(
                            hintText: L().searchText,
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onSubmitted: (String searchTerm) => context
                              .read<HomeCubit>()
                              .loadRadioChannels(
                                  searchText: searchTerm,
                                  resetPagination: true),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
