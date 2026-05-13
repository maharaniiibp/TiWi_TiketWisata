import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isHidden = true;

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // IMAGE
            SizedBox(
              height: 320,
              width: double.infinity,

              child: Image.asset(
                'assets/images/login.png',
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // TITLE
            const Text(
              "TiWi",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0066B3),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Your journey begins here",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 30),

            // LOGIN CARD
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  // EMAIL
                  const Text(
                    "Email Address",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    controller: emailController,

                    decoration: InputDecoration(
                      hintText:
                          "student@university.edu",

                      prefixIcon: const Icon(
                        Icons.email_outlined,
                      ),

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // PASSWORD
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    controller: passwordController,
                    obscureText: isHidden,

                    decoration: InputDecoration(
                      hintText: "••••••••",

                      prefixIcon: const Icon(
                        Icons.lock_outline,
                      ),

                      suffixIcon: IconButton(
                        icon: Icon(
                          isHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),

                        onPressed: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                      ),

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // LOGIN BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 58,

                    child: ElevatedButton(
                 onPressed: () {

  if (emailController.text.isNotEmpty &&
      passwordController.text.isNotEmpty) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const HomeScreen(),
      ),
    );

  } else {

    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(
        content: Text(
          "Email dan password wajib diisi",
        ),
      ),
    );
  }
},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF0066B3),

                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16),
                        ),
                      ),

                      child: const Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        children: [

                          Text(
                            "Login to TiWi",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          SizedBox(width: 8),

                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // FOOTER
            const Text(
              "Trouble logging in?",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: const [

                Icon(
                  Icons.help_outline,
                  color: Color(0xFF0066B3),
                  size: 18,
                ),

                SizedBox(width: 4),

                Text(
                  "Support",
                  style: TextStyle(
                    color: Color(0xFF0066B3),
                  ),
                ),

                SizedBox(width: 20),

                Icon(
                  Icons.shield_outlined,
                  color: Color(0xFF0066B3),
                  size: 18,
                ),

                SizedBox(width: 4),

                Text(
                  "Privacy",
                  style: TextStyle(
                    color: Color(0xFF0066B3),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}