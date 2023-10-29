import 'package:dogs_images/core/constants/widget_keys.dart';
import 'package:dogs_images/modules/dashboard/domain/entities/breed_entity.dart';
import 'package:dogs_images/modules/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedSelectorWidget extends StatelessWidget {
  const BreedSelectorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if ((state.resourceState.isInitial || state.resourceState.isLoading) && state.breeds.isEmpty) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<BreedEntity>(
                  key: ValueKey(WidgetKeys.breedDropdown),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Breed',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  value: state.selectedBreed == BreedEntity.empty ? null : state.selectedBreed,
                  onChanged: (value) {
                    if (value == null) return;
                    context.read<DashboardBloc>().add(DashboardBreedSelectedEvent(value));
                  },
                  items: state.breeds.map((e) {
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
