part of 'main_page_bloc.dart';

@immutable
abstract class MainPageEvent extends Equatable {}

class PageTapped extends MainPageEvent {
  final int indexButtomNavbar;

  PageTapped({this.indexButtomNavbar = 0});

  @override
  List<Object?> get props => [indexButtomNavbar];
}
