part of 'detail_page_bloc.dart';

abstract class DetailPageState extends Equatable {
  const DetailPageState();

  @override
  List<Object?> get props => [];
}

class DetailPageInitial extends DetailPageState {
  
  final int indexImage;
  final int indexTabbar;

  const DetailPageInitial({this.indexImage = 0, this.indexTabbar = 0});
  @override
  List<Object?> get props => [indexImage, indexTabbar];
}

// class ImageCarousellState extends DetailPageState {
//   final int indexImage;

//   const ImageCarousellState({this.indexImage = 0});

//   @override
//   List<Object?> get props => [indexImage];
// }

