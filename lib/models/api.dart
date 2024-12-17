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