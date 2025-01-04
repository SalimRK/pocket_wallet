import 'package:flutter/material.dart';

class Transaction {
  final int id; // Add this line
  double _amount;
  String _name;
  String _subtitle;
  DateTime _date;
  IconData _icon;

  Transaction(this.id, this._amount, this._name, this._subtitle, this._date,
      this._icon); // Update constructor

  double get amount => _amount;
  set amount(double value) {
    _amount = value;
  }

  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String get subtitle => _subtitle;
  set subtitle(String value) {
    _subtitle = value;
  }

  DateTime get date => _date;
  set date(DateTime value) {
    _date = value;
  }

  IconData get icon => _icon;
  set icon(IconData value) {
    _icon = value;
  }

  String _iconToString(IconData icon) {
    switch (icon) {
      case Icons.account_balance_wallet:
        return 'account_balance_wallet';
      case Icons.home:
        return 'home';
      case Icons.shopping_bag:
        return 'shopping_bag';
      case Icons.coffee:
        return 'coffee';
      case Icons.local_grocery_store:
        return 'local_grocery_store';
      case Icons.tips_and_updates:
        return 'tips_and_updates';
      case Icons.directions_car:
        return 'directions_car';
      case Icons.people:
        return 'people';
      case Icons.trending_up:
        return 'trending_up';
      case Icons.trending_down:
        return 'trending_down';
      case Icons.account_balance:
        return 'account_balance';
      case Icons.construction:
        return 'construction';
      case Icons.store:
        return 'store';
      case Icons.pets:
        return 'pets';
      case Icons.restaurant:
        return 'restaurant';
      case Icons.volunteer_activism:
        return 'volunteer_activism';
      case Icons.flight_takeoff:
        return 'flight_takeoff';
      case Icons.devices:
        return 'devices';
      case Icons.fitness_center:
        return 'fitness_center';
      case Icons.movie:
        return 'movie';
      case Icons.cake:
        return 'cake';
      case Icons.chair:
        return 'chair';
      case Icons.fastfood:
        return 'fastfood';
      case Icons.hotel:
        return 'hotel';
      case Icons.cleaning_services:
        return 'cleaning_services';
      case Icons.local_hospital:
        return 'local_hospital';
      case Icons.two_wheeler:
        return 'two_wheeler';
      case Icons.sports_esports:
        return 'sports_esports';
      case Icons.sports_tennis:
        return 'sports_tennis';
      case Icons.icecream:
        return 'icecream';
      case Icons.business_center:
        return 'business_center';
      default:
        return 'account_balance_wallet';
    }
  }

  IconData _iconFromString(String iconName) {
    switch (iconName) {
      case 'account_balance_wallet':
        return Icons.account_balance_wallet;
      case 'home':
        return Icons.home;
      case 'shopping_bag':
        return Icons.shopping_bag;
      case 'coffee':
        return Icons.coffee;
      case 'local_grocery_store':
        return Icons.local_grocery_store;
      case 'tips_and_updates':
        return Icons.tips_and_updates;
      case 'directions_car':
        return Icons.directions_car;
      case 'people':
        return Icons.people;
      case 'trending_up':
        return Icons.trending_up;
      case 'trending_down':
        return Icons.trending_down;
      case 'account_balance':
        return Icons.account_balance;
      case 'construction':
        return Icons.construction;
      case 'store':
        return Icons.store;
      case 'pets':
        return Icons.pets;
      case 'restaurant':
        return Icons.restaurant;
      case 'volunteer_activism':
        return Icons.volunteer_activism;
      case 'flight_takeoff':
        return Icons.flight_takeoff;
      case 'devices':
        return Icons.devices;
      case 'fitness_center':
        return Icons.fitness_center;
      case 'movie':
        return Icons.movie;
      case 'cake':
        return Icons.cake;
      case 'chair':
        return Icons.chair;
      case 'fastfood':
        return Icons.fastfood;
      case 'hotel':
        return Icons.hotel;
      case 'cleaning_services':
        return Icons.cleaning_services;
      case 'local_hospital':
        return Icons.local_hospital;
      case 'two_wheeler':
        return Icons.two_wheeler;
      case 'sports_esports':
        return Icons.sports_esports;
      case 'sports_tennis':
        return Icons.sports_tennis;
      case 'icecream':
        return Icons.icecream;
      case 'business_center':
        return Icons.business_center;
      default:
        return Icons.account_balance_wallet;
    }
  }
}
