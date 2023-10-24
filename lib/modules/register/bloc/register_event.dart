import '../models/register_model.dart';

abstract class RegisterEvent{}

class RegisterSubmittedEvent extends RegisterEvent{
  RegisterModel registerModel;
  RegisterSubmittedEvent({required this.registerModel});
}