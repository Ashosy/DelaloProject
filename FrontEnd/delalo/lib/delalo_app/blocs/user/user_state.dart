import 'package:equatable/equatable.dart';
import 'package:delalo/delalo_app/models/models.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {}

class UserLoadSuccess extends UserState {
  final List<User> user;

  UserLoadSuccess([this.user = const []]);

  @override
  List<Object> get props => [user];
}

class CourseOperationFailure extends UserState {}
