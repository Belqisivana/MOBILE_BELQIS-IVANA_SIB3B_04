import 'dart:convert';
import 'package:encrypt/encrypt.dart';

class EncryptionService {
  // NOTE: Untuk demo gunakan key tetap. Untuk produksi, simpan key aman (ke secure storage)
  static final _key = Key.fromUtf8('32charslongsecretkeymustbe32bytes!'); // 32 chars
  static final _iv = IV.fromLength(16);

  static String encryptString(String plain) {
    final encrypter = Encrypter(AES(_key));
    final encrypted = encrypter.encrypt(plain, iv: _iv);
    return encrypted.base64;
  }

  static String decryptString(String cipherBase64) {
    try {
      final encrypter = Encrypter(AES(_key));
      final encrypted = Encrypted.fromBase64(cipherBase64);
      final decrypted = encrypter.decrypt(encrypted, iv: _iv);
      return decrypted;
    } catch (e) {
      return '';
    }
  }

  // contoh: enkripsi map/object
  static String encryptMap(Map m) => encryptString(jsonEncode(m));
  static Map? decryptToMap(String cipher) {
    final dec = decryptString(cipher);
    if (dec.isEmpty) return null;
    try {
      return jsonDecode(dec) as Map;
    } catch (e) {
      return null;
    }
  }
}
