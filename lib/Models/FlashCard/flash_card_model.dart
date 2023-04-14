class FlashCardsDataModel {
  FlashCardsDataModel({
    required this.id,
    required this.group,
    required this.questionTitle,
    required this.question,
    required this.answerTitle,
    required this.answer,
  });

  final int id;
  final String group;
  final String questionTitle;
  final String question;
  final String answerTitle;
  final String answer;

  factory FlashCardsDataModel.fromJson(Map<String, dynamic> json) =>
      FlashCardsDataModel(
          id: json['id'],
          group: json['group'],
          questionTitle: json['questionTitle'],
          question: json['question'],
          answerTitle: json['answerTitle'],
          answer: json['answer']);

  Map<String, dynamic> toJson() => {
        "id": id,
        'group': group,
        'questionTitle': questionTitle,
        'question': question,
        'answerTitle': answerTitle,
        'answer': answer,
      };

  static List<FlashCardsDataModel> listFromJson(List data) {
    return data
        .map((e) => FlashCardsDataModel.fromJson(e))
        .whereType<FlashCardsDataModel>()
        .toList();
  }
}
