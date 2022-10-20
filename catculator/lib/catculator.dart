import 'package:flutter/material.dart';

class MyCatculator extends StatefulWidget {
  const MyCatculator({super.key});

  @override
  State<MyCatculator> createState() => _MyCatculatorState();
}

class _MyCatculatorState extends State<MyCatculator> {
  Widget catbutton(String btntxt, Color btncolor, Color txtcolor) {
    return ElevatedButton(
      onPressed: () {
        // Function of this Button
        calculation(btntxt);
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: btncolor,
        padding: const EdgeInsets.all(30),
      ),
      child: Text(
        btntxt,
        style: TextStyle(
          fontSize: 35,
          color: txtcolor,
        ),
      ),
    );
  }

    Widget catbutton1(String btntxt, Color btncolor, Color txtcolor) {
    return ElevatedButton(
      onPressed: () {
        // Function of this Button
        calculation(btntxt);
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: btncolor,
        padding: const EdgeInsets.all(20),
      ),
      child: Text(
        btntxt,
        style: TextStyle(
          fontSize: 35,
          color: txtcolor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("MyCatculator"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Calculator Display
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      text,
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.white, fontSize: 100),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Function Buttons
                catbutton1('AC', Colors.grey, Colors.black),
                catbutton1('+/-', Colors.grey, Colors.black),
                catbutton('%', Colors.grey, Colors.black),
                catbutton(
                    '/', const Color.fromARGB(255, 255, 149, 0), Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Function Buttons
                catbutton('7', Colors.grey, Colors.black),
                catbutton('8', Colors.grey, Colors.black),
                catbutton('9', Colors.grey, Colors.black),
                catbutton(
                    'x', const Color.fromARGB(255, 255, 149, 0), Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Function Buttons
                catbutton('4', Colors.grey, Colors.black),
                catbutton('5', Colors.grey, Colors.black),
                catbutton('6', Colors.grey, Colors.black),
                catbutton(
                    '-', const Color.fromARGB(255, 255, 149, 0), Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Function Buttons
                catbutton('1', Colors.grey, Colors.black),
                catbutton('2', Colors.grey, Colors.black),
                catbutton('3', Colors.grey, Colors.black),
                catbutton(
                    '+', const Color.fromARGB(255, 255, 149, 0), Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Function Buttons
                ElevatedButton(
                  onPressed: () {
                    //Button Function
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.fromLTRB(34, 20, 120, 20),
                      backgroundColor: Colors.grey),
                  // ignore: prefer_const_constructors
                  child: Text(
                    "0",
                    style: const TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                catbutton('.', Colors.grey, Colors.black),
                catbutton('=', Colors.grey, Colors.black),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  //CALCULATOR LOGIC
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = '$result.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-$result';
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }
}
