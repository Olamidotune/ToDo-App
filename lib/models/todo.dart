class ToDo {
  String? title;
  String? id;
  String? subTitle;
  bool isDone = false;

  ToDo({
    required this.isDone,
    required this.id,
    required this.subTitle,
    required this.title,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(isDone: true, subTitle: 'Sub1', id: '1', title: 'Title'),
      ToDo(isDone: true, id: '2', subTitle: 'subTitle2', title: 'title2'),
      ToDo(isDone: false, id: '3', subTitle: 'subTitle3', title: 'title4'),
      ToDo(isDone: false, id: '4', subTitle: 'subTitle3', title: 'title5'),
      ToDo(isDone: false, id: '5', subTitle: 'subTitle3', title: 'title6'),
      ToDo(isDone: false, id: '6', subTitle: 'subTitle3', title: 'title7'),
      ToDo(isDone: false, id: '7', subTitle: 'subTitle3', title: 'title8'),
      ToDo(isDone: false, id: '8', subTitle: 'subTitle3', title: 'title9'),
      ToDo(isDone: false, id: '9', subTitle: 'subTitle3', title: 'title0'),
    ];
  }
}
