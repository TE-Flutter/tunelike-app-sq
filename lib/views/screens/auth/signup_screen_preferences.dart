import 'package:tunelike/domain/model/models.dart';
import 'package:tunelike/views/components/design.dart';
import 'package:tunelike/domain/repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<Genre> _mockGenres = [
  Genre(id: 0, name: 'Rap', color: const Color.fromARGB(255, 14, 51, 234)),
  Genre(id: 1, name: 'Hip-Hop', color: const Color.fromARGB(255, 8, 219, 43)),
  Genre(id: 2, name: 'Rock', color: const Color.fromARGB(255, 235, 44, 15)),
  Genre(id: 3, name: 'RnB', color: const Color.fromARGB(255, 108, 1, 133)),
  Genre(id: 4, name: 'Reggae', color: const Color.fromARGB(255, 208, 239, 12)),
  Genre(
      id: 5, name: 'Reggaeton', color: const Color.fromARGB(255, 234, 132, 22)),
  Genre(id: 6, name: 'Folk', color: const Color.fromARGB(255, 19, 160, 241)),
  Genre(id: 7, name: 'House', color: const Color.fromARGB(255, 255, 152, 233)),
  Genre(
      id: 8,
      name: 'Drum n Bass',
      color: const Color.fromARGB(255, 222, 64, 80)),
  Genre(
      id: 7, name: 'Country', color: const Color.fromARGB(255, 205, 255, 152)),
  Genre(id: 11, name: 'Blues', color: const Color.fromARGB(255, 71, 104, 176)),
  Genre(id: 22, name: 'Jazz', color: const Color.fromARGB(255, 255, 212, 152)),
  Genre(id: 14, name: 'Jazz', color: const Color.fromARGB(255, 255, 212, 152)),
  Genre(id: 12, name: 'Jazz', color: const Color.fromARGB(255, 255, 212, 152)),
];

List<Genre> _selectedGenres = [];

// ignore: camel_case_types
class SignUpScreen_Preferences extends StatefulWidget {
  const SignUpScreen_Preferences({super.key, required this.user});
  final TuneLikeUser user;

  @override
  State<SignUpScreen_Preferences> createState() =>
      // ignore: no_logic_in_create_state
      _SignUpScreen_PreferencesState(user);
}

// ignore: camel_case_types
class _SignUpScreen_PreferencesState extends State<SignUpScreen_Preferences> {
  _SignUpScreen_PreferencesState(this.user);
  TuneLikeUser user;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferences'), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          const Text('Select your \nfavorite genres',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Mosk')),
          const SizedBox(height: 45),
          SizedBox(
            width: 300,
            child: RoundedInputWidget(
              controller: searchController,
              labelText: 'What genre do you like?',
              prefixIcon: Icons.search,
            ),
          ),
          const SizedBox(height: 45),
          SizedBox(
            child: buildGenresList(_mockGenres),
          ),
          const SizedBox(height: 45),
          Container(
            alignment: Alignment.center,
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: RoundedButtonWidget(
              minSize: const Size(200, 80),
              buttonText: 'Continue',
              onPressed: proceedAccountCreate,
            ),
          ),
        ],
      ),
    );
  }

  void proceedAccountCreate() async {
    user = user.copyWith(genres: _selectedGenres);

    final modelRef = FirebaseFirestore.instance
        .collection('users')
        .withConverter<TuneLikeUser>(
          fromFirestore: (snapshot, _) =>
              TuneLikeUser.fromJson(snapshot.data()! as String),
          toFirestore: (model, _) => model.toMap(),
        );

    await modelRef.add(user);

    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/HomeScreen');
  }

  Widget buildGenresList(List<Genre> genreList) {
    return SizedBox(
      height: 220,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Theme.of(context).colorScheme.surface),
          ),
          child: SingleChildScrollView(
            child: Wrap(
              spacing: -1,
              runSpacing: -1,
              direction: Axis.horizontal,
              children: genreList
                  .map((element) => GenreItem(genre: element))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class GenreItem extends StatefulWidget {
  const GenreItem({super.key, required this.genre});
  final Genre genre;

  @override
  State<GenreItem> createState() => _GenreItemState();
}

class _GenreItemState extends State<GenreItem> {
  bool isSelected = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: select,
      child: Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              border:
                  Border.all(color: Theme.of(context).colorScheme.onPrimary),
              color: isSelected
                  ? widget.genre.color
                  : widget.genre.color.withOpacity(0.15),
              backgroundBlendMode: BlendMode.difference),
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Text(
            widget.genre.name,
            style: TextStyle(
                fontFamily: 'Mosk',
                color: Theme.of(context).colorScheme.onSurface),
            textAlign: TextAlign.center,
          )),
    );
  }

  void select() {
    setState(() {
      if (isSelected) {
        _selectedGenres.contains(widget.genre)
            ? _selectedGenres.remove(widget.genre)
            : null;
        isSelected = false;
      } else {
        _selectedGenres.add(widget.genre);
        isSelected = true;
      }
    });
  }
}
