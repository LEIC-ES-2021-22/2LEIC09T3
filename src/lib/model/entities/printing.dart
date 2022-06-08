class Printing {
  final int id;
  final String name;
  final String pageSize;
  final bool color;
  final int numCopies;
  final double price;

  Printing(
    int this.id,
    String this.name,
    String this.pageSize,
    bool this.color,
    int this.numCopies,
    double this.price
  );

  static Printing fromJson(dynamic data) {
    return Printing(
      data['id'],
      data['name'],
      data['size'],
      data['color'],
      data['copies'],
      data['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'size': pageSize,
      'color': color,
      'numCopies': numCopies,
      'price': price
    };
  }
}