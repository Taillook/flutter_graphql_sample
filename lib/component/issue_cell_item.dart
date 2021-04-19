import 'package:flutter/material.dart';

import 'package:flutter_graphql_sample/entity/issue.dart';

class IssueCellItem extends StatelessWidget {
  IssueCellItem({
    required this.issue,
    required this.onClick,
  });

  final Issue issue;
  final ValueChanged onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => onClick(
          issue,
        ),
        child: SizedBox(
          height: 75,
          child: Center(child:
                    Text(
                      issue.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
        ),
      ),
    );
  }
}
