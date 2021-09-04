import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delalo/delalo_app/blocs/blocs.dart';


class UserBloc extends Bloc<UserEvent, UserState>{

   final UserRepository userRepository;

  UserBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(UserLoading());
   @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    

    if (event is UserUpdate) {
      try {
        await userRepository.updateCourse(event.user);
        final courses = await userRepository.getCourses();
        yield UserLoadSuccess(courses);
      } catch (_) {
        yield CourseOperationFailure();
      }
    }

    if (event is UserDelete) {
      try {
        await userRepository.deleteCourse(event.user.id);
        final user = await userRepository.getUser();
        yield UserLoadSuccess(user);
      } catch (_) {
        yield CourseOperationFailure();
      }
    }
  }
}
