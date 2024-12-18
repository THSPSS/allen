import 'dart:convert';

import 'package:allen/secrets.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  Future<String> isArtPromptAPI(String prompt) async {
    try {
      final result = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $opneAIAPIKey',
        },
        body: jsonEncode(
          {
            'model': 'gpt-4o-mini',
            'messages': [
              {
                "role": "user",
                "content":
                    "Does this message want to generate an AI picture, image, art or anything similar? $prompt . Simply answer with a yes or no.",
              }
            ],
          },
        ),
      );
      print(result.body);

      if (result.statusCode == 200) {
        print('Yay');
      }

      return 'AI';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async {
    return 'CHATGPT';
  }

  Future<String> dallEAPI(String prompt) async {
    return 'DallE';
  }
}
