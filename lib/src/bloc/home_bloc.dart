import 'package:rxdart/rxdart.dart';

import '../resource/repository.dart';

class HomeBloc {
  Repository _repository = Repository();

  final _sliderValues = BehaviorSubject<double>();
  final _radioButtonValue = BehaviorSubject<int>();
  final _switchValue= BehaviorSubject<bool>();
  final _checkBoxValue= BehaviorSubject<bool>();

  Stream<double> get sliderValues => _sliderValues.stream;
  Stream<int> get radioButtonValue => _radioButtonValue.stream;
  Stream<bool> get switchValue => _switchValue.stream;
  Stream<bool> get checkBoxValue => _checkBoxValue.stream;

  Function(double) get addSliderValues => _sliderValues.sink.add;
  Function(int) get addRadioButtonValue => _radioButtonValue.sink.add;
  Function(bool) get addSwitchValue => _switchValue.sink.add;
  Function(bool) get addCheckBoxValue => _checkBoxValue.sink.add;

  reset(){
    addRadioButtonValue(0);
    addSliderValues(50);
    addSwitchValue(false);
    addCheckBoxValue(false);
  }

  dispose() {
    _sliderValues.close();
    _radioButtonValue.close();
    _switchValue.close();
    _checkBoxValue.close();
  }
}