import 'package:flutter/material.dart';
import '../resources/dimens.dart';

class PopButtonView extends StatelessWidget {
  const PopButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
      Navigator.pop(context);
    },
     icon: Icon(Icons.chevron_left,size: MARGIN_MEDIUM_5X,),
     );
  }
}