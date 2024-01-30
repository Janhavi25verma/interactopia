import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interactopia/theme/palette.dart';

class CreateCommunityScreen extends ConsumerStatefulWidget {
  const CreateCommunityScreen({super.key});

  @override
  ConsumerState<CreateCommunityScreen> createState() =>
      _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends ConsumerState<CreateCommunityScreen> {
 final TextEditingController createCommunityController = TextEditingController();

  @override
  void dispose() {
    createCommunityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a community"),
        centerTitle: true,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Text("Community Name:"),
        const SizedBox(
          height: 15,
        ),
        TextField(
          controller: createCommunityController,
          decoration: const InputDecoration(
          hintText: "Type Community Name",
          filled: true,
          fillColor: Palette.greyGreenColor,
          border: InputBorder.none,
        ),
        maxLength: 25,
      ),
        SizedBox(
          width: 400,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Palette.darkGreenColor,
                shadowColor: Palette.whiteColor,
              ), child: const Text(
          "Create",
          style: TextStyle(color: Palette.whiteColor),
                ),),
        ),
      ],
    ),)
    ,
    );
  }
}
