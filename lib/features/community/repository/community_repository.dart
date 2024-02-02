import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:interactopia/core/constants/firebase_constants.dart';
import 'package:interactopia/core/failure.dart';
import 'package:interactopia/core/providers/firebase_provider.dart';
import 'package:interactopia/core/type_def.dart';
import 'package:interactopia/models/community_model.dart';
import 'package:interactopia/core/providers/firebase_provider.dart';


final communityRepositoryProvider = Provider((ref) {
  return CommunityRepository(firestore: ref.watch(firestoreProvider));
});

class CommunityRepository {
  final FirebaseFirestore _firestore;

  CommunityRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  FutureVoid createCommunity(CommunityModel communityModel) async {
    try {
      var communityDoc = await _communities.doc(communityModel.name).get();
if(communityDoc.exists){
  throw "This community name already exist";
}
      return right(_communities.doc(communityModel.name).set(communityModel.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      throw left(Failure(e.toString()));
    }
  }
  CollectionReference get _communities => _firestore.collection(FirebaseConstants.communitiesCollection);
}
