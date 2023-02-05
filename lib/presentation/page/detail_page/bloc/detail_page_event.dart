part of 'detail_page_bloc.dart';

abstract class DetailPageEvent extends Equatable {
  const DetailPageEvent();

  @override
  List<Object?> get props => [];
}

class TapedTabbar extends DetailPageEvent {
  final int indexTabbar;
  final int indexImage;

  const TapedTabbar({this.indexImage = 0, this.indexTabbar = 0});

  @override
  List<Object?> get props => [indexImage, indexTabbar];
}

// class ImageCarousellEvent extends DetailPageEvent {
//   final int indexImage;

//   const ImageCarousellEvent({this.indexImage = 0});

//   @override
//   List<Object?> get props => [];
// }
