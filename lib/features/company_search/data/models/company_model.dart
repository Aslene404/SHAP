
import 'package:shap/features/company_search/domain/entities/company.dart';

class CompanyModel extends Company {
  CompanyModel({registerArt,
   registerNummer,
   registrar,
   company_number,
   current_status,
   name,
   previous_names,


   }
  ) : super(registerArt: registerArt,
   registerNummer:registerNummer,
   registrar:registrar,
   company_number:company_number,
   current_status:current_status,
   name:name,
   previous_names:previous_names,);
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(

      registerArt:json['all_attributes']['registerArt'],
      registerNummer:json['all_attributes']['registerNummer'],
      registrar:json['all_attributes']['registrar'],
      company_number:json['company_number'],
      current_status:json['current_status'],
      name:json['name'],
      previous_names:json['previous_names'],
    );
  }
  Map<String, dynamic> toJson() {
    return {

      '"registerArt"': '"$registerArt"',
      '"registerNummer"': '"$registerNummer"',
      '"registrar"': '"$registrar"',
      '"company_number"': '"$company_number"',
      '"current_status"': '"$current_status"',
      '"name"': '"$name"',
      '"previous_names"': '"$previous_names"',

      
    };
  }
}