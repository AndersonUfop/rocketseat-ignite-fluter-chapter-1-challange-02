import 'package:flutter/material.dart';
import 'package:notes/themes/app_theme.dart';

class ButtonLoginWidget extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  const ButtonLoginWidget(
      {Key? key,
      required this.imagePath,
      required this.label,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
              padding: EdgeInsets.all(0.0),
              height: 60,
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(imagePath, width: 36),
                          ),
                        ],
                      )),
                  Expanded(
                      child: Text(label,
                          textAlign: TextAlign.center,
                          style: AppTheme.textStyles.textButton))
                ],
              )),
        ),
      ),
    );
  }
}
