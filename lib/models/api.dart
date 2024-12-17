class Joke{
  final String type;
  final String setup;
  final String punchline;

  Joke({
    required this.type,
    required this.setup,
    required this.punchline,
  });

  // Factory constructor for parsing JSON
  factory Joke.fromJson(Map<String, dynamic> data) {
    return Joke(
      setup: data['setup'] as String,
      punchline: data['punchline'] as String,
      type: data['type'] as String,
    );
  }
}

class Dogs{
  final String message;
  final String status;

  Dogs({
    required this.message,
    required this.status,
  });

  factory Dogs.fromJson(Map<String, dynamic> data) {
    return Dogs(
      message: data['message'] as String,
      status: data['status'] as String,
      
    );
  }
}