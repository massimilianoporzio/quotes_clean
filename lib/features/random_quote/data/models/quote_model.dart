import 'package:quotes_clean/features/random_quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  final List<String>? tags;
  final String? authorSlug;
  final int? length;
  final DateTime? dateAdded;
  final DateTime? dateModified;
  const QuoteModel({
    this.tags,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified,
    required super.id,
    required super.author,
    required super.content,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json["_id"] ?? "",
        content: json["content"] ?? "",
        author: json["author"] ?? "",
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        authorSlug: json["authorSlug"] ?? "",
        length: json["length"] ?? -1,
        dateAdded: json["dateAdded"] == null
            ? null
            : DateTime.parse(json["dateAdded"]),
        dateModified: json["dateModified"] == null
            ? null
            : DateTime.parse(json["dateModified"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "author": author,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "authorSlug": authorSlug,
        "length": length,
        "dateAdded":
            "${dateAdded!.year.toString().padLeft(4, '0')}-${dateAdded!.month.toString().padLeft(2, '0')}-${dateAdded!.day.toString().padLeft(2, '0')}",
        "dateModified":
            "${dateModified!.year.toString().padLeft(4, '0')}-${dateModified!.month.toString().padLeft(2, '0')}-${dateModified!.day.toString().padLeft(2, '0')}",
      };
}
