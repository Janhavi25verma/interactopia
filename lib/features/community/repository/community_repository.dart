import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interactopia/core/constants/firebase_constants.dart';
import 'package:interactopia/core/failure.dart';
import 'package:interactopia/core/type_def.dart';
import 'package:interactopia/models/community_model.dart';

class CommunityRepository {
  final FirebaseFirestore _firestore;

  CommunityRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  FutureVoid createCommunity(CommunityModel communityModel) async {
    try {
      var communityDoc = await _communities.doc(communityModel.name).get();
if(communityDoc.exist){
  throw "This community name already exist";
}
      return
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      throw Failure(e.toString());
    }
  }
  CollectionReference _communities => _firestore.collection(FirebaseConstants.communitiesCollection);
}
