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
  RxString selectedDistrict = ''.obs;
  List selectedRestaurant = [];
  // RxString selectedRestaurantCnt = ''.obs;

  // findRestaurant() async {
  //   if (findName.value.isNotEmpty) {
  //     List<QuerySnapshot> snapshots = [];

  //      selectedRestaurant.clear();

  //     for (var collectionName in [
  //       '동구',
  //       '서구',
  //       '남구',
  //       '북구',
  //       '중구',
  //       '달서구',
  //       '수성구',
  //       '달성군',
  //     ]) {
  //       QuerySnapshot snapshot = await FirebaseFirestore.instance
  //           .collection(collectionName)
  //           .where('name', isEqualTo: findName.value)
  //           .get();
  //       snapshots.add(snapshot);
  //       selectedRestaurant.add(snapshot);
  //       print('뭐가 뜰까? : ${selectedRestaurant.length}');
  //     }
  //     List<District> results = [];
  //     for (var snap in snapshots) {
  //       results.addAll(
  //         snap.docs.map((doc) => District.fromSnapshot(doc)),
  //       );
  //     }
  //     if (results.isEmpty) {
  //       print('일치하는 결과가 없습니다.');
  //       searchResults.clear();
  //     } else {
  //       print('일치하는 결과를 찾았습니다: $results');
  //       searchResults.assignAll(results);
  //     }
  //   } else {
  //     searchResults.clear();
  //   }
  // }


  findRestaurant() async {
  if (findName.value.isNotEmpty) {
    // Clear the existing results before processing new ones
    selectedRestaurant.clear();

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

      // Extract the documents from the snapshot and add them to selectedRestaurant
      selectedRestaurant.addAll(snapshot.docs);

      print('뭐가 뜰까? : ${selectedRestaurant.length}');
    }

    List<District> results = selectedRestaurant.map((doc) => District.fromSnapshot(doc)).toList();

    if (results.isEmpty) {
      print('일치하는 결과가 없습니다.');
      searchResults.clear();
    } else {
      print('일치하는 결과를 찾았습니다: $results');
      searchResults.assignAll(results);
    }
  } else {
    // Clear the results if the search name is empty
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

  Future<List<Message>> fetchMessages(
      List<String> collections, District restaurant) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final List<QuerySnapshot> querySnapshots = [];

      // for (var collectionName in collections) {
      final myCollection = await firestore
          .collection(selectedDistrict.value)
          .doc(restaurant.cnt)
          .collection('messages')
          .orderBy('sendDate', descending: true) // sendDate를 기준으로 내림차순으로 정렬
          .limit(2)
          .get();
      // print('여기는??? : ${myCollection.docs.}');
      querySnapshots.add(myCollection);
      print('여긴 몇개? : ${querySnapshots.length}');
      // }

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
          data.add(Message(
              content: content,
              sendDate: sendDate,
              myInfo: MyInfo(name: name)));
          print('이건 몇개? : ${data.length}');
        }
      }
      data.sort((a, b) => -a.sendDate.compareTo(b.sendDate));

      // 데이터 갱신 후 상태 업데이트
      messages.assignAll(data);
    } catch (e) {
      // Handle error
      rethrow;
    }
    return messages;
  }

  void onPressedButton(List<String> collections, District restaurant) {
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
            .doc(restaurant.cnt)
            .collection('messages')
            .add(data);
      }

      textEditingController.clear();
      fetchMessages(collections, restaurant);
    } catch (e) {
      print('Error adding message: $e');
    }
  }

  // streamMessages(List<String> collections, cnt) {}
}
