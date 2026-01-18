import 'package:flutter/material.dart';

class MovieService {
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  Future<void> refreshData() async {
    if (isLoading.value) return;
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
  }
}

// Global instance
final MovieService movieService = MovieService();