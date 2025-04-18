// lib/widgets/voice_input_handler.dart
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceInputHandler {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

  bool get isListening => _isListening;

  Future<void> startListening({
    required Function(List<String> words) onWordsRecognized,
    required Function(String error) onError,
    required Function() onListeningStart,
    required Function() onListeningStop,
    required Function(String partialResult) onPartialText,
  }) async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        debugPrint('Speech status: $status');
        if (status == 'done') {
          _isListening = false;
          onListeningStop();
        }
      },
    );

    if (!available) {
      onError("Speech not available");
      return;
    }

    _isListening = true;
    onListeningStart();

    _speech.listen(
      onResult: (result) {
        final rawText = result.recognizedWords.trim();

        if (!result.finalResult) {
          onPartialText(rawText);
          return;
        }

        stopListening(); // auto-stop mic
        onListeningStop();

        final List<String> items =
            rawText
                .toLowerCase()
                .replaceAll(
                  RegExp(r'\b(and then|plus|with|and|comma|next)\b'),
                  ',',
                )
                .split(',')
                .map((e) => e.trim())
                .where((e) => e.isNotEmpty)
                .toList();

        onWordsRecognized(items);
      },
      listenOptions: stt.SpeechListenOptions(
        listenMode: stt.ListenMode.confirmation,
        partialResults: true,
      ),
    );
  }

  void stopListening() {
    _speech.stop();
    _isListening = false;
  }
}
