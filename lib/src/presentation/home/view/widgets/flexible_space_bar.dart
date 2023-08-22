import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../config/languages/generated/l10n.dart';

class FlexibleSpaceBarWidget extends StatelessWidget {
  const FlexibleSpaceBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = '${L().radioFan} ';

    return SliverAppBar(
      expandedHeight: 115,
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 65,
      automaticallyImplyLeading: false,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          return FlexibleSpaceBar(
            background: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 16),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        L().homeGreet,
                        style: TextStyle(
                          letterSpacing: 2,
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        width: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
