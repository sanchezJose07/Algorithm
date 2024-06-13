import 'package:flutter/cupertino.dart';
import '../../domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier{
  bool initialLoading = true;
  List<VideoPost> videos =[];

  Future<void> loadNextPage() async{

    notifyListeners();
  }


}