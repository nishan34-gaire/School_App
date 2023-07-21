import 'dart:convert';

class Notice {
  Notice({
    this.title,
    this.body,
  });

  List<String>? title;
  List<String>? body;
}

Notice noticeuser = Notice(title: ['Maths'], body: ['Complete Cw']);
