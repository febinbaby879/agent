import 'package:agent_dashboard/application/presentation/screens/institutions/widgets/institution_card.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class InstitutionList extends StatelessWidget {
  const InstitutionList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<School> schoolsList = [
      School(
          id: '1',
          name: 'eie European Business School',
          location: 'St. Julian\'s Malta',
          logoText: 'e',
          rating: 5.0,
          isTopTen: true,
          isExclusive: true),
      School(
          id: '2',
          name: 'Malta Business Institute',
          location: 'Valletta, Malta',
          logoText: 'M',
          rating: 4.5,
          isTopTen: true,
          isExclusive: false),
      School(
          id: '3',
          name: 'International College of Arts',
          location: 'Sliema, Malta',
          logoText: 'I',
          rating: 4.8,
          isTopTen: false,
          isExclusive: true)
    ];
    return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              kHeight10,
              const CustomTextField(hintText: 'Search Institution'),
              kHeight10,
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: schoolsList.length,
                  itemBuilder: (context, index) =>
                      InstitutionCard(school: schoolsList[index]))
            ])));
  }
}

class School {
  final String id;
  final String name;
  final String location;
  final String logoText;
  final double rating;
  final bool isTopTen;
  final bool isExclusive;
  final bool isFavorite;

  School(
      {required this.id,
      required this.name,
      required this.location,
      required this.logoText,
      required this.rating,
      required this.isTopTen,
      required this.isExclusive,
      this.isFavorite = false});
}
