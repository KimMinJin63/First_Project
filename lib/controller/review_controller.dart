import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/controller/auth_controller.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/model/message.dart';
import 'package:first_project/model/my_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  RxString findName = ''.obs;
  RxList<Message> messages = <Message>[].obs;
  RxList<District> searchResults = <District>[].obs;
  TextEditingController searchController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  User user = Get.find<AuthController>().user!;

  findRestaurant() async {
    if (findName.value.isNotEmpty) {
      List<QuerySnapshot> snapshots = [];

      for (var collectionName in [
        '동구',
        '서구',
        '남구',
        '북구',
        '중구',
        '달서구',
        '수성구',
        '달성군',
      ]) {
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection(collectionName)
            .where('name', isEqualTo: findName.value)
            .get();
        snapshots.add(snapshot);
      }
      List<District> results = [];
      for (var snap in snapshots) {
        results.addAll(
          snap.docs.map((doc) => District.fromSnapshot(doc)),
        );
      }
      if (results.isEmpty) {
        print('일치하는 결과가 없습니다.');
        searchResults.clear();
      } else {
        print('일치하는 결과를 찾았습니다: $results');
        searchResults.assignAll(results);
      }
    } else {
      searchResults.clear();
    }
  }

  Future<List<District>> detailRestaurant(String name) async {
    List<District> results = [];
    for (var collectionName in [
      '동구',
      '서구',
      '남구',
      '북구',
      '중구',
      '달서구',
      '수성구',
      '달성군',
    ]) {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection(collectionName)
          .where('name', isEqualTo: name)
          .get();

      results.addAll(
        snapshot.docs.map((doc) => District.fromSnapshot(doc)),
      );
    }
    return results;
  }

  Future<void> fetchMessages(
      List<String> collections, String restaurantName) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final List<QuerySnapshot> querySnapshots = [];

      for (var collectionName in collections) {
        final myCollection = firestore
            .collection(collectionName)
            .doc(restaurantName)
            .collection('messages');
        final querySnapshot = await myCollection.get();
        querySnapshots.add(querySnapshot);
      }

      final data = <Message>[];
      for (var querySnapshot in querySnapshots) {
        final docs = querySnapshot.docs;
        for (final doc in docs) {
          final docRef = doc.get('myInfo');
          final String content = doc.get('content');
          final Timestamp sendDateTimestamp = doc.get('sendDate') as Timestamp;
          final DateTime sendDate = sendDateTimestamp.toDate();
          final DocumentSnapshot refDocSnapshot = await docRef.get();
          final String name = refDocSnapshot.get('name') as String;
          String? photoUrl = refDocSnapshot.get('photoUrl') as String?;
          if (photoUrl == null) {
            print('null 입니다.');
          }
          data.add(Message(
              content: content,
              sendDate: sendDate,
              myInfo: MyInfo(name: name, photoUrl: photoUrl)));
        }
      }
      data.sort((a, b) => -a.sendDate.compareTo(b.sendDate));

      // 데이터 갱신 후 상태 업데이트
      messages.assignAll(data);
    } catch (e) {
      // Handle error
      rethrow;
    }
  }

  void onPressedButton(List<String> collections, String restaurantName) {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final DocumentReference docRef =
          firestore.collection('user').doc(user.uid);

      Map<String, dynamic> data = {
        'content': textEditingController.text,
        'sendDate': DateTime.now(),
        'myInfo': docRef,
      };

      for (var collectionName in collections) {
        FirebaseFirestore.instance
            .collection(collectionName)
            .doc(
                restaurantName) // Assuming 'restaurantName' is the document ID of the restaurant
            .collection('messages')
            .add(data);
      }

      textEditingController.clear();
      fetchMessages(collections, restaurantName);
    } catch (e) {
      print('Error adding message: $e');
    }
  }

  streamMessages(List<String> collections, cnt) {}
}
