String ?validateEmail(String ?val)
{
  String ?msg ;
  RegExp regExp=new RegExp(
    r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)'
  );
    if(val!.isEmpty)
      {
        msg = 'your email is required';
      }
    else if (!regExp.hasMatch(val))
      {
        msg = 'provide a valid mail';
      }

    return msg;
}