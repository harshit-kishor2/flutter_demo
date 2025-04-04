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
        return AgreeTermsForm();
      case FormSectionEnum.personalInfo:
        return PersonalInfoForm();
      case FormSectionEnum.bioInfo:
        return BioInfoForm();
      case FormSectionEnum.diagnosis:
        return DiagnosisForm();
      case FormSectionEnum.strengths:
        return StrengthsForm();
      case FormSectionEnum.challenges:
        return ChallengesForm();
      case FormSectionEnum.likes:
        return LikesForm();
      case FormSectionEnum.dislikes:
        return DislikesForm();
      case FormSectionEnum.independence:
        return IndependenceForm();
      case FormSectionEnum.needsHelp:
        return NeedsHelpForm();
      case FormSectionEnum.activities:
        return ActivitiesForm();
      case FormSectionEnum.dislikeActivities:
        return DislikeActivitiesForm();
      case FormSectionEnum.primarySupportTeam:
        return PrimarySupportTeamForm();
      case FormSectionEnum.secondarySupportTeam:
        return SecondarySupportTeamForm();
      case FormSectionEnum.dreams:
        return DreamsForm();
    }
  }
}
