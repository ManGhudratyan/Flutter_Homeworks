import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/scaffold_messenger.dart';
import '../../../domain/entities/user_entity.dart';
import '../../constants/gaps.dart';
import '../../logic/auth/auth_bloc.dart';
import '../../logic/user/user_bloc.dart';
import '../../widgets/general/app_button.dart';
import '../../widgets/general/gesture_detector.dart';
import '../../widgets/general/gesture_detector_images.dart';
import '../../widgets/general/login_image_widget.dart';
import '../../widgets/general/text_field.dart';
import '../login/login_page.dart';
import '../name/name_page.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key, this.userModel});
  final UserEntity? userModel;

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateFailed) {
          state.error.showErrorSnackBar(context);
        } else if (state is AuthRegistered && state.userId != null) {
          context.read<UserBloc>().add(UpdateEmailEvent(_textController.text));
        }
      },
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error ?? ''),
              ),
            );
          } else if (state is UserDataUpdated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const NamePage(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(''),
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(Gaps.large),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const LoginImageWidget(),
                    const Align(
                      child: Text(
                        'Create account',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: Gaps.largeSecond),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextFieldWidget(controller: _textController),
                    SizedBox(height: Gaps.large),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextFieldWidget(controller: _passwordController, changeObscure: true),
                    SizedBox(height: Gaps.large),
                    AppButton(
                        onPressed: () {
                          final email = _textController.text.trim();
                          final password = _passwordController.text.trim();
                          if (email.isNotEmpty && password.isNotEmpty) {
                            context
                                .read<AuthBloc>()
                                .add(SignUpEvent(email, password));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please enter your email'),
                              ),
                            );
                          }
                        },
                        title: 'Continue'),
                    SizedBox(height: Gaps.largeSecond),
                    const GestureDetectorImages(),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Have an account? '),
                        GestureDetectorWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          title: 'Log in',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
