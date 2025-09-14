import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/domain/entity/enum/enum.dart';
import 'package:e_learning_app/resource/generated/assets.gen.dart';
import 'package:e_learning_app/ui/profile/pages/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:e_learning_app/ui/profile/pages/edit_profile/bloc/edit_profile_event.dart';
import 'package:e_learning_app/ui/profile/pages/edit_profile/bloc/edit_profile_state.dart';

class EditProfileGenderWidget extends StatelessWidget {
  final EditProfileBloc bloc;
  final Gender? selectedGender;

  const EditProfileGenderWidget({
    super.key,
    required this.bloc,
    this.selectedGender,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Gender.values
          .map<Widget>((gender) => ListTile(
                leading: selectedGender == gender
                    ? Assets.icons.radioSelected.svg()
                    : Assets.icons.radioUnselected.svg(),
                title: Text(
                  gender.fromTitle(),
                  style: TextStyle(
                    color: selectedGender == gender
                        ? Theme.of(context).primaryColor
                        : null,
                    fontWeight: selectedGender == gender
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  bloc.add(ProfileGenderChangedEvent(gender));
                  Navigator.of(context).pop(); // Cerrar el bottom sheet
                },
              ))
          .toList(),
    );
  }
}
