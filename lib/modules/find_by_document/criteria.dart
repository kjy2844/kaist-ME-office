import '../common/language.dart';

class Criterion {
  String title;
  String start;
  String end;

  Criterion(this.title, this.start, this.end);
}

class Criteria {
  static List<Criterion> getCriteria() {
    if (Language.getCurLang() == LanguageType.Kor) {
      return CriteriaKor.getCriteria();
    } else if (Language.getCurLang() == LanguageType.Eng) {
      return CriteriaEng.getCriteria();
    }
    return List.empty();
  }

  static bool isClicked(int index) {
    if (Language.getCurLang() == LanguageType.Kor) {
      return CriteriaKor.isClicked(index);
    } else if (Language.getCurLang() == LanguageType.Eng) {
      return CriteriaEng.isClicked(index);
    }
    return false;
  }

  static void click(int index) {
    if (Language.getCurLang() == LanguageType.Kor) {
      return CriteriaKor.click(index);
    } else if (Language.getCurLang() == LanguageType.Eng) {
      return CriteriaEng.click(index);
    }
  }

  static void initialize() {
    if (Language.getCurLang() == LanguageType.Kor) {
      return CriteriaKor.initialize();
    } else if (Language.getCurLang() == LanguageType.Eng) {
      return CriteriaEng.initialize();
    }
  }

  static Criterion getCriterion(int index) {
    if (Language.getCurLang() == LanguageType.Kor) {
      return CriteriaKor.getCriterion(index);
    } else if (Language.getCurLang() == LanguageType.Eng) {
      return CriteriaEng.getCriterion(index);
    }
    return CriteriaKor.getCriterion(index);
  }

  static int getClicked() {
    if (Language.getCurLang() == LanguageType.Kor) {
      return CriteriaKor.clicked;
    } else if (Language.getCurLang() == LanguageType.Eng) {
      return CriteriaEng.clicked;
    }
    return -1;
  }
}

class CriteriaKor {
  // TODO: 영문명 처리
  static List<Criterion> criteria = [
    Criterion("ㄱ~ㄴ", "가", "닣"),
    Criterion("ㄷ~ㄹ", "다", "맇"),
    Criterion("ㅁ~ㅂ", "마", "빟"),
    Criterion("ㅅ~ㅇ", "사", "잏"),
    Criterion("ㅈ~ㅊ", "자", "칳"),
    Criterion("ㅋ~ㅌ", "카", "팋"),
    Criterion("ㅍ~ㅎ", "파", "힣"),
    Criterion("기타", "가", "힣"),
  ];

  static int clicked = -1;

  static List<Criterion> getCriteria() {
    return criteria;
  }

  static Criterion getCriterion(int index) {
    return criteria[index];
  }

  static void click(int index) {
    if (clicked == index) {
      clicked = -1;
    } else {
      clicked = index;
    }
  }

  static bool isClicked(int index) {
    return clicked == index;
  }

  static void initialize() {
    clicked = -1;
  }
}

class CriteriaEng {
  // TODO: 영문명 처리
  static List<Criterion> criteria = [
    Criterion("A~C", "A", "C"),
    Criterion("D~F", "D", "F"),
    Criterion("G~I", "G", "I"),
    Criterion("J~L", "J", "L"),
    Criterion("M~O", "M", "O"),
    Criterion("P~R", "P", "R"),
    Criterion("S~U", "S", "U"),
    Criterion("V~X", "V", "X"),
    Criterion("Y~Z", "Y", "Z"),
  ];

  static int clicked = -1;

  static List<Criterion> getCriteria() {
    return criteria;
  }

  static Criterion getCriterion(int index) {
    return criteria[index];
  }

  static void click(int index) {
    if (clicked == index) {
      clicked = -1;
    } else {
      clicked = index;
    }
  }

  static bool isClicked(int index) {
    return clicked == index;
  }

  static void initialize() {
    clicked = -1;
  }
}
