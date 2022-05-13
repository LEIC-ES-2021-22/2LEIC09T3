/// Manages a VirtualCard.
///
/// The information stored is:
/// - The `id` and `private key` of the virtual card
class VirtualCard {
  int cardId;
  String privateKey;

  VirtualCard(int this.cardId, String this.privateKey) {}

  /// Converts this UniNotification to a map.
  Map<String, dynamic> toMap() {
    return {'cardId': cardId, 'privateKey': privateKey};
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VirtualCard &&
          runtimeType == other.runtimeType &&
          cardId == other.cardId &&
          privateKey == other.privateKey;

  @override
  int get hashCode => cardId.hashCode ^ privateKey.hashCode;
}
