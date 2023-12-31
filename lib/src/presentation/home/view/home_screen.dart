import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/src/data/repositories/remote/radio_repository.dart';
import 'package:radio_app/src/presentation/home/view/widgets/content.dart';
import '../cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        radioRepository: RepositoryProvider.of<RadioRepository>(context),
      )..loadRadioChannels(),
      child: const Content(),
    );
  }
}
