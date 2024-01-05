import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interactopia/features/auth/repository/auth_repository.dart';

final authControllerProvider= Provider((ref) => AuthController(authRepository: ref.read(authRepositoryProvider)));
class AuthController {
  final AuthRepository _authRepository;
  AuthController({required AuthRepository authRepository}):_authRepository=authRepository;
  void signInWithGoogle(){
    _authRepository.signInWithGoogle();
  }
}

