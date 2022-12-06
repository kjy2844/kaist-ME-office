import 'package:flutter/material.dart';
import 'package:me_office/modules/common/constants.dart';
import 'language.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CommonAppBar({Key? key}) : super(key: key);

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

class _CommonAppBarState extends State<CommonAppBar> {
  bool isDisabled(LanguageType lang) {
    return Language.getCurLang() == lang;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: Text('home page'),
      title: Image(
        image: AssetImage('images/ME_logo_Kor.png'),
        height: 50.0,
      ),
      // leadingWidth: 200.0,
      actions: [
        ElevatedButton(
          child: Text(
            'KOR',
            style: TextStyle(fontSize: 40),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: kaistBlue,
            disabledForegroundColor: Colors.grey,
            disabledBackgroundColor: Colors.white,
            elevation: 0.0,
            shadowColor: Colors.transparent,
          ),
          onPressed: isDisabled(LanguageType.Kor)
              ? null
              : () {
                  setState(() {
                    Language.setCurLang(LanguageType.Kor);
                  });
                  Navigator.pushNamed(context, '/');
                },
        ),
        ElevatedButton(
          child: Text(
            'ENG',
            style: TextStyle(fontSize: 40),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: kaistBlue,
            disabledForegroundColor: Colors.grey,
            disabledBackgroundColor: Colors.white,
            elevation: 0.0,
            shadowColor: Colors.transparent,
          ),
          onPressed: isDisabled(LanguageType.Eng)
              ? null
              : () {
                  setState(() {
                    Language.setCurLang(LanguageType.Eng);
                  });
                  Navigator.pushNamed(context, '/');
                },
        ),
      ],
    );
  }
}
