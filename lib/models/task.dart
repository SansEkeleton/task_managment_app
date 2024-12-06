

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable{
  final String title;
  final String description;
  final String id;
  final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;

  Task({
  required this.title,
  required this.description,
  required this.id,
  required this.date,
  this.isDone,
  this.isDeleted,
  this.isFavorite,
})
{
  isDone = isDone ?? false;
  isDeleted = isDeleted ?? false;
  isFavorite = isFavorite ?? false;
}



  Task copyWith({
    String? title,
    String? description,
    String? id,
    String? date,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorite,
  }) {
    return Task(
      title: title ?? this.title,
      date: date ?? this.date,
      description: description ?? this.description,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'id': id,
      'date': date,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
      date: map['date'] as String,
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
      isFavorite: map['isFavorite'] 
    );
  }
  
  @override
  List<Object?> get props =>[
    title,
    description,
    id,
    date,
    isDone,
    isDeleted,
    isFavorite
  ];

}


