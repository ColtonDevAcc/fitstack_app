import 'package:FitStack/app/models/user/user_profile_model.dart';
import 'package:FitStack/presentation/relationship/cubit/friendship/friendship_cubit.dart';
import 'package:FitStack/presentation/relationship/presentation/molecules/friendship_profile_card.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddFriendBottomSheet extends StatelessWidget {
  final UserProfile friend;
  const AddFriendBottomSheet({Key? key, required this.friend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.background),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: FormBuilderTextField(
                      maxLines: 1,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      onSubmitted: (value) => context.read<FriendshipCubit>().getFriend(email: value),
                      validator: (value) {
                        if (EmailValidator.validate(value ?? "")) {
                          return null;
                        } else {
                          return "not valid";
                        }
                      },
                      name: 'friendEmail',
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).colorScheme.surface,
                        filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        prefixIcon: Container(
                          padding: EdgeInsets.all(15),
                          child: Icon(FontAwesomeIcons.magnifyingGlass),
                          width: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<FriendshipCubit>().getFriend(clear: true, email: '');
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    child: Icon(
                      FontAwesomeIcons.arrowDownLong,
                      size: 20,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ],
            ),
            friend == UserProfile.empty()
                ? SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => context.read<FriendshipCubit>().addFriend(friend: friend),
                          child: FriendshipProfileCard(
                            username: friend.display_name,
                            colorTheme: Colors.red,
                          ),
                        ),
                      ),
                      Icon(FontAwesomeIcons.plus)
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
