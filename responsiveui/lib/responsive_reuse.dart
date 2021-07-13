import 'package:flutter/cupertino.dart';

class ResposiveReuse extends StatelessWidget
{
  Widget ?mobile;
  Widget ?web;
  ResposiveReuse({this.mobile,this.web});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.maxWidth>=500)
        {
          return web!;
        }
      else{
        return mobile!;
      }
    });
  }

}