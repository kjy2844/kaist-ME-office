enum LanguageType {
  Kor,
  Eng,
}

class Language {
  static LanguageType curLang = LanguageType.Kor;

  static LanguageType getCurLang() {
    return curLang;
  }

  static void setCurLang(LanguageType lang) {
    curLang = lang;
  }
}
