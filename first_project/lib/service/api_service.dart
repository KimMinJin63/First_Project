import 'dart:convert';
import 'package:http/http.dart' as http;

void saveAddressToFirestore() async {
  var url = Uri.parse('https://firestore.googleapis.com/v1/projects/firstproject-4f102/databases/(default)/documents/restaurant');

  var headers = {'Content-Type': 'application/json'};
  
  // 주소 데이터를 Firestore에 저장할 형식으로 변환합니다.
  var body = jsonEncode({
    'fields': {
      'address': {'stringValue': 'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=%EB%B6%81%EA%B5%AC'}
    }
  });
 
  var response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    print('주소가 Firestore에 성공적으로 저장되었습니다.');
  } else {
    print('주소를 Firestore에 저장하는 데 실패했습니다. 에러 코드: ${response.statusCode}');
  }
}
