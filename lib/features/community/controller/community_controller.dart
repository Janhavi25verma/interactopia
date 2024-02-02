import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interactopia/features/community/repository/community_repository.dart';
import 'package:interactopia/models/community_model.dart';
import 'package:routemaster/routemaster.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils.dart';
import '../../auth/controller/auth_controller.dart';

class CommunityController extends StateNotifier {
  final CommunityRepository _communityRepository;
  final Ref _ref;

  CommunityController(
      {required CommunityRepository communityRepository, required Ref ref})
      : _ref = ref,
        _communityRepository = communityRepository,
        super(false);

  void createCommunity(String name, BuildContext context) async {
    state=true;
    final uid = _ref.read(userProvider)?.uid ?? "";
    CommunityModel community = CommunityModel(
      id: name,
      name: name,
      banner: Constants.bannerDefault,
      avatar: Constants.defaultPfp,
      members: [uid],
      mods: [uid],
    );
    state=false;
    final res = await _communityRepository.createCommunity(community);
    res.fold(
        (l) => showSnackBar(context, l.message),
        (r) => {
              showSnackBar(context, "Community Created Successfully"),
              Routemaster.of(context).pop()
            });
  }
}
