// lib/models/anime_model.dart

class Anime {
  final int malId;
  final String title;
  final String? imageUrl;
  final double? score;
  final int? episodes;
  final String? synopsis;

  Anime({
    required this.malId,
    required this.title,
    this.imageUrl,
    this.score,
    this.episodes,
    this.synopsis,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      malId: json['mal_id'] ?? 0,
      title: json['title'] ?? 'Unknown',
      imageUrl: json['images']?['jpg']?['large_image_url'] ??
          json['images']?['jpg']?['image_url'],
      score: json['score']?.toDouble(),
      episodes: json['episodes'],
      synopsis: json['synopsis'],
    );
  }
}