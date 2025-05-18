import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_database_prractice1/db_service.dart';
import 'package:sqflite_database_prractice1/student_model.dart';

class DbCrud {
  // getting dataBase Path
  Future<Database> get database async {
    var dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, DbService.dbName),
      onCreate: (db, version) => db.execute(StudentModel.createTableCommand),
    );
  }

  // insert function

  Future<bool> insertStudent(StudentModel student) async {
    var db = await database;
    int rowID = await db.insert(StudentModel.tableName, student.toMap());
    return rowID > 0;
  }

  // update function
  Future<bool> updateStudent(StudentModel student) async {
    var db = await database;
    int rowID = await db.update(
      StudentModel.tableName,
      student.toMap(),
      where: '${StudentModel.columnRollNo} = ?',
      whereArgs: [student.rollNo],
    );
    return rowID > 0;
  }
}
