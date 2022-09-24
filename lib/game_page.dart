import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guessnumber3_homework3_630710324/game.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var _input = '';
  final Game _game = Game();

  void _handleClickButton(num) {

      setState(() {
        if (num == -1) {
          var endpoint = _input.length - 1;
          _input = _input.substring(0, endpoint);
        } else if (num == -2) {
          _input = '';
        }
        else if (num == -3) {
          _input = 'Guess';
        } else if (_input.length >= 3) {
          return;
        } else {
          _input += num.toString();
        }
      });
    }

  Widget _buildNumberButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => _handleClickButton(num),
        customBorder: CircleBorder(),
        child: Container(
          width: 50.0,
          height: 30.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: num != -1
                ? Border.all(
                    color: Color(0xFFCCCCCC),
                    width: 1.0,
                  )
                : null,
          ),
          child: num == -1
              ? Icon(Icons.backspace_outlined)
              : Text(
                  num.toString(),
                  style: GoogleFonts.firaCode(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GUESS THE NUMBER'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/image/guess_logo.png', width: 90.0),
              SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    'GUESS',
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFFCCCCCC),
                    ),
                  ),
                  Text(
                    'THE NUMBER',
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              _input,
              style: TextStyle(fontSize: 50),
            ),
          ),
          Text(
            'ทายเลข 1 ถึง 100',
            style: GoogleFonts.aBeeZee(fontSize: 20),
          ),
          SizedBox(height: 16.0),
          Column(
            children: [
              for (var row in [
                [1, 2, 3],
                [4, 5, 6],
                [7, 8, 9]
              ])
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [for (var i in row) _buildNumberButton(i)],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNumberButton(-2),
                  _buildNumberButton(0),
                  _buildNumberButton(-1),
                ],
              ),
              _buildNumberButton(-3),
            ],
          ),
        ],
      ),
    );
  }
}
