import 'package:flutter/material.dart';

import '../../generated/assets.gen.dart';
import '../extensions/context.dart';
import '../models/work_model.dart';

class ExperienceStorage {
  const ExperienceStorage(this.context);

  final BuildContext context;

  List<WorkModel> get data {
    return [
      WorkModel(
        name: 'Next League',
        position: 'Flutter developer',
        location: context.strings.workPlaceNewYork,
        type: context.strings.workTypeContract,
        locationType: context.strings.workLocationRemote,
        startDate: DateTime.parse('2023-06-01'),
        endDate: DateTime.parse('2024-02-01'),
        description: context.strings.workNextLeagueDescription,
        logo: Assets.logos.nextLeague,
        links: [
          Uri.parse('https://nextleague.com/'),
          Uri.parse(
            'https://tglgolf.com/',
          )
        ],
      ),
      WorkModel(
        name: 'MediaCasa',
        position: 'Flutter developer',
        location: context.strings.workPlaceUSA,
        type: context.strings.workTypePartTime,
        locationType: context.strings.workLocationRemote,
        startDate: DateTime.parse('2022-11-01'),
        description: context.strings.workMediaCasaDescription,
        logo: Assets.logos.mediaCasa,
        links: [
          Uri.parse('https://mediacasa.ai/'),
        ],
      ),
      WorkModel(
        name: 'Pivbank',
        position: 'Flutter developer',
        location: context.strings.workPlaceMykolaiv,
        startDate: DateTime.parse('2022-04-01'),
        endDate: DateTime.parse('2022-11-30'),
        type: context.strings.workTypeFreelance,
        description: context.strings.workPivbankDescription,
        logo: Assets.logos.pivbank,
        links: [
          Uri.parse('https://pivbank.mk.ua/'),
        ],
      ),
      WorkModel(
        name: 'Infront',
        position: 'FE Technical Lead',
        location: context.strings.workPlaceNewYork,
        startDate: DateTime.parse('2019-05-01'),
        endDate: DateTime.parse('2021-06-01'),
        type: context.strings.workTypeFullTime,
        locationType: context.strings.workLocationRemote,
        description: context.strings.workInfrontDescription,
        logo: Assets.logos.infront,
        links: [
          Uri.parse('https://www.infront.sport/'),
          Uri.parse('https://www.pgatour.com/'),
        ],
      ),
      WorkModel(
        name: 'Omnigon',
        position: 'Senior FE Developer',
        location: context.strings.workPlaceKyiv,
        startDate: DateTime.parse('2011-06-01'),
        endDate: DateTime.parse('2019-06-01'),
        type: context.strings.workTypeFullTime,
        locationType: context.strings.workLocationOnSite,
        description: context.strings.workOmnigonDescription,
        logo: Assets.logos.omnigon,
        links: [
          Uri.parse(
              'https://www.linkedin.com/company/omnigon-communications-llc/'),
        ],
      ),
      WorkModel(
        name: 'Terrasoft',
        position: 'Software Developer',
        location: context.strings.workPlaceKyiv,
        startDate: DateTime.parse('2006-10-01'),
        endDate: DateTime.parse('2011-06-01'),
        type: context.strings.workTypeFullTime,
        locationType: context.strings.workLocationOnSite,
        description: context.strings.workTerrasoftDescription,
        links: [
          Uri.parse('https://www.creatio.com/'),
        ],
      ),
      WorkModel(
        name: context.strings.workTreasure,
        position: context.strings.workPositionLanAdministrator,
        location: context.strings.workPlaceMykolaiv,
        startDate: DateTime.parse('2005-01-01'),
        endDate: DateTime.parse('2006-01-01'),
        type: context.strings.workTypeFullTime,
        locationType: context.strings.workLocationOnSite,
        description: context.strings.workTreasureDescription,
      ),
      WorkModel(
        name: context.strings.workRichelieu,
        position: context.strings.workPositionInteriorDesigner,
        location: context.strings.workPlaceMykolaiv,
        startDate: DateTime.parse('2005-01-01'),
        endDate: DateTime.parse('2005-06-01'),
        type: context.strings.workTypeFreelance,
        locationType: context.strings.workLocationOnSite,
        description: context.strings.workRichelieuDescription,
      ),
      WorkModel(
        name: context.strings.workUniverity,
        position: context.strings.workUniversityPosition,
        location: context.strings.workPlaceMykolaiv,
        startDate: DateTime.parse('2002-09-01'),
        endDate: DateTime.parse('2006-06-01'),
        type: context.strings.workTypeEducation,
        description: context.strings.workUniversityDescription,
        logo: Assets.logos.udmtu,
      ),
      WorkModel(
        name: context.strings.workCollege,
        position: context.strings.workCollagePosition,
        location: context.strings.workPlaceMykolaiv,
        startDate: DateTime.parse('1998-09-01'),
        endDate: DateTime.parse('2002-06-01'),
        type: context.strings.workTypeEducation,
        description: context.strings.workCollegeDescription,
        logo: Assets.logos.mpk,
      ),
    ];
  }
}
