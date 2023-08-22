import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/src/presentation/home/view/widgets/search_bar.dart';
import 'package:radio_app/src/presentation/home/view/widgets/flexible_space_bar.dart';
import 'package:radio_app/src/utils/helpers/enum.dart';
import '../../../../config/languages/generated/l10n.dart';
import '../../../../utils/helpers/dialogs/errorDialog.dart';
import '../../cubit/home_cubit.dart';
import 'channel_box.dart';
import '../../cubit/home_state.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.status == RequestStatus.failure) {
          showDialog(
            context: context,
            builder: (context) {
              return ErrorDialog(
                title: L().error,
                content: state.errorStatus.isNotEmpty
                    ? state.errorStatus
                    : L().error,
              );
            },
          );
        }
      },
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
                      const SearchBarWidget(),
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
