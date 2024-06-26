import 'package:comunect_v2/common/widgets/bottom_navigation.dart';
import 'package:comunect_v2/features/find_a_service/models/service_type.dart';
import 'package:comunect_v2/features/home/cubit/service_types_cubit.dart';
import 'package:comunect_v2/routes/routes_names.dart';
import 'package:comunect_v2/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceTypesScreen extends StatefulWidget {
  const ServiceTypesScreen({super.key});

  @override
  State<ServiceTypesScreen> createState() => _ServiceTypesScreenState();
}

class _ServiceTypesScreenState extends State<ServiceTypesScreen> {
  late ServiceTypesCubit _serviceTypesCubit;
  late ServiceTypesLoaded _serviceTypeState;
  
  @override
  void initState() {
    super.initState();
    _serviceTypesCubit = context.read<ServiceTypesCubit>();
    _serviceTypeState = _serviceTypesCubit.state as ServiceTypesLoaded;
  }

  void loadServiceTypes() {
    _serviceTypesCubit.loadServiceTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Find a Job'),),
      body: body(),
      bottomNavigationBar: bottomNavigation(
        activePage: jobsPage,
        context: context
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Service Type'),
          ...serviceTypes()
        ],
      ),
    );
  }

  List<Widget> serviceTypes() {
    List<ServiceType> serviceTypes = _serviceTypeState.serviceTypes;
    return List.generate(
      serviceTypes.length, 
      (index) {
        return GestureDetector(
          onTap: () {
            _serviceTypesCubit.selectServiceType(index);
            Navigator.pushNamed(context, jobsList);
          },
          child: Row(
            children: [
              Image.network(serviceTypes[index].imageUrl as String),
              Text(serviceTypes[index].name)
            ],
          ),
        );
      }
    );
  }
}