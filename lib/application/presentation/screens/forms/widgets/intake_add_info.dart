import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/file_pick_container.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/widgets/date_pick_container.dart';
import 'package:agent_dashboard/application/presentation/widgets/dropdown_builder.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdditionalInformationSection extends StatelessWidget {
  const AdditionalInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<ApplicationController>();
    final bool isWideScreen = MediaQuery.of(context).size.width > 1000;

    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context) ? 10 : 50),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          kHeight10,
          Text('Additional Information', style: textHeadStyle1),
          kHeight20,

          // 👉 Date + Time
          if (isWideScreen) ...[
            Row(children: [
              Expanded(
                  child: DatePickerField(
                      hintText: 'Date of Arrival',
                      startYear: 0,
                      endYear: 10,
                      controller: formController.arrivalDateController)),
              kWidth50,
              Expanded(
                  child: CustomTextField(
                      validate: Validate.notNull,
                      inputType: TextInputType.datetime,
                      controller: formController.arrivalTimeController,
                      hintText: 'Time of Arrival',
                      onTapOutside: () => FocusScope.of(context).unfocus()))
            ]),
            kHeight40,
            Text(
                'Do you require accommodation assistance and Airport Pickup? *',
                style: textHeadStyle1),
            kHeight10,
            Row(children: [
              Obx(() => Expanded(
                    child: CustomDropDownBuilder(
                        items: const ['Yes', 'No'],
                        hintText: 'Accommodation assistance',
                        onChanged: (course) => formController
                            .changeAccommodationAssistance(course ?? ''),
                        selectedvalue: formController
                            .selectedAccommodationAssistance.value),
                  )),
              kWidth50,
              Expanded(
                  child: Obx(() => CustomDropDownBuilder(
                      items: const ['Yes', 'No'],
                      hintText: 'Airport Pickup',
                      onChanged: (course) => formController
                          .changeAirportPickupRequired(course ?? ''),
                      selectedvalue:
                          formController.airportPickupRequired.value)))
            ])
          ] else ...[
            DatePickerField(
              hintText: 'Date of Arrival',
              startYear: 0,
              endYear: 10,
              controller: formController.arrivalDateController,
            ),
            kHeight10,
            CustomTextField(
              validate: Validate.notNull,
              inputType: TextInputType.datetime,
              controller: formController.arrivalTimeController,
              hintText: 'Time of Arrival',
              onTapOutside: () => FocusScope.of(context).unfocus(),
            ),
            kHeight10,
            Text('Do you require accommodation assistance? *',
                style: textHeadStyle1),
            kHeight10,
            Obx(() => CustomDropDownBuilder(
                items: const ['Yes', 'No'],
                hintText: 'Accommodation assistance',
                onChanged: (course) =>
                    formController.changeAccommodationAssistance(course ?? ''),
                selectedvalue:
                    formController.selectedAccommodationAssistance.value)),
            kHeight10,
            Text('Do you require Airport Pickup? *', style: textHeadStyle1),
            kHeight10,
            Obx(() => CustomDropDownBuilder(
                items: const ['Yes', 'No'],
                hintText: 'Airport Pickup',
                onChanged: (course) =>
                    formController.changeAirportPickupRequired(course ?? ''),
                selectedvalue: formController.airportPickupRequired.value))
          ],
          kHeight20,
          Text(
              'Note: Provided accommodation will be a very basic sharing based accommodation (Bed space) with 8-10 people in one room. If you require a private room or standard accommodation, the rent will be high.',
              style: textThinStyle1),
          kHeight10,
          Text(
              'Note: Airport Pickup is available between 8 am to 9pm, if your time of arrival is before 8am or after 9pm, you may need to wait inside the airport or arrange transportation by yourself and accommodation assistance cannot be provided during night time as people will be sleeping during Night.',
              style: textThinStyle1)
        ]));
  }
}
