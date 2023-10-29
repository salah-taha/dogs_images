import 'package:dogs_images/core/constants/widget_keys.dart';
import 'package:dogs_images/modules/dashboard/domain/enums/dashboard_type.dart';
import 'package:dogs_images/modules/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypeSelectorWidget extends StatelessWidget {
  const TypeSelectorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state.breeds.isEmpty && state.resourceState.isLoading) {
              return const SizedBox.shrink();
            }
            return DropdownButtonHideUnderline(
              child: DropdownButtonFormField<DashboardType>(
                key: ValueKey(WidgetKeys.dashboardTypeDropdown),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Dashboard Type',
                  filled: true,
                  fillColor: Colors.white,
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
                value: state.dashboardType,
                onChanged: (value) {
                  context.read<DashboardBloc>().add(DashboardTypeChangedEvent(value!));
                },
                items: DashboardType.values.map((e) {
                  return DropdownMenuItem<DashboardType>(
                    value: e,
                    child: Text(e.valueName),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
