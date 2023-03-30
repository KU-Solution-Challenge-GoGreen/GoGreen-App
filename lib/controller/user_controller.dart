import 'package:firebase_auth/firebase_auth.dart';
import 'package:gogreen_client/constants/enums.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

import '../models/input/user_input.dart';
import '../models/profile.dart';
import '../models/user_detail.dart';
import '../repository/firebase/firebase_storage.dart';
import '../repository/user/payload/user_payload.dart';
import '../repository/user/user_repository.dart';

final UserRepository userRepository = UserRepository();

Future<Profile?> findUserByToken() async {
  return userRepository.findUserByToken();
}

Future<ResponseStatus> registerUserToDB(String nickname) async {
  Profile? profile = await userRepository.registerUser(nickname);
  return profile != null ? ResponseStatus.success : ResponseStatus.error;
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<void> logoutGoogle() async {
  await GoogleSignIn().signOut();
  //navigate
  //Get.off(() => SignInScreen());
}

Future<ResponseStatus> updateUser(String userId, UserInput user) async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  //user photo에 들어있는게 XFile이라면 사진을 업로드하고, 아니면 그냥 둔다

  String? photo = user.photo == null
      ? null
      : await user.photo!.join(
          (XFile image) => uploadImageToFirebase(image, 'users/$userId'),
          (String url) => url,
        );

  Profile? profile = await userRepository.updateUser(
      userId,
      UserPayload(
        name: user.name,
        photo: photo,
      ));

  return profile != null ? ResponseStatus.success : ResponseStatus.error;
}

Future<UserDetail?> getUserDetail() async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  return userRepository.getUserDetail(userId);
}
