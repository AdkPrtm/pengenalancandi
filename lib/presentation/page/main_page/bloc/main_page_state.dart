part of 'main_page_bloc.dart';

@immutable
abstract class MainPageState extends Equatable {}

class MainPageInitial extends MainPageState {
  final int indexButtomNavbar;

  MainPageInitial({this.indexButtomNavbar = 0});

  @override
  List<Object?> get props => [indexButtomNavbar];
}
