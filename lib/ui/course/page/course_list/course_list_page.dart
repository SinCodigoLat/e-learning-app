import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/base/shared_view/foundation_state.dart';
import 'package:e_learning_app/ui/course/page/course_list/bloc/course_list_bloc.dart';

@RoutePage()
class CourseListPage extends StatefulWidget {
  const CourseListPage({super.key});

  @override
  State<CourseListPage> createState() => _CourseListPageState();
}

class _CourseListPageState extends FoundationState<CourseListPage, CourseListBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return const Placeholder();
  }
}

