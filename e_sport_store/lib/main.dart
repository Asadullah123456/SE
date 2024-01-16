// ignore: depend_on_referenced_packages
import 'package:e_sport_store/Views/splash-screen/splash-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'consts/consts.dart';

 void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyC3bIYmtIy3zVO6yS7RKMnyHdzEbft2z-0", 
      appId: "1:650746773305:android:9623722f82771de0aeb2e8", 
      messagingSenderId: "650746773305", 
      projectId: "e-store-60d32", 
      ),
  );
  runApp(const MyApp());
}


/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp();
  } catch (error) {
    print("Error initializing Firebase: $error");
  }

  runApp(const MyApp());
}
*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //due to GetX we change this
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: darkFontGrey,
        ),
        backgroundColor: Colors.transparent
      ),
      fontFamily: regular,
     ),
   home: const splashScreen(),
    );
  }
}
//SHA1: 4E:D7:66:F4:AC:29:F3:E2:A5:4B:B7:47:0E:43:0F:21:01:1A:6E:54
//SHA-256: 80:B0:61:26:CF:96:3D:E7:EA:C6:3A:60:B6:F9:19:A2:F6:43:46:65:B5:F3:AC:08:93:3A:5A:4E:68:65:1B:3F  