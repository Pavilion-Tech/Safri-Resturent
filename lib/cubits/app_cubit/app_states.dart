abstract class AppStates {}

class AppInitState extends AppStates {}

class ChangeOrderStatusState extends AppStates {}


class OrdersLoadingState extends AppStates{}
class OrdersSuccessState extends AppStates{}
class OrdersErrorState extends AppStates{}


class ChangeOrderStatusLoadingState extends AppStates{}
class ChangeOrderStatusSuccessState extends AppStates{}
class ChangeOrderStatusWrongState extends AppStates{}
class ChangeOrderStatusErrorState extends AppStates{}