import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/languages/generated/l10n.dart';
import '../../../../utils/helpers/enum.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_state.dart';
import 'channel_list.dart';

class ChannelBox extends StatelessWidget {
  const ChannelBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      switch (state.status) {
        case RequestStatus.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case RequestStatus.failure:
          return Text(state.errorStatus);
        case RequestStatus.success:
          return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 0, 5),
                    child: Text(
                      L().channels,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const ChannelList(),
            ],
          );
      }
    });
  }
}
