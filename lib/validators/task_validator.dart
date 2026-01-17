class TaskValidator {
  static String? title(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'タスク名を入力してください';
    }
    return null;
  }

  static String? point(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'ポイントを入力してください';
    }
    return null;
  }
}
