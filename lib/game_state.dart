// 2048 のロジックを実装する
import 'dart:math';

class GameState {
  int rowCount;
  int columnCount;
  int score;
  double appearProbability;
  Random random;

  // 2次元配列
  List<List<int>> table;

  GameState(this.rowCount, this.columnCount)
      : score = 0,
        appearProbability = 0.75,
        table = List.generate(rowCount, (i) => List.filled(columnCount, 0)),
        random = Random() {
    // row, col は2以上じゃないとダメ
    if (rowCount < 2 || columnCount < 2) {
      throw ArgumentError("row and column must be greater than 2");
    }

    // 2つの数字を生成
    makeNumberAppear();
    makeNumberAppear();
  }

  // 新しい数字を湧き上がらせるメソッド
  void makeNumberAppear() {
    // 乱数がappearProbabilityより小さい場合に2を生成
    final number = random.nextDouble() < appearProbability ? 2 : 4;

    // TODO: なんかバグってそう
    // 0~rowCount-1の乱数を生成
    int row;
    do {
      row = random.nextInt(rowCount);
    } while (!table[row].contains(0));

    // 0~columnCount-1の乱数を生成
    int column;
    do {
      column = random.nextInt(columnCount);
    } while (table[row][column] != 0);

    // 生成した乱数をtableに代入
    table[row][column] = number;
  }

  // 指定した行を取得するメソッド
  List<int> getRow(int row) {
    return table[row];
  }

  // 指定した列を取得するメソッド
  List<int> getColumn(int column) {
    return table.map((row) => row[column]).toList();
  }

  // 全体を左右に動かせるかを判定するメソッド
  bool canMoveHorizontally() {
    for (var i = 0; i < rowCount; i++) {
      if (canMoveRowHorizontally(getRow(i))) return true;
    }
    return false;
  }

  // 指定した行を左右に動かせるかを判定するメソッド
  bool canMoveRowHorizontally(List<int> row) {
    // 0が含まれているかどうか
    if (row.contains(0)) return true;

    // 2つの数字が隣り合っているかどうか
    for (var i = 0; i < columnCount - 1; i++) {
      if (row.elementAt(i) == row.elementAt(i + 1)) return true;
    }

    return false;
  }

  // 全体を上下に動かせるかを判定するメソッド
  bool canMoveVertically() {
    for (var i = 0; i < columnCount; i++) {
      if (canMoveRowVertically(getColumn(i))) return true;
    }
    return false;
  }

  // 指定した行を上下に動かせるかを判定するメソッド
  bool canMoveRowVertically(List<int> row) {
    // 0が含まれているかどうか
    if (row.contains(0)) return true;

    // 2つの数字が隣り合っているかどうか
    for (var i = 0; i < rowCount - 1; i++) {
      if (row.elementAt(i) == row.elementAt(i + 1)) return true;
    }

    return false;
  }

  // 全体を左に動かす
  void moveLeft() {
    for (var i = 0; i < rowCount; i++) {
      table[i] = mergeRow(getRow(i));
    }
  }

  // 全体を右に動かす
  void moveRight() {
    for (var i = 0; i < rowCount; i++) {
      table[i] = mergeRow(getRow(i).reversed.toList()).reversed.toList();
    }
  }

  // 全体を上に動かす
  void moveUp() {
    for (var i = 0; i < columnCount; i++) {
      for (var row in table) {
        row[i] = mergeRow(getColumn(i))[i];
      }
    }
  }

  // 全体を下に動かす
  void moveDown() {
    for (var i = 0; i < columnCount; i++) {
      for (var row in table) {
        row[i] = mergeRow(getColumn(i).reversed.toList()).reversed.toList()[i];
      }
    }
  }

  List<int> mergeRow(List<int> row) {
    final numbers = row.where((number) => number != 0).toList();

    // 2つの数字が隣り合っているかどうか
    for (var i = 0; i < numbers.length - 1; i++) {
      if (numbers[i] == numbers[i + 1]) {
        // 隣り合っている場合は、2倍にして、次の要素を削除
        numbers[i] *= 2;
        numbers.removeAt(i + 1);
      }
    }

    // 0を追加
    while (numbers.length < columnCount) {
      numbers.add(0);
    }

    return numbers;
  }

  bool isGameOver() {
    return !canMoveHorizontally() || !canMoveVertically();
  }
}
