import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/user_entity.dart';
import '../../constants/gaps.dart';
import '../../logic/user/user_bloc.dart';
import '../../widgets/general/app_button.dart';
import '../../widgets/general/gesture_detector.dart';
import '../../widgets/general/gesture_detector_images.dart';
import '../../widgets/general/login_image_widget.dart';
import '../gender/gender_page.dart';

class DateBirth extends StatefulWidget {
  const DateBirth({super.key, this.userModel});
  final UserEntity? userModel;

  @override
  State<DateBirth> createState() => _DateBirthState();
}

class _DateBirthState extends State<DateBirth> {
  final TextEditingController _textController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _textController.text = DateFormat('yyyy/MM/dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error ?? 'An error occurred'),
            ),
          );
        } else if (state is UserDataUpdated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const GenderPage(),
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
                      'Date of Birth',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextField(
                    controller: _textController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Gaps.largeSecond),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      fillColor: const Color.fromRGBO(211, 211, 211, 1),
                      filled: true,
                      hintText: 'YYYY/MM/DD',
                    ),
                  ),
                  SizedBox(height: Gaps.large),
                  AppButton(
                    onPressed: () {
                      if (_selectedDate != null) {
                        context
                            .read<UserBloc>()
                            .add(UpdateBirthdayEvent(_selectedDate!));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter your birthday.'),
                          ),
                        );
                      }
                    },
                    title: 'Continue',
                  ),
                  SizedBox(height: Gaps.largeSecond),
                  const GestureDetectorImages(),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Have an account? '),
                      GestureDetectorWidget(
                        onTap: () {},
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
    );
  }
}
