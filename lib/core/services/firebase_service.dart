import 'package:firebase_core/firebase_core.dart';
// import '../../firebase_options.dart'; // Uncomment if using generated options

class FirebaseService {
  static Future<void> initialize() async {
    // Ideally, we use DefaultFirebaseOptions.currentPlatform if generated
    // For now, we assume standard initialization or prompt user to configure
    try {
      await Firebase.initializeApp();
    } catch (e) {
      // Handle initialization error (e.g. if already initialized)
      print('Firebase initialization failed: $e');
    }
  }
}
