import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ChessBoardController controller = ChessBoardController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChessM',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'ChessM°™',
            style: GoogleFonts.quicksand(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: ChessBoard(
                  controller: controller,
                  boardColor: BoardColor.green,
                  boardOrientation: PlayerColor.white,
                  arrows: [
                    BoardArrow(
                      from: 'd2',
                      to: 'd4',
                      color: Colors.red.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: ValueListenableBuilder<Chess>(
                    valueListenable: controller,
                    builder: (context, game, _) {
                      return Text(controller.getSan().fold(
                            '',
                            (previousValue, element) =>
                                previousValue + '\n' + (element ?? ''),
                          ));
                    }))
          ],
        ),
      ),
    );
  }
}
