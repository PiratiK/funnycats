import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/service/cat_service.dart';
import '../../domain/bloc/cat/cat_bloc.dart';
import '../../domain/repositories/cat_repository.dart';

class CatProvider extends StatelessWidget {
  final Widget child;
  const CatProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CatRepository(
        catService: CatService(Dio()),
      ),
      child: BlocProvider(
        create: (context) => CatBloc(
          catRepository: context.read<CatRepository>(),
        )..add(GetCat()),
        child: child,
      ),
    );
  }
}
