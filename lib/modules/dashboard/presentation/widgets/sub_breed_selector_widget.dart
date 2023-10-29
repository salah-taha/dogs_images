import 'package:dogs_images/core/constants/widget_keys.dart';
import 'package:dogs_images/modules/dashboard/domain/entities/breed_entity.dart';
import 'package:dogs_images/modules/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubBreedSelectorWidget extends StatelessWidget {
  const SubBreedSelectorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (!state.shouldShowSubBreedSelector) {
            return const SizedBox.shrink();
          }
          if ((state.resourceState.isInitial || state.resourceState.isLoading) &&
              state.selectedBreed != BreedEntity.empty &&
              state.selectedBreed.subBreeds.isEmpty) {
            return const SizedBox.shrink();
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<BreedEntity>(
                  key: ValueKey(WidgetKeys.subBreedDropdown),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Sub Breed',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  value: state.selectedSubBreed == BreedEntity.empty ? null : state.selectedSubBreed,
                  onChanged: (value) {
                    if (value == null) return;
                    context.read<DashboardBloc>().add(DashboardSubBreedSelectedEvent(value));
                  },
                  items: state.selectedBreed.subBreeds.map((e) {
                    return DropdownMenuItem<BreedEntity>(
                      value: e,
                      child: Text(e.name),
                    );
                  }).toList()),
            ),
          );
        },
      ),
    );
  }
}
