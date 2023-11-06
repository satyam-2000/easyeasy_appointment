import 'package:easy_appointment/common_components/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_components/widgets/dropdown.dart';
import '../../../../common_components/widgets/input_text_field.dart';
import '../../../../common_components/widgets/snackBars.dart';
import '../../../../utils/constants/color_constants.dart';
import '../../../../utils/services/validators.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_event.dart';
import '../bloc/register_state.dart';
import '../model/register_model.dart';

class RegisterSecondScreen extends StatefulWidget {
  String name;
  String email;
  String phone;
  String password;
  String? photo;
  RegisterSecondScreen({Key? key,required this.name,required this.email,required this.phone,required this.password,this.photo}) : super(key: key);

  @override
  State<RegisterSecondScreen> createState() => _RegisterSecondScreenState();
}

class _RegisterSecondScreenState extends State<RegisterSecondScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  List<DropDownItem> specialities = const [
    DropDownItem(name: "General Physician"),
    DropDownItem(name: "Cardiologist"),
    DropDownItem(name: "Gynecologist"),
    DropDownItem(name: "Dentist"),
    DropDownItem(name: "Dermatologist"),
    DropDownItem(name: "ENT"),
    DropDownItem(name: "Gaestrologist"),
    DropDownItem(name: "Urologist"),
  ];
  DropDownItem selectedSpeciality = const DropDownItem(name: "Select");
  TextEditingController qualificationController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Easy Appointment"),
        backgroundColor: AppColors.doctorThemeColor,
      ),
      body: BlocListener<DoctorRegisterBloc, DoctorRegisterState>(
        listener:(context, state) {
          if (state is DoctorRegisterErrorState) {
            SnackBars.error(error: state.error, context: context);
          }
          if (state is DoctorRegisterSuccessState) {
            SnackBars.success(
                message: "Successfully Registered", context: context);
            Navigator.pop(context);
          }
        } ,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: formGlobalKey,
                child: Column(
                  children: [
                    InputTextField(
                        controller: qualificationController,
                        label: "Qualification",
                        validator: (name) => Validators.nameValidator(name),
                        themeColor: AppColors.doctorThemeColor),
                    const SizedBox(height: 20),
                    DropDownWidget(
                      title: "Speciality",
                      options: specialities,
                      onChanged: (value) {
                        setState(() {
                          selectedSpeciality = value;
                        });
                      },
                      selectedItem: selectedSpeciality,
                    ),
                    const SizedBox(height: 20),
                    InputTextField(
                        controller: experienceController,
                        label: "Experience",
                        textInputType: TextInputType.number,
                        validator: (name) => Validators.nameValidator(name),
                        themeColor: AppColors.doctorThemeColor),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
                  builder: (context, state) {
                    if (state is DoctorRegisterLoadingState) {
                      return Center(
                          child: CircularProgressIndicator(
                              color: AppColors.doctorThemeColor));
                    }
                    return InkWell(
                    onTap: (){
                      if (formGlobalKey.currentState!.validate()) {
                        if (selectedSpeciality.name != "Select") {
                          DoctorRegisterModel doctorRegisterRequest =
                          DoctorRegisterModel(
                              name: widget.name,
                              phone: widget.phone,
                              password: widget.password,
                              email: widget.email,
                              qualification: qualificationController.text,
                              speciality: selectedSpeciality.name,
                              experience: experienceController.text,
                              photo: widget.photo
                          );
                          BlocProvider.of<DoctorRegisterBloc>(context)
                              .add(DoctorRegisterSubmittedEvent(
                              doctorRegisterModel:
                              doctorRegisterRequest));
                        } else {
                          SnackBars.error(
                              error: "Speciality is required",
                              context: context);
                        }
                      }
                    },
                    child: CustomButton(text: "REGISTER", color: AppColors.doctorThemeColor));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
