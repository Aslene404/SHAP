import 'package:equatable/equatable.dart';


class Company extends Equatable {
  final String? registerArt;
  final String? registerNummer;
  final String? registrar;
  final String? company_number;
  final String? current_status;
  final String? name;
  final String? previous_names;
  


  Company(
      {this.registerArt,
      this.registerNummer,
      this.registrar,
      this.company_number,
      this.current_status,
      this.name,
      this.previous_names,
       });

  @override
  List<Object?> get props => [registerArt,
   registerNummer,
   registrar,
   company_number,
   current_status,
   name,
   previous_names];
}