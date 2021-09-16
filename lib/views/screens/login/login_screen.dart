import 'package:ara_vnext/locator.dart';
import 'package:ara_vnext/logic/vm/login_vm.dart';
import 'package:ara_vnext/views/shared/utils/app_colors.dart';
import 'package:ara_vnext/views/shared/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<LoginViewModel>(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryBlue,
        ),
        body: ListView(
          children: [
            LoginHeader(),
            Container(
              padding: EdgeInsets.only(
                top: 77.h,
                bottom: 34.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 45.w,
                      endIndent: 10.5.w,
                      thickness: 1.h,
                      color: Color(0xfff552258bf),
                    ),
                  ),
                  Text(
                    'Or log in with ARA',
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.darkGreyBlue,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 10.6.w,
                      endIndent: 45.w,
                      thickness: 1.h,
                      color: Color(0xfff552258bf),
                    ),
                  ),
                ],
              ),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            offset: Offset(0, 3),
            blurRadius: 16,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            AppImages.araLogo,
            height: 54.h,
          ),
          SizedBox(
            height: 36.5.w,
          ),
          Text(
            'Welcome Back',
            style: TextStyle(
              fontSize: 27.sp,
              color: Colors.white,
              height: 0,
            ),
          ),
          Text(
            'LOG IN!',
            style: TextStyle(
              fontSize: 58.sp,
              height: 1.2,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Text(
            'Please sign in to your\naccount below.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17.sp,
              height: 1,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          MicrosoftButton(),
        ],
      ),
    );
  }
}

class MicrosoftButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50.h,
        width: 230.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
        ),
        child: Image.asset(
          AppImages.microsoft,
          scale: 4,
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          AppInput(
            title: 'Email Address',
            hint: 'Enter Email ID',
            controller: sl<LoginViewModel>().emailController,
          ),
          SizedBox(
            height: 19.h,
          ),
          AppInput(
            title: 'Password',
            hint: 'Enter Password',
            isPassword: true,
            controller: sl<LoginViewModel>().passwordController,
          ),
          SizedBox(
            height: 70.h,
          ),
          PrimaryAppButton(
            title: 'Login',
            onTap: ()async {
              await sl<LoginViewModel>().login();
            },
          ),
        ],
      ),
    );
  }
}

//"username": "test_action_owner@emaratech.ae"
//$2b$10$0cKFD3AYtposSIvMnDwlOuO38FE6dqQ8b.aUs5Ug4mqK8Mt1IHOoS

class PrimaryAppButton extends StatefulWidget {
  final String title;
  final Function onTap;
  const PrimaryAppButton({
    @required this.onTap,
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  _PrimaryAppButtonState createState() => _PrimaryAppButtonState();
}

class _PrimaryAppButtonState extends State<PrimaryAppButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(
        height: 50.h,
        minWidth: MediaQuery.of(context).size.width,
        color: AppColors.primaryBlue,
        onPressed: isLoading == false
            ? () async {
                setState(() {
                  isLoading = true;
                });
                await widget.onTap?.call();
                setState(() {
                  isLoading = false;
                });
              }
            : () {},
        child: Center(
          child: isLoading == true
              ? SizedBox(
                  height: 18.h,
                  width: 18.h,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                )
              : Text(
                  widget.title ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}

class AppInput extends StatefulWidget {
  final bool isPassword;
  final String title;
  final String hint;
  final TextEditingController controller;
  const AppInput({
    @required this.controller,
    this.isPassword,
    this.hint,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  _AppInputState createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isVisibile;

  void togglePasswprdVisibility() {
    setState(() {
      isVisibile = !isVisibile;
    });
  }

  @override
  void initState() {
    super.initState();
    isVisibile = widget.isPassword == true ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            gapPadding: 8.w,
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          contentPadding: EdgeInsets.only(
            left: 21.w,
            top: 12,
          ),
          hintText: widget.hint ?? '',
          labelText: widget.title ?? '',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          suffixIcon: widget.isPassword == true
              ? IconButton(
                  onPressed: () {
                    togglePasswprdVisibility();
                  },
                  icon: Icon(
                    isVisibile
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.black,
                  ),
                )
              : null,
        ),
        obscureText: !isVisibile,
      ),
    );
  }
}
