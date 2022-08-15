abstract class SecureStorageRepository {
  const SecureStorageRepository();

  /// Returns the JWT token from secure storage.
  Future<String?> get jwtToken;

  /// Save a JWT [token] inside secure storage (encrypted).
  Future<void> saveJWTToken(String? token);
}
