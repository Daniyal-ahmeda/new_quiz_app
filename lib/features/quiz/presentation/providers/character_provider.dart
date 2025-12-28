import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/character_repository.dart';
import '../../domain/entities/character.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final characterRepositoryProvider = Provider<CharacterRepository>((ref) {
  return CharacterRepository(ref.watch(firestoreProvider));
});

final characterListProvider = StreamProvider<List<Character>>((ref) {
  return ref.watch(characterRepositoryProvider).getCharacters();
});
