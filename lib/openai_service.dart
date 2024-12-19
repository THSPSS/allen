import 'dart:convert';

import 'package:allen/secrets.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  //able to store messages in local storage
  final List<Map<String, String>> messages = [];
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

      if (result.statusCode == 200) {
        String content =
            jsonDecode(result.body)['choices'][0]['message']['content'];
        content = content.trim();

        switch (content) {
          case 'Yes':
          case 'yes':
          case 'Yes.':
          case 'yes.':
            final res = await dallEAPI(prompt);
            return res;
          default:
            final res = await chatGPTAPI(prompt);
            return res;
        }
      }

      return 'An internal error occured';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async {
    messages.add(
      {
        'role': 'user',
        'content': prompt,
      },
    );
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
            'messages': messages,
          },
        ),
      );

      if (result.statusCode == 200) {
        String content =
            jsonDecode(result.body)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add({
          'role': 'assistant',
          'content': content,
        });

        return content;
      }

      return 'An internal error occured';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> dallEAPI(String prompt) async {
    messages.add(
      {
        'role': 'user',
        'content': prompt,
      },
    );
    try {
      final result = await http.post(
        Uri.parse('https://api.openai.com/v1/images/generations'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $opneAIAPIKey',
        },
        body: jsonEncode(
          {
            'model': 'dall-e-3',
            'prompt': prompt,
          },
        ),
      );

      if (result.statusCode == 200) {
        String imageUrl = jsonDecode(result.body)['data'][0]['url'];
        imageUrl = imageUrl.trim();

        messages.add({
          'role': 'assistant',
          'content': imageUrl,
        });

        return imageUrl;
      }

      return 'An internal error occured';
    } catch (e) {
      return e.toString();
    }
  }
}
