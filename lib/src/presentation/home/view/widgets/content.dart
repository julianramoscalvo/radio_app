import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/src/presentation/home/view/widgets/search_bar.dart';
import 'package:radio_app/src/presentation/home/view/widgets/flexible_space_bar.dart';
import '../../cubit/home_cubit.dart';
import 'channel_box.dart';
import '../../cubit/home_state.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Stack(
              children: [
                NestedScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: context.read<HomeCubit>().scrollController,
                  headerSliverBuilder: (context, innerBoxScrolled) {
                    return <Widget>[
                      const FlexibleSpaceBarWidget(),
                      const SearchBar(),
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
