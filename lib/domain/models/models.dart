class ListTabItem {
  String title;
  String image;
  bool isActive;

  ListTabItem({
    required this.image,
    required this.isActive,
    required this.title,
  });
}

class QnAModel {
  String studentName;
  String studentProfilePic;
  String question;
  String details;
  List<QnAModel> replies;
  String date;
  QnAModel({
    required this.details,
    required this.question,
    required this.date,
    required this.replies,
    required this.studentName,
    required this.studentProfilePic,
  });
}
