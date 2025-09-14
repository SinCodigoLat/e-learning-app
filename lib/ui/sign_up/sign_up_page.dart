import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/base/shared_view/common_scaffold.dart';
import 'package:e_learning_app/base/shared_view/common_text_field.dart';
import 'package:e_learning_app/base/shared_view/common_button.dart';
import 'package:e_learning_app/di/di.dart';
import 'package:e_learning_app/navigation/router.gr.dart';

import 'bloc/sign_up_bloc.dart';
import 'bloc/sign_up_event.dart';
import 'bloc/sign_up_state.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SL.get<SignUpBloc>(),
      child: const _SignUpPageView(),
    );
  }
}

class _SignUpPageView extends StatelessWidget {
  const _SignUpPageView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.isSuccess) {
          // Navigate to main page
          AutoRouter.of(context).push(const MainRoute());
        }
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: CommonScaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Back button
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(height: 20),
              // Title
              Text(
                'Create your Account',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 40),
              // Form
              BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      // Full Name Field
                      CommonTextField(
                        hintText: 'Full Name',
                        onChanged: (value) {
                          context
                              .read<SignUpBloc>()
                              .add(SignUpFullNameChangedEvent(value));
                        },
                        prefixIcon: const Icon(Icons.person),
                      ),
                      const SizedBox(height: 16),
                      // Email Field
                      CommonTextField(
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          context
                              .read<SignUpBloc>()
                              .add(SignUpEmailChangedEvent(value));
                        },
                        prefixIcon: const Icon(Icons.email),
                      ),
                      const SizedBox(height: 16),
                      // Password Field
                      CommonTextField(
                        hintText: 'Password',
                        obscureText: true,
                        onChanged: (value) {
                          context
                              .read<SignUpBloc>()
                              .add(SignUpPasswordChangedEvent(value));
                        },
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.visibility_off),
                      ),
                      const SizedBox(height: 24),
                      // Remember Me Checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                          const Text('Remember me'),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Sign Up Button
                      BlocBuilder<SignUpBloc, SignUpState>(
                        builder: (context, state) {
                          return CommonButton(
                            enable: !state.isLoading &&
                                state.email.isNotEmpty &&
                                state.password.isNotEmpty &&
                                state.fullName.isNotEmpty,
                            onPressed: () {
                              if (!state.isLoading) {
                                context
                                    .read<SignUpBloc>()
                                    .add(const SignUpSubmittedEvent());
                              }
                            },
                            title: state.isLoading
                                ? 'Creating Account...'
                                : 'Sign up',
                            fullWidth: true,
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      // Divider
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'or continue with',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Social Login Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildSocialButton(Icons.g_mobiledata, 'Google'),
                          _buildSocialButton(Icons.facebook, 'Facebook'),
                          _buildSocialButton(Icons.apple, 'Apple'),
                        ],
                      ),
                      const SizedBox(height: 40),
                      // Sign In Link
                      Center(
                        child: Text.rich(
                          TextSpan(
                            text: 'Already have an account? ',
                            children: [
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, size: 24),
      ),
    );
  }
}
