import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/base/constants/ui/dimens.dart';
import 'package:e_learning_app/base/extension/context_extension.dart';
import 'package:e_learning_app/base/shared_view/common_app_bar.dart';
import 'package:e_learning_app/base/shared_view/common_bottom_navigator_bar_background.dart';
import 'package:e_learning_app/base/shared_view/common_button.dart';
import 'package:e_learning_app/base/shared_view/common_scaffold.dart';
import 'package:e_learning_app/base/shared_view/common_text_field.dart';
import 'package:e_learning_app/base/shared_view/dialog/app_dialogs.dart';
import 'package:e_learning_app/base/shared_view/foundation_state.dart';
import 'package:e_learning_app/domain/entity/enum/enum.dart';
import 'package:e_learning_app/domain/entity/user/user_entity.dart';
import 'package:e_learning_app/ui/profile/pages/edit_profile/bloc/edit_profile_state.dart';
import 'package:e_learning_app/ui/profile/pages/edit_profile/components/edit_profile_gender_widget.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../base/constants/ui/app_colors.dart';
import '../../../../resource/generated/assets.gen.dart';
import '../../../../resource/generated/l10n.dart';
import 'bloc/edit_profile_bloc.dart';
import 'bloc/edit_profile_event.dart';

@RoutePage()
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState
    extends FoundationState<EditProfilePage, EditProfileBloc> {
  late TextEditingController _birthdayController;
  late TextEditingController _genderController;

  @override
  void initState() {
    super.initState();
    _birthdayController = TextEditingController();
    _genderController = TextEditingController();
    bloc.add(EditProfileDataRequestEvent());
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(text: S.current.edit_profile, centerTitle: false),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: BlocSelector<EditProfileBloc, EditProfileState, UserEntity>(
        selector: (state) => state.user,
        builder: (_, user) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(Dimens.paddingHorizontalLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<EditProfileBloc, EditProfileState>(
                  buildWhen: (prev, curr) => (prev.nameInput != curr.nameInput),
                  builder: (_, state) {
                    return CommonTextField(
                      key: ValueKey('nameInput-${user.fullName}'),
                      initialValue: user.fullName,
                      hintText: 'Name',
                      errorText: state.nameInput.displayError?.fromTitle(),
                      onChanged: (val) =>
                          bloc.add(ProfileNameChangedEvent(val)),
                    );
                  },
                ),
                const Gap(Dimens.paddingVerticalLarge),
                BlocBuilder<EditProfileBloc, EditProfileState>(
                  buildWhen: (prev, curr) =>
                      (prev.selectedBirthday != curr.selectedBirthday),
                  builder: (_, state) {
                    // Update controller when state changes
                    print(
                        '🎂 BlocBuilder - selectedBirthday: ${state.selectedBirthday}');
                    _birthdayController.text = DateFormat('MMM dd, yyyy')
                        .format(state.selectedBirthday);

                    return CommonTextField(
                      controller: _birthdayController,
                      onTap: () async {
                        context.hideKeyboard();
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: state.selectedBirthday,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: AppColors.current.primary500,
                                  onPrimary: Colors.white,
                                  surface: Colors.white,
                                  onSurface: Colors.black,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (pickedDate != null &&
                            pickedDate != state.selectedBirthday) {
                          bloc.add(ProfileBirthdayChangedEvent(pickedDate));
                        }
                      },
                      ignoring: true,
                      hintText: 'Birthday',
                      suffixIcon: Assets.icons.calendarCurved.svg(
                          colorFilter: ColorFilter.mode(
                            AppColors.current.greyscale900,
                            BlendMode.srcIn,
                          ),
                          fit: BoxFit.scaleDown),
                    );
                  },
                ),
                const Gap(Dimens.paddingVerticalLarge),
                BlocBuilder<EditProfileBloc, EditProfileState>(
                  buildWhen: (prev, curr) =>
                      (prev.emailInput != curr.emailInput),
                  builder: (_, state) {
                    return CommonTextField(
                      key: ValueKey('emailInput-${user.email}'),
                      initialValue: user.email,
                      hintText: 'Email',
                      onChanged: (val) =>
                          bloc.add(ProfileEmailChangedEvent(val)),
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Assets.icons.messageCurved.svg(
                          colorFilter: ColorFilter.mode(
                              AppColors.current.greyscale900, BlendMode.srcIn),
                          fit: BoxFit.scaleDown),
                    );
                  },
                ),
                const Gap(Dimens.paddingVerticalLarge),
                CommonTextField(
                  hintText: 'Location',
                  onChanged: (val) {},
                  suffixIcon: Assets.icons.arrowDownBold2.svg(
                      colorFilter: ColorFilter.mode(
                        AppColors.current.greyscale900,
                        BlendMode.srcIn,
                      ),
                      fit: BoxFit.scaleDown),
                ),
                const Gap(Dimens.paddingVerticalLarge),
                CommonTextField(
                  key: ValueKey('phone-${user.phoneNumber}'),
                  initialValue: user.phoneNumber,
                  hintText: 'Phone',
                  keyboardType: TextInputType.phone,
                  onChanged: (val) =>
                      bloc.add(ProfilePhoneNumberChangedEvent(val)),
                ),
                const Gap(Dimens.paddingVerticalLarge),
                BlocBuilder<EditProfileBloc, EditProfileState>(
                  buildWhen: (prev, curr) =>
                      (prev.selectedGender != curr.selectedGender),
                  builder: (_, state) {
                    // Update controller when state changes
                    print(
                        '👤 BlocBuilder - selectedGender: ${state.selectedGender}');
                    _genderController.text =
                        state.selectedGender?.fromTitle() ?? '';

                    return CommonTextField(
                      controller: _genderController,
                      onTap: () {
                        AppDialogs.showDisableScrollBottomSheet(
                          context,
                          builder: (_) {
                            return SafeArea(
                              minimum: const EdgeInsets.symmetric(
                                  horizontal: Dimens.paddingHorizontalLarge),
                              child: EditProfileGenderWidget(
                                bloc: bloc,
                                selectedGender: state.selectedGender,
                              ),
                            );
                          },
                        );
                      },
                      ignoring: true,
                      hintText: 'Gender',
                      suffixIcon: Assets.icons.arrowDownBold2.svg(
                          colorFilter: ColorFilter.mode(
                            AppColors.current.greyscale900,
                            BlendMode.srcIn,
                          ),
                          fit: BoxFit.scaleDown),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _buildBottomNavigationBar() {
    return BlocListener<EditProfileBloc, EditProfileState>(
      listener: (context, state) {
        if (state.isUpdateSuccess) {
          // Show success snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Profile updated successfully!'),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
          // Navigate back
          Navigator.of(context).pop();
        }
        if (state.updateErrorMessage != null) {
          // Show error snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Update failed: ${state.updateErrorMessage}'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }
      },
      child: BlocBuilder<EditProfileBloc, EditProfileState>(
        builder: (context, state) {
          return CommonBottomNavigatorBarBackground(
            visibleBorder: false,
            child: CommonButton(
              onPressed: state.isUpdating
                  ? () {}
                  : () {
                      bloc.add(UpdateProfileRequestEvent());
                    },
              title: state.isUpdating ? 'Updating...' : 'Update',
              enable: !state.isUpdating,
            ),
          );
        },
      ),
    );
  }
}
