import 'package:tunelike/views/components/design.dart';

class TuneLikeAppBar extends StatefulWidget {
  const TuneLikeAppBar({super.key});

  @override
  State<TuneLikeAppBar> createState() => _TuneLikeAppBarState();
}

class _TuneLikeAppBarState extends State<TuneLikeAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: BottomNavigationBar(
        items: const [],
      ),
    );
  }
}
