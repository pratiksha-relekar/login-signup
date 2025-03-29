import 'dart:async';
import '../models/user.dart';

class AuthService {
  // This is a mock auth service. In a real app, you would connect to Firebase, Supabase, or your own backend
  
  Future<User> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Simple validation
    if (email.isEmpty || !email.contains('@')) {
      throw Exception('Invalid email format');
    }
    
    if (password.isEmpty || password.length < 6) {
      throw Exception('Password must be at least 6 characters');
    }
    
    // Mock successful login
    if (email == 'user@example.com' && password == 'password') {
      return User(
        id: '1',
        email: email,
        name: 'Demo User',
      );
    }
    
    // Mock authentication failure
    throw Exception('Invalid credentials');
  }
  
  Future<User> signup(String name, String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Simple validation
    if (name.isEmpty) {
      throw Exception('Name cannot be empty');
    }
    
    if (email.isEmpty || !email.contains('@')) {
      throw Exception('Invalid email format');
    }
    
    if (password.isEmpty || password.length < 6) {
      throw Exception('Password must be at least 6 characters');
    }
    
    // Mock successful signup
    return User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      name: name,
    );
  }
  
  Future<void> logout() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // In a real app, clear tokens, cookies, etc.
  }

  // Example of how the auth service should create users
  User createUser({required String name, required String email}) {
    return User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
    );
  }
} 