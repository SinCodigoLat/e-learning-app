import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/base/constants/ui/app_colors.dart';
import 'package:e_learning_app/base/shared_view/foundation_state.dart';
import 'package:e_learning_app/base/bloc/app_bloc/app_bloc.dart';
import 'package:e_learning_app/base/bloc/app_bloc/app_event.dart';
import 'package:e_learning_app/navigation/router.gr.dart';
import 'package:gap/gap.dart';

import '../../base/constants/ui/app_text_styles.dart';
import '../../base/constants/ui/dimens.dart';
import '../../base/shared_view/common_app_bar.dart';
import '../../base/shared_view/common_button.dart';
import '../../base/shared_view/common_check_box.dart';
import '../../base/shared_view/common_scaffold.dart';
import '../../base/shared_view/common_text_field.dart';
import '../../resource/generated/assets.gen.dart';
import '../../resource/generated/l10n.dart';
import '../widgets/auth_prompt_widget.dart';
import '../widgets/social_auth_provider/social_auth_provider_page.dart';
import '../widgets/via_widget.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends FoundationState<LoginPage, LoginBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(),
      bottomNavigationBar: AuthPromptWidget(
        message: S.current.dont_have_an_account,
        actionText: S.current.sign_up,
        onActionTap: () {
          AutoRouter.of(context).push(const SignUpRoute());
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.paddingHorizontalLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(60),
            Text(S.current.login_to_ur_account,
                style: AppTextStyles.h1Bold.copyWith(height: 57.6 / 48)),
            const Gap(60),
            CommonTextField(
              hintText: S.current.email,
              prefixIconPath: Assets.icons.message.path,
              onChanged: (val) {
                bloc.add(LoginEmailChangedEvent(val));
              },
            ),
            const Gap(20),
            CommonTextField(
              obscureText: true,
              hintText: S.current.password,
              prefixIconPath: Assets.icons.lock.path,
              onChanged: (val) {
                bloc.add(LoginPasswordChangedEvent(val));
              },
            ),
            const Gap(20),
            Center(
              child: CommonCheckbox(
                label: S.current.remember_me,
                value: false,
                onChanged: (val) {},
              ),
            ),
            const Gap(20),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.isSuccess) {
                  // Trigger user logged in event to load profile
                  context.read<AppBloc>().add(UserLoggedInEvent(''));
                  // Navigate to main page
                  AutoRouter.of(context).push(const MainRoute());
                }
                if (state.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage!)),
                  );
                }
              },
              builder: (context, state) {
                return CommonButton(
                  enable: !state.isLoading &&
                      state.email.isNotEmpty &&
                      state.password.isNotEmpty,
                  onPressed: () {
                    if (!state.isLoading) {
                      bloc.add(LoginSubmittedEvent());
                    }
                  },
                  title: state.isLoading ? 'Signing in...' : S.current.sign_in,
                  fullWidth: true,
                );
              },
            ),
            const Gap(Dimens.paddingVerticalLarge),
            Center(
              child: Text(
                S.current.forgot_the_password,
                style: AppTextStyles.bodyLargeSemiBold
                    .copyWith(color: AppColors.current.primary500),
                textAlign: TextAlign.center,
              ),
            ),
            const Gap(45),
            ViaWidget(title: S.current.or_continue_with.toLowerCase()),
            const Gap(Dimens.paddingVerticalLarge),
            const SocialAuthProviderPage(hideLabel: true),
          ],
        ),
      ),
    );
  }
}
