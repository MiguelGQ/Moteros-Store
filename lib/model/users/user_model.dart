// Este es el modelo base de todos los usuarios.

import 'package:votacion/model/models.dart';

class User {
  String id; // Id del usuario
  String name; // Nombre del usuario
  String documento; // documento de identificación del usuario
  String email; // Email del usuario// Username del usuario
  PhoneNumber
      phoneNumber; // Celular del usuario // Foto de screens.perfil del usuario
  UserRoles roles; // Determina si tiene permisos de Admin o Merchant
  List<dynamic> addresses; // Direcciones del usuario
  bool isVoted; // Si el usuario está haciendo un en vivo

  User({
    this.id,
    this.documento,
    this.name,
    this.email,
    this.phoneNumber,
    this.roles,
    this.addresses,
    this.isVoted,
  });
}

// Esta clase nos ayudará a gestionar el número del celular del usuario
// incluyendo su dialingCode y basePhoneNumber. Y contiene la función
// completePhoneNumber() que retorna el número completo con su indicativo.
// EJEMPLO:
//   PhoneNumber phoneNumber = PhoneNumber("+57", "3234975584");
//   print(phoneNumber.dialingCode);            -> +57
//   print(phoneNumber.basePhoneNumber);        -> 3211234567
//   print(phoneNumber.completePhoneNumber());  -> +573211234567
class PhoneNumber {
  String dialingCode; // Indicativo/Prefijo de acuerdo al país
  String basePhoneNumber; // Número base del celular
  String completePhoneNumber() => "$dialingCode$basePhoneNumber";

  PhoneNumber({
    this.dialingCode,
    this.basePhoneNumber,
  });
}

// Esta clase determina si un usuario tiene permisos de Admin o Merchant
class UserRoles {
  bool isVoter;
  bool isAdmin;

  UserRoles({
    this.isAdmin,
    this.isVoter,
  });
}
