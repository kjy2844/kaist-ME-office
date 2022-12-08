import 'package:flutter/material.dart';
import 'package:me_office/modules/common/constants.dart';
import 'language.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CommonAppBar({Key? key}) : super(key: key);

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(40.0);
}

class _CommonAppBarState extends State<CommonAppBar> {
  bool isDisabled(LanguageType lang) {
    return Language.getCurLang() == lang;
  }

  @override
  Widget build(BuildContext context) {
    LanguageType curLangType = (Language.curLang == LanguageType.Kor)
        ? LanguageType.Eng
        : LanguageType.Kor;

    return AppBar(
      title: InkWell(
        onTap: () =>
            {Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false)},
        child: Image(
          image: AssetImage('assets/images/ME_logo_Kor.png'),
          height: 35.0,
        ),
      ),
      // leadingWidth: 200.0,
      actions: [
        ElevatedButton(
          child: Text(
            curLangType.name,
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: kaistBlue,
            disabledForegroundColor: Colors.grey,
            disabledBackgroundColor: Colors.white,
            elevation: 0.0,
            shadowColor: Colors.transparent,
          ),
          onPressed: () {
            setState(() {
              Language.setCurLang(curLangType);
            });
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
        ),
        // ElevatedButton(
        //   child: Text(
        //     'ENG',
        //     style: TextStyle(fontSize: 20),
        //   ),
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: Colors.white,
        //     foregroundColor: kaistBlue,
        //     disabledForegroundColor: Colors.grey,
        //     disabledBackgroundColor: Colors.white,
        //     elevation: 0.0,
        //     shadowColor: Colors.transparent,
        //   ),
        //   onPressed: isDisabled(LanguageType.Eng)
        //       ? null
        //       : () {
        //           setState(() {
        //             Language.setCurLang(LanguageType.Eng);
        //           });
        //           Navigator.pushNamedAndRemoveUntil(
        //               context, '/', (route) => false);
        //         },
        // ),
      ],
    );
  }
}
