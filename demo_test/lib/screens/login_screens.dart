import 'package:demo_test/screens/dashboard_screen.dart';
import 'package:demo_test/screens/shared_prefernce_helper.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey= GlobalKey<FormState>();
  var Login={
    'email' : 'test@gmail.com',
    'password' : '12345678',
  };
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  void login(){
    if(_formkey.currentState!.validate()){
      if(emailcontroller.text == Login['email'] && passwordcontroller.text ==
      Login['password']){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DashbaordScreen()));
        SharedprefernceHelper.prefs.setBool('loggedin', true);

      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please provide valid email and password')));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: SafeArea(child: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.only(left: 40.0 , right: 40 , top: 100),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://png.pngtree.com/png-clipart/20191121/original/pngtree-user-login-or-authenticate-icon-on-gray-background-flat-icon-ve-png-image_5089976.jpg'),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 2,
                width: 80,
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Text('Welcome to\nDemo APP\nLogin ', style: TextStyle(color: Colors.white,
              fontSize: 30, fontWeight: FontWeight.w300),),
              SizedBox(
                height: 50,
              ),
              Text('Enter Your Email' , style: TextStyle(color: Colors.white),),
              TextFormField(
                style: TextStyle(color: Colors.white),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'info@gmail.com',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(Icons.email ,),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                ),
                controller: emailcontroller,
                validator: (value){
                  if(value== null || value.isEmpty || !value.contains('@') || !value.contains('.')){
                    return 'Invalid Email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              Text('Enter Password' , style: TextStyle(color: Colors.white),),
              TextFormField(
                style: TextStyle(color: Colors.white),
                obscureText: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: '********',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(Icons.vpn_key,),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                ),
                controller: passwordcontroller,
                validator: (value){
                  if(value== null || value.isEmpty || value.length < 8){
                    return 'Password should be atleast 8 digits';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: login,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.blue
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('LogIn', style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold ,
                    fontSize: 20),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),)),
    );
  }
}
