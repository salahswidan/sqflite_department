abstract class Crud {
  // create , read , update , delete
  Future<bool> insert();
  Future<bool> update();
  Future<bool> delete();
  Future<bool> select();
}
