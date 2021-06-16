abstract class ElshaimaChildStates {}

class ElshaimaChildInitialState extends ElshaimaChildStates {}

class ElshaimaChildLoadingState extends ElshaimaChildStates {}

class ElshaimaChildSsuccessState extends ElshaimaChildStates {}
class ElshaimaChildGETState extends ElshaimaChildStates {}

class ElshaimaChildErrorState extends ElshaimaChildStates {
  final String error;
  ElshaimaChildErrorState(this.error);
}
