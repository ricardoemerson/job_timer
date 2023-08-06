import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'home_state.g.dart';

@match
enum HomeStatus { initial, loading, success, error }

class HomeState extends Equatable {
  final HomeStatus status;

  const HomeState({
    required this.status,
  });

  const HomeState.initial() : status = HomeStatus.initial;

  HomeState copyWith({
    HomeStatus? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];

  @override
  String toString() => 'HomeState(status: $status)';
}
