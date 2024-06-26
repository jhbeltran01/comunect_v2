import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

final FirebaseFirestore firestoreDb = FirebaseFirestore.instance;
final FirebaseStorage storage = FirebaseStorage.instance;
final FirebaseDatabase realtimeDb = FirebaseDatabase.instance;
PermissionStatus? locationPermissionStatus;