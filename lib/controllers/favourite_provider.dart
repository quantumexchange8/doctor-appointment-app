import 'package:doctor_appointment_app/data/DoctorData.dart';
import 'package:doctor_appointment_app/data/LocationInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteProvider extends ChangeNotifier {
  List<Item> _favourites = [];
  List<Item> get favourites => _favourites;
  List<Place> _locationFavourites = [];
  List<Place> get locationFavourites => _locationFavourites;

  void toggleFavourite(Item item){
    if(isExist(item)){
      _favourites.remove(item);
    }else{
      _favourites.add(item);
    }
    notifyListeners();
  }

  bool isExist(Item item){
    return _favourites.contains(item);
  }

  void toggleLocationFavourite(Place place){
    if (_locationFavourites.contains(place)){
      _locationFavourites.remove(place);
    }else{
      _locationFavourites.add(place);
    }
    notifyListeners();
  }

  bool isFavourite(Place place){
    return _locationFavourites.contains(place);
  }


  static FavouriteProvider of(BuildContext context, {bool listen = false}) {
    return Provider.of<FavouriteProvider>(context, listen:listen);
  }

}