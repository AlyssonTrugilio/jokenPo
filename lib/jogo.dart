import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemAle = AssetImage('images/padrao.png');

  imagemPadrao() {
    setState(() {
      _imagemAle = AssetImage('images/padrao.png');
      _msgResult = 'Escolha uma das opções abaixo';
    });
  }

  var _msgResult = 'Escolha uma das opções abaixo';

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ['Pedra', 'Papel', 'Tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print('Escolha do App:' + escolhaApp);
    print('Escolha do usuario:' + escolhaUsuario);

    switch (escolhaApp) {
      case 'Pedra':
        setState(() {
          _imagemAle = AssetImage('images/pedra.png');
        });
        break;

      case 'Papel':
        setState(() {
          _imagemAle = AssetImage('images/papel.png');
        });
        break;

      case 'Tesoura':
        setState(() {
          _imagemAle = AssetImage('images/tesoura.png');
        });
        break;
      default:
    }

    if (
        //APP ganhador
        (escolhaApp == 'Pedra' && escolhaUsuario == 'Tesoura') ||
            (escolhaApp == 'Tesoura' && escolhaUsuario == 'Papel') ||
            (escolhaApp == 'Papel' && escolhaUsuario == 'Pedra')) {
      _msgResult = 'Você perdeu ):';
    } else if (
        //Usuario ganhador
        (escolhaUsuario == 'Pedra' && escolhaApp == 'Tesoura') ||
            (escolhaUsuario == 'Tesoura' && escolhaApp == 'Papel') ||
            (escolhaUsuario == 'Papel' && escolhaApp == 'Pedra')) {
      _msgResult = 'Boa, você venceu!';
    } else {
      _msgResult = 'Empatamos ( ;';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'JokenPo',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 16, 218, 150),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 25),
            child: Text(
              'Escolha do App:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: this._imagemAle),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 40),
            child: Text(
              _msgResult,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada('Pedra'),
                child: Image.asset(
                  'images/pedra.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('Papel'),
                child: Image.asset(
                  'images/papel.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('Tesoura'),
                child: Image.asset(
                  'images/tesoura.png',
                  height: 100,
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 50),
              child: ElevatedButton(
                  onPressed: () {
                    imagemPadrao();
                    print('Botao foi precionado');
                  },
                  child: Text(
                    'Reiniciar',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 16, 218, 150),
                  )))
        ],
      ),
    );
  }
}
