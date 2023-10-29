import 'package:dogs_images/modules/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:dogs_images/modules/dashboard/presentation/widgets/sliver_spacer.dart';
import 'package:dogs_images/modules/dashboard/presentation/widgets/widgets.dart';
import 'package:dogs_images/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => DashboardBloc(sl())..add(DashboardInitialEvent()),
      child: const _DashboardBody(),
    ));
  }
}

class _DashboardBody extends StatelessWidget {
  const _DashboardBody();

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          title: Text('Dogs App Demo'),
          floating: true,
          snap: true,
          leading: Icon(Icons.pets),
          backgroundColor: Colors.orangeAccent,
        ),
        SliverSpacer(),
        TypeSelectorWidget(),
        BreedSelectorWidget(),
        SubBreedSelectorWidget(),
        BodyWidget(),
      ],
    );
  }
}
