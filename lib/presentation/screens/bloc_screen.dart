
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roquete_task/config/helpers/states.dart';
import 'package:roquete_task/presentation/blocs/rectangle_bloc/rectangle_bloc_bloc.dart';
import 'package:roquete_task/presentation/blocs/rectangle_cubit/rectangle_cubit.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RectangleBlocBloc(RectangleStates()),
      child: const _CubitRectangleView(),
    );
  }
}

class _CubitRectangleView extends StatelessWidget {
  const _CubitRectangleView();

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rectangulo con Cubits'),
      ),
      body: Center(
        child: BlocBuilder<RectangleBlocBloc, RectangleBlocState>(
          builder: (context, state) {
            if ( state is RectangleInitialBloc) {
              return _Rectangulo(size: size, color: state.colors,);
              }
            if ( state is RectangleLoadingBloc) {
              return _Rectangulo(size: size, color: state.colors,);
              }
            
            if ( state is RectangleLoadedBloc) {
              return _Rectangulo(size: size, color: state.colors,);
              }
            
            if ( state is RectangleErrorBloc) {
              return _Rectangulo(size: size, color: state.colors,);
              }
            return const Text('Sin Estado');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<RectangleBlocBloc>().onClick();
        }, 
        child: const Text('Start'),
      ),
    );
  }
}

class _Rectangulo extends StatelessWidget {
  final Color color;
  final Size size;
  const _Rectangulo({
    required this.size,
    required this.color,
  });


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.elasticOut,//tipo de animacion
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10)
            ),
          );
  }
}
