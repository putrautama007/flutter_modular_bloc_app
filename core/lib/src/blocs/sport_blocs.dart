import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class SportBlocs {
  final _repository = Repository();
  final _sportFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allSports => _sportFetcher.stream;

  fetchAllSport() async{
    if(_isDisposed) {
      return print('dijalankan');
    }
    ItemModel itemModel = await _repository.fetchAllSport();
    _sportFetcher.sink.add(itemModel);
  }

  bool _isDisposed = false;
  dispose(){
    _sportFetcher.close();
    _isDisposed = true;
  }
}

