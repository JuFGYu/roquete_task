
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
              return _Rectangulo(size: size, color: state.colors, isStarted: false,);
              }
            if ( state is RectangleLoading) {
              return _Rectangulo(size: size, color: state.colors, isStarted: true);
              }
            
            if ( state is RectangleLoaded) {
              return _Rectangulo(size: size, color: state.colors, isStarted: false);
              }
            
            if ( state is RectangleError) {
              return _Rectangulo(size: size, color: state.colors,isStarted: false);
              }
            return const Text('Sin Estado');
          },
        ),
      ),
    );
  }
}

class _Rectangulo extends StatelessWidget {
  final Color color;
  final Size size;
  final bool isStarted;
  
  const _Rectangulo({
    required this.size,
    required this.color, 
    required this.isStarted,
  });


  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ 
        
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut,//tipo de animacion
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        isStarted
        ? const SizedBox()
        : Positioned(
            bottom: 20,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: () => context.read<RectangleCubit>().onClick(),
                child: const Text('Start', style: TextStyle(color: Colors.white, fontSize: 25),),
              ),
            ),
          ),
        ]
    );
  }
}
