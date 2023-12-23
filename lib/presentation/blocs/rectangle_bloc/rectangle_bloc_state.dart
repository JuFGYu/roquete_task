part of 'rectangle_bloc_bloc.dart';


sealed class RectangleBlocState extends Equatable {

  const RectangleBlocState();

  @override
  List<Object> get props => [];
}

final class RectangleInitialBloc extends RectangleBlocState {
  final Color colors;
  const RectangleInitialBloc({
    this.colors = Colors.grey
  });

  @override
  List<Object> get props => [];
}

final class RectangleLoadingBloc extends RectangleBlocState {
  
  final Color colors;
  const RectangleLoadingBloc({
    required this.colors
    });

  @override
  List<Object> get props => [colors];
}

final class RectangleLoadedBloc extends RectangleBlocState {
  final Color colors;

  const RectangleLoadedBloc({
    required this.colors
    });

  @override
  List<Object> get props => [colors];
}


final class RectangleErrorBloc extends RectangleBlocState {
  final Color colors;

  const RectangleErrorBloc({
    required this.colors
    });

  @override
  List<Object> get props => [colors];
}