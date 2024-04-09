part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class EmitState extends SettingsState {}

class GetSettingsSuccessState extends SettingsState {}
class GetSettingsErrorState extends SettingsState {}

class GetStaticPagesSuccessState extends SettingsState {}
class GetStaticPagesErrorState extends SettingsState {}

class ConnectionState extends SettingsState {}


class OrdersHistoryLoadingState extends SettingsState{}
class OrdersHistorySuccessState extends SettingsState{}
class OrdersHistoryErrorState extends SettingsState{}


class GetRestaurantLoadingState extends SettingsState{}
class GetRestaurantSuccessState extends SettingsState{}
class GetRestaurantErrorState extends SettingsState{}


class ChangeCrowdedStatusLoadingState extends SettingsState{}
class ChangeCrowdedStatusSuccessState extends SettingsState{}
class ChangeCrowdedStatusErrorState extends SettingsState{}
