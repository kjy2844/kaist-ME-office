import 'language.dart';

class CommonText {
  String kor;
  String Eng;

  CommonText(this.kor, this.Eng);

  String getString() {
    if (Language.getCurLang() == LanguageType.Kor) {
      return this.kor;
    } else if (Language.getCurLang() == LanguageType.Eng) {
      return this.Eng;
    }
    return "";
  }
}

final CommonText find_a_contact_by_task =
    CommonText("업무별 담당자 찾기", "Find a Contact by Task");
final CommonText find_a_contact_by_submission_document =
    CommonText("제출서류별 담당자 찾기", "Find a Contact by Submission Document");
