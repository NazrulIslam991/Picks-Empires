import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../data/sources/local_shared_preference/shared_preferene.dart';

class AuthService {
  // Creating instances for Firebase Auth and Google Sign-In
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// --- GOOGLE SIGN IN FEATURE ---
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // 1. Open the Google account picker (shows a list of available Google accounts)
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // 2. If the user dismisses the dialog or hits back, return null to stop the process
      if (googleUser == null) return null;

      // 3. Fetch security tokens (Access Token and ID Token) from the selected Google account
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // 4. Wrap the Google tokens into a Firebase-compatible Credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 5. Authenticate the user into Firebase using the generated credential
      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      // 6. Retrieve the Firebase JWT (ID Token) for backend API authorization
      String? token = await userCredential.user?.getIdToken();

      // 7. Store the token locally in SharedPreferences for persistent session management
      if (token != null) {
        await SharedPreferenceData.setToken(token);
      }

      return userCredential;
    } catch (e) {
      // Log any errors that occur during the sign-in flow (e.g., network issues)
      print("Error during Google Sign-In: $e");
      return null;
    }
  }

  /// --- LOGOUT FEATURE ---
  Future<void> signOut() async {
    try {
      // 1. Terminate the Google session (this allows account switching next time)
      await _googleSignIn.signOut();

      // 2. Terminate the Firebase Auth session
      await _auth.signOut();

      // 3. Clear the saved token from SharedPreferences to prevent unauthorized API access
      await SharedPreferenceData.removeToken();

      print("User signed out successfully.");
    } catch (e) {
      // Log errors if the logout process fails
      print("Error signing out: $e");
    }
  }
}
