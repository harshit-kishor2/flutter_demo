import 'package:flutter/material.dart';
import 'package:person_plan/features/dashboard/presentation/widgets/all_forms/all_forms.dart';

enum FormSectionEnum {
  agreeToContractTerms,
  personalInfo,
  bioInfo,
  diagnosis,
  strengths,
  challenges,
  likes,
  dislikes,
  independence,
  needsHelp,
  activities,
  dislikeActivities,
  primarySupportTeam,
  secondarySupportTeam,
  dreams;

  // Method to convert enum name to display string
  // TODO: Add localization support
  String get displayTitle {
    switch (this) {
      case FormSectionEnum.agreeToContractTerms:
        return 'Agree to Contract Terms';
      case FormSectionEnum.personalInfo:
        return 'Personal Info';
      case FormSectionEnum.bioInfo:
        return 'Bio Info';
      case FormSectionEnum.diagnosis:
        return 'Diagnosis';
      case FormSectionEnum.strengths:
        return 'Strengths';
      case FormSectionEnum.challenges:
        return 'Challenges';
      case FormSectionEnum.likes:
        return 'Likes';
      case FormSectionEnum.dislikes:
        return 'Dislikes';
      case FormSectionEnum.independence:
        return 'Independence';
      case FormSectionEnum.needsHelp:
        return 'Needs Help';
      case FormSectionEnum.activities:
        return 'Activities';
      case FormSectionEnum.dislikeActivities:
        return 'Dislike Activities';
      case FormSectionEnum.primarySupportTeam:
        return 'Primary Support Team';
      case FormSectionEnum.secondarySupportTeam:
        return 'Secondary Support Team';
      case FormSectionEnum.dreams:
        return 'Dreams';
    }
  }

  Widget getFormSectionPage() {
    switch (this) {
      case FormSectionEnum.agreeToContractTerms:
        return const AgreeTermsForm();
      case FormSectionEnum.personalInfo:
        return const PersonalInfoForm();
      case FormSectionEnum.bioInfo:
        return const BioInfoForm();
      case FormSectionEnum.diagnosis:
        return const DiagnosisForm();
      case FormSectionEnum.strengths:
        return const StrengthsForm();
      case FormSectionEnum.challenges:
        return const ChallengesForm();
      case FormSectionEnum.likes:
        return const LikesForm();
      case FormSectionEnum.dislikes:
        return const DislikesForm();
      case FormSectionEnum.independence:
        return const IndependenceForm();
      case FormSectionEnum.needsHelp:
        return const NeedsHelpForm();
      case FormSectionEnum.activities:
        return const ActivitiesForm();
      case FormSectionEnum.dislikeActivities:
        return const DislikeActivitiesForm();
      case FormSectionEnum.primarySupportTeam:
        return const PrimarySupportTeamForm();
      case FormSectionEnum.secondarySupportTeam:
        return const SecondarySupportTeamForm();
      case FormSectionEnum.dreams:
        return const DreamsForm();
    }
  }
}
