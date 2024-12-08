import 'package:chat_task/domain/constants/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/models/models.dart';
part 'provider.g.dart';

List<ListTabItem> items = [
  ListTabItem(image: AssetPaths.courseScreenAssets.chat, isActive: true, title: 'Chats'),
  ListTabItem(image: AssetPaths.courseScreenAssets.doubt, isActive: false, title: 'Doubts'),
  ListTabItem(image: AssetPaths.courseScreenAssets.notes, isActive: false, title: 'Notes'),
  ListTabItem(image: AssetPaths.courseScreenAssets.rewards, isActive: false, title: 'Rewards'),
  ListTabItem(image: AssetPaths.courseScreenAssets.share, isActive: false, title: 'Share'),
];

@riverpod
List<ListTabItem> fetchItems(ref) {
  return items;
}

@riverpod
class ItemsNotifier extends _$ItemsNotifier {
  @override
  List<ListTabItem> build() {
    return items;
  }

  void updateSeletedTab(ListTabItem item) {
    List<ListTabItem> elements = [];
    for (var element in state) {
      if (element.title == item.title) {
        element.isActive = true;
      } else {
        element.isActive = false;
      }
      elements.add(element);
    }
    state = elements;
  }
}

int selectedItemTabIndex = 0;

@riverpod
class SeletedTabIndexNotifier extends _$SeletedTabIndexNotifier {
  @override
  int build() {
    return selectedItemTabIndex;
  }

  void setIndex(int index) {
    state = index;
  }
}

List<QnAModel> dummyData = [
  QnAModel(
    studentName: "Alice Johnson",
    studentProfilePic: "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg",
    question: "How to fix null pointer exceptions in Flutter?",
    details: "I'm getting null pointer errors while accessing certain variables in my app. What are some best practices to avoid this?",
    date: "2024-12-07",
    replies: [
      QnAModel(
        studentName: "Bob Smith",
        studentProfilePic: "https://images.pexels.com/photos/2128807/pexels-photo-2128807.jpeg",
        question: "Reply to: How to fix null pointer exceptions in Flutter?",
        details: "You can use null safety features in Dart. Ensure variables are initialized properly and use the `?` operator to check for nulls.",
        date: "2024-12-07",
        replies: [],
      ),
      QnAModel(
        studentName: "Cathy Lee",
        studentProfilePic: "https://images.pexels.com/photos/2104252/pexels-photo-2104252.jpeg",
        question: "Reply to: How to fix null pointer exceptions in Flutter?",
        details: "Use late variables carefully and avoid unnecessary nullable types. Always initialize required variables in constructors.",
        date: "2024-12-07",
        replies: [],
      ),
    ],
  ),
  QnAModel(
    studentName: "David Kim",
    studentProfilePic: "https://images.pexels.com/photos/2104252/pexels-photo-2104252.jpeg",
    question: "What is the difference between StatefulWidget and StatelessWidget?",
    details: "Can someone explain the key differences between StatefulWidget and StatelessWidget with examples?",
    date: "2024-12-06",
    replies: [
      QnAModel(
        studentName: "Emily Parker",
        studentProfilePic: "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg",
        question: "Reply to: What is the difference between StatefulWidget and StatelessWidget?",
        details: "StatelessWidget is immutable; it doesn't change its state. StatefulWidget can rebuild its UI when state changes.",
        date: "2024-12-06",
        replies: [],
      ),
    ],
  ),
  QnAModel(
    studentName: "Emily Parker",
    studentProfilePic: "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg",
    question: "How to fix null pointer exceptions in Flutter?",
    details: "I'm getting null pointer errors while accessing certain variables in my app. What are some best practices to avoid this?",
    date: "2024-12-07",
    replies: [
      QnAModel(
        studentName: "Bob Smith",
        studentProfilePic: "https://images.pexels.com/photos/2128807/pexels-photo-2128807.jpeg",
        question: "Reply to: How to fix null pointer exceptions in Flutter?",
        details: "You can use null safety features in Dart. Ensure variables are initialized properly and use the `?` operator to check for nulls.",
        date: "2024-12-07",
        replies: [],
      ),
      QnAModel(
        studentName: "Cathy Lee",
        studentProfilePic: "https://images.pexels.com/photos/2104252/pexels-photo-2104252.jpeg",
        question: "Reply to: How to fix null pointer exceptions in Flutter?",
        details: "Use late variables carefully and avoid unnecessary nullable types. Always initialize required variables in constructors.",
        date: "2024-12-07",
        replies: [],
      ),
    ],
  ),
  QnAModel(
    studentName: "Bob Smith",
    studentProfilePic: "https://images.pexels.com/photos/2104252/pexels-photo-2104252.jpeg",
    question: "What is the difference between StatefulWidget and StatelessWidget?",
    details: "Can someone explain the key differences between StatefulWidget and StatelessWidget with examples?",
    date: "2024-12-06",
    replies: [
      QnAModel(
        studentName: "Emily Parker",
        studentProfilePic: "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg",
        question: "Reply to: What is the difference between StatefulWidget and StatelessWidget?",
        details: "StatelessWidget is immutable; it doesn't change its state. StatefulWidget can rebuild its UI when state changes.",
        date: "2024-12-06",
        replies: [],
      ),
    ],
  ),
];

@riverpod
List<QnAModel> getQnAdata(ref) {
  return dummyData;
}

@riverpod
class QnaDataNotifier extends _$QnaDataNotifier {
  @override
  List<QnAModel> build() {
    return dummyData;
  }

  void addData(QnAModel data) {
    state.insert(0, data);
  }

  void addReplay({required QnAModel data, required int index}) {
    state[index].replies.insert(0, data);
  }
}

bool isQuestionBody = false;
bool isSubmitActive = false;
bool isExpandedQuestion = false;
int seletedIndex = -1;
TextEditingController questionTextEditingController = TextEditingController();
TextEditingController questionDetailsTextEditingController = TextEditingController();
TextEditingController replayTextEditingController = TextEditingController();

@riverpod
class SubmitQuestionNotifier extends _$SubmitQuestionNotifier {
  @override
  bool build() {
    return isSubmitActive;
  }

  void setTrue() {
    state = true;
  }

  void setFalse() {
    state = false;
  }
}

@riverpod
class SelectedIndexNotifier extends _$SelectedIndexNotifier {
  @override
  int build() {
    return seletedIndex;
  }

  void setActiveIndexas(int index) {
    state = index;
  }
}

@riverpod
class ExpandedQuestionNotifier extends _$ExpandedQuestionNotifier {
  @override
  bool build() {
    return isExpandedQuestion;
  }

  void setTrue() {
    state = true;
  }

  void setFalse() {
    state = false;
  }
}

@riverpod
class QuestionNotifier extends _$QuestionNotifier {
  @override
  bool build() {
    return isQuestionBody;
  }

  void setTrue() {
    state = true;
  }

  void setFalse() {
    state = false;
  }
}
