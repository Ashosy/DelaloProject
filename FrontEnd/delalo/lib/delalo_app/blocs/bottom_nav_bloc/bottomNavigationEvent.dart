import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {
  BottomNavigationEvent([List props = const []]) : super();
}

class BottomHomePageEvent extends BottomNavigationEvent {

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class BottomCategoryPageEvent extends BottomNavigationEvent {

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class BottomOrdersPageEvent extends BottomNavigationEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class BottomJobsPageEvent extends BottomNavigationEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class BottomAccountPageEvent extends BottomNavigationEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}