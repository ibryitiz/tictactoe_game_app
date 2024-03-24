import 'package:flutter/material.dart';
import 'package:tictactoe_game/generated/l10n.dart';
import 'package:tictactoe_game/pages/home_page.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 120.0),
              child: Text(
                "T I C  T A C  T O E",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Minecraft",
                  color: Colors.white
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.none,
                  ),
                  shape: BoxShape.circle),
              child: Image.asset(
                'lib/images/tictactoelogo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 80.0),
              child: Text(
                "@ i b r a h i m . y t z",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Minecraft",
                    color: Colors.white
                ),
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, bottom: 60),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          padding: const EdgeInsets.all(30),
                          color: Colors.white,
                          child: Center(
                              child: Text(
                            S.of(context).play,
                            style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "Minecraft",
                                color: Colors.black,
                              fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                      ),
                  ),
              ),
          ) ,
        ],
      ),
    );
  }
}
