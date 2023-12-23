
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roquete_task/config/helpers/states.dart';
import 'package:roquete_task/presentation/blocs/rectangle_cubit/rectangle_cubit.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RectangleCubit(RectangleStates()),
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
        child: BlocBuilder<RectangleCubit, RectangleState>(
          builder: (context, state) {
            if ( state is RectangleInitial) {
              return _Rectangulo(size: size, color: state.colors,);
              }
            if ( state is RectangleLoading) {
              return _Rectangulo(size: size, color: state.colors,);
              }
            
            if ( state is RectangleLoaded) {
              return _Rectangulo(size: size, color: state.colors,);
              }
            
            if ( state is RectangleError) {
              return _Rectangulo(size: size, color: state.colors,);
              }
            return const Text('Sin Estado');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<RectangleCubit>().onClick();
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
