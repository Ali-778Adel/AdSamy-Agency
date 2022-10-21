import 'package:ad_samy/features/services/domain/use_cases/send-lead-form-sue-case.dart';
import 'package:flutter/material.dart';


abstract class ShowAllServicesEvents{}

class ShowAllServicesEvent extends ShowAllServicesEvents{
  final int?index;
  ShowAllServicesEvent({this.index});

}

class ShowServiceDetailsEvent extends ShowAllServicesEvents{
  final int?catId;
  final int?index;
  ShowServiceDetailsEvent({this.index,this.catId});

}
class ShowLeadingFormEvent extends ShowAllServicesEvents{
  int ?index;
  ShowLeadingFormEvent({this.index});
}

class RegisterLeadEvent extends ShowAllServicesEvents
{
  LeadFormParams ?leadFormParams;

 RegisterLeadEvent({ this.leadFormParams});
}

class OrderSuccessEvent extends ShowAllServicesEvents{
  final int ?index;
  OrderSuccessEvent({this.index});
}

class PopEvent extends ShowAllServicesEvents{
  BuildContext ?context;
  PopEvent({this.context});
}