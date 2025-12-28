import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/character.dart';
import '../../data/models/character_model.dart';

class CharacterRepository {
  final FirebaseFirestore _firestore;

  CharacterRepository(this._firestore);

  CollectionReference<CharacterModel> get _charactersRef => _firestore
      .collection('characters')
      .withConverter<CharacterModel>(
        fromFirestore: (snapshot, _) =>
            CharacterModel.fromJson({...snapshot.data()!, 'id': snapshot.id}),
        toFirestore: (character, _) => character.toJson()..remove('id'),
      );

  Stream<List<Character>> getCharacters() {
    return _charactersRef.snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
    );
  }

  Future<void> addCharacter(CharacterModel character) async {
    await _charactersRef.add(character);
  }

  Future<void> updateCharacter(CharacterModel character) async {
    await _charactersRef.doc(character.id).set(character);
  }

  Future<void> deleteCharacter(String id) async {
    await _charactersRef.doc(id).delete();
  }
}
