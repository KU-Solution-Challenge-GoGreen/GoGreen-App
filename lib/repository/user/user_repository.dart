import 'package:dio/dio.dart';
import 'package:gogreen_client/repository/dio/dio.dart';
import 'package:gogreen_client/repository/user/payload/user_payload.dart';

import '../../models/profile.dart';
import '../../models/user_detail.dart';

class UserRepository {
  final Dio _dio = createDio();

  Future<Profile?> findUserByToken() async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/login',
      );

      return Profile.fromJson(response.data!);
    } catch (e) {
      return null;
    }
  }

  Future<Profile?> registerUser(String nickname) async {
    final response = await _dio
        .post<Map<String, dynamic>>('/auth/register', data: {'name': nickname});

    if (response.data == null) {
      return null;
    }

    return Profile.fromJson(response.data!);
  }

  Future<Profile?> updateUser(String userId, UserPayload user) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/users/$userId',
        data: user.toJson(),
      );

      return Profile.fromJson(response.data!);
    } catch (e) {
      return null;
    }
  }

  Future<UserDetail?> getUserDetail(String userId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/users/$userId');

      return UserDetail.fromJson(response.data!);
    } catch (e) {
      return null;
    }
  }
}
