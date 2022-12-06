import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

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
          child: Text('KOR'),
          onPressed: () {},
        ),
        ElevatedButton(
          child: Text('ENG'),
          onPressed: () {},
        ),
      ],
    );
  }
}
