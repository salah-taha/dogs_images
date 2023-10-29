import 'package:dogs_images/core/constants/widget_keys.dart';
import 'package:dogs_images/modules/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:dogs_images/modules/dashboard/presentation/validation/validation.dart';
import 'package:dogs_images/modules/dashboard/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state.resourceState.isError && state.error != BaseValidationWarning.none) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                state.error.message,
                key: ValueKey(WidgetKeys.errorMessage),
              ),
            ),
          );
        }
        if (state.resourceState.isInitial || state.resourceState.isLoading) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state.dashboardType.isSingle) {
          // fill remaining with first image
          return SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // refresh button
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        context.read<DashboardBloc>().add(DashboardRefreshEvent());
                      },
                    ),
                  ),
                  Expanded(
                    child: ImageWidget(
                      imageUrl: state.images[0],
                      key: ValueKey(WidgetKeys.dogImageWidget),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverLayoutBuilder(
            builder: (context, constraints) {
              var crossAxisCount = constraints.crossAxisExtent ~/ 160;
              return SliverGrid(
                key: ValueKey(WidgetKeys.dogImageGridWidget),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var url = state.images[index];
                    return ImageWidget(imageUrl: url);
                  },
                  childCount: state.images.length,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
