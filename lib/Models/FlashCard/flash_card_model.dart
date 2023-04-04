// To parse this JSON data, do
//
//     final flashCardsContent = flashCardsContentFromJson(jsonString);
import 'dart:convert';

FlashCardItem flashCardsContentFromJson(String str) => FlashCardItem.fromJson(json.decode(str));

String flashCardsContentToJson(FlashCardItem data) => json.encode(data.toJson());

class FlashCardItem {
  FlashCardItem({
    required this.type,
    required this.data,
  });

  String type;
  List<FlashCardModel> data;

  factory FlashCardItem.fromJson(Map<String, dynamic> json) => FlashCardItem(
    type: json["type"],
    data: List<FlashCardModel>.from(json["data"].map((x) => FlashCardModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class FlashCardModel {
  FlashCardModel({
    required this.id,
    required this.group,
    required this.questionTitle,
    required this.question,
    required this.answerTitle,
    required this.answer,
  });

  int id;
  String group;
  String questionTitle;
  String question;
  String answerTitle;
  String answer;

  factory FlashCardModel.fromJson(Map<String, dynamic> json) => FlashCardModel(
    id: json["id"],
    group: json["group"],
    questionTitle: json["questionTitle"],
    question: json["question"],
    answerTitle: json["answerTitle"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "group": group,
    "questionTitle": questionTitle,
    "question": question,
    "answerTitle": answerTitle,
    "answer": answer,
  };
}
