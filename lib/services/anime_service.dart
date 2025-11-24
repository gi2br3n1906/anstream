// lib/services/anime_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/anime_model.dart';

class AnimeService {
  static const String baseUrl = 'https://api.jikan.moe/v4';

  // Get popular/top anime
  Future<List<Anime>> getTopAnime({int page = 1}) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/top/anime?page=$page&limit=10'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List animeList = data['data'];
        return animeList.map((json) => Anime.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load anime');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Get seasonal anime
  Future<List<Anime>> getSeasonalAnime() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/seasons/now?limit=10'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List animeList = data['data'];
        return animeList.map((json) => Anime.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load seasonal anime');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Search anime
  Future<List<Anime>> searchAnime(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/anime?q=$query&limit=10'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List animeList = data['data'];
        return animeList.map((json) => Anime.fromJson(json)).toList();
      } else {
        throw Exception('Failed to search anime');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}