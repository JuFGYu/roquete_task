part of 'rectangle_cubit.dart';

sealed class RectangleState extends Equatable {

  const RectangleState();

  @override
  List<Object> get props => [];
}

final class RectangleInitial extends RectangleState {
  final Color colors;
  const RectangleInitial({
    this.colors = Colors.grey
  });

  @override
  List<Object> get props => [];
}

final class RectangleLoading extends RectangleState {
  
  final Color colors;
  const RectangleLoading({
    required this.colors
    });

  @override
  List<Object> get props => [colors];
}

final class RectangleLoaded extends RectangleState {
  final Color colors;

  const RectangleLoaded({
    required this.colors
    });

  @override
  List<Object> get props => [colors];
}


final class RectangleError extends RectangleState {
  final Color colors;

  const RectangleError({
    required this.colors
    });

  @override
  List<Object> get props => [colors];
}
