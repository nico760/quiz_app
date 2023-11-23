class Score {
  int? ntry;
  final int nscore;

  Score({
    this.ntry,
    required this.nscore,
  });

  Map<String, dynamic> toMap() { 
    return {
      'ntry': ntry,
      'nscore': nscore,
    };
  }

  factory 
  Score.fromMap(Map<String, dynamic> map) {
    return Score(
      ntry: map['ntry'],
      nscore: map['nscore'],
    );
  }
}
