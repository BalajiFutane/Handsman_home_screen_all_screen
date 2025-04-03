

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/Screen/Helpdesk/Comp/common.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/base_scaffold_widget.dart';


class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  File? imageFile;
  String? imageUrl;

  TextEditingController fNameCont = TextEditingController();
  TextEditingController lNameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController userNameCont = TextEditingController();
  TextEditingController mobileCont = TextEditingController();
  TextEditingController addressCont = TextEditingController();

  FocusNode fNameFocus = FocusNode();
  FocusNode lNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode userNameFocus = FocusNode();
  FocusNode mobileFocus = FocusNode();

  bool isEmailVerified = false;
  String countryCode = "+1";

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    // Initialize with dummy data
    fNameCont.text = "John";
    lNameCont.text = "Doe";
    emailCont.text = "john.doe@example.com";
    userNameCont.text = "johndoe";
    mobileCont.text = "1234567890";
    addressCont.text = "123 Main Street, City";
    imageUrl = 'https://randomuser.me/api/portraits/men/1.jpg';
  }

  Future<void> _getFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        imageUrl = null; // Clear the URL when using a local file
      });
    }
  }

  Future<void> _getFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        imageUrl = null; // Clear the URL when using a local file
      });
    }
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.image, color: Colors.blue),
              title: Text("Gallery"),
              onTap: ()  {
               //  _getFromGallery();
               // finish(context);

                _getFromGallery().then((_) {
                  Navigator.pop(context);  // Close the screen after image selection
                });
              },
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.camera_alt, color: Colors.blue),
              title: Text("Camera"),
              onTap: () {
                // _getFromCamera();
                // // finish(context);

                _getFromCamera().then((_) {
                  Navigator.pop(context);  // Close the screen after image selection
                });
              },
            ),
          ],
        );
      },
    );
  }

  void changeCountry() {
    // Simulate country code change
    setState(() {
      countryCode = countryCode == "+1" ? "+91" : "+1";
    });
  }

  Widget _buildProfileImage() {
    if (imageFile != null) {
      return CircleAvatar(
        radius: 42,
        backgroundImage: FileImage(imageFile!),
      );
    } else if (imageUrl != null) {
      return CircleAvatar(
        radius: 42,
        backgroundImage: NetworkImage(imageUrl!),
      );
    } else {
      return CircleAvatar(
        radius: 42,
        backgroundColor: Colors.grey[300],
        child: Icon(Icons.person, size: 42, color: Colors.grey[600]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appnavcolor: primaryColor,
      appBarTitle: "Edit Profile",

      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: boxDecorationDefault(
                      shape: BoxShape.circle,
                      border: Border.all(color: context.cardColor, width: 4),
                    ),
                    child: _buildProfileImage(),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: boxDecorationWithRoundedCorners(
                        boxShape: BoxShape.circle,
                        backgroundColor: Colors.blue,
                        border: Border.all(color: Colors.white),
                      ),
                      child: Icon(Icons.camera_alt, color: Colors.white, size: 12),
                    ).onTap(() => _showBottomSheet(context)),
                  )
                ],
              ),
              16.height,
              AppTextField(
                textFieldType: TextFieldType.NAME,
                controller: fNameCont,
                focus: fNameFocus,
                decoration: inputDecoration(context, labelText: "First Name"),
                suffix: Icon(Icons.person, size: 20).paddingAll(14),
              ),
              16.height,
              AppTextField(
                textFieldType: TextFieldType.NAME,
                controller: lNameCont,
                focus: lNameFocus,
                decoration: inputDecoration(context, labelText: "Last Name"),
                suffix: Icon(Icons.person, size: 20).paddingAll(14),
              ),
              16.height,
              AppTextField(
                textFieldType: TextFieldType.NAME,
                controller: userNameCont,
                focus: userNameFocus,
                enabled: false,
                decoration: inputDecoration(context, labelText: "Username"),
                suffix: Icon(Icons.person, size: 20).paddingAll(14),
              ),
              16.height,
              AppTextField(
                textFieldType: TextFieldType.EMAIL,
                controller: emailCont,
                focus: emailFocus,
                decoration: inputDecoration(context, labelText: "Email"),
                suffix: Icon(Icons.email, size: 20).paddingAll(14),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isEmailVerified ? "Verified" : "Verify Email",
                      style: secondaryTextStyle(
                          color: isEmailVerified ? Colors.green : Colors.grey),
                    ),
                    4.width,
                    Icon(
                      isEmailVerified ? Icons.check_circle : Icons.refresh,
                      color: isEmailVerified ? Colors.green : Colors.grey,
                      size: 16,
                    )
                  ],
                ).onTap(() {
                  setState(() {
                    isEmailVerified = !isEmailVerified;
                  });
                }),
              ).paddingSymmetric(vertical: 4),
              16.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: context.cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(countryCode, style: primaryTextStyle()),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ).paddingSymmetric(horizontal: 8),
                  ).onTap(changeCountry),
                  10.width,
                  Expanded(
                    child: AppTextField(
                      textFieldType: TextFieldType.PHONE,
                      controller: mobileCont,
                      focus: mobileFocus,
                      decoration: inputDecoration(context, hintText: "Phone Number"),
                      suffix: Icon(Icons.phone, size: 20).paddingAll(14),
                    ),
                  ),
                ],
              ),
              16.height,
              AppTextField(
                controller: addressCont,
                textFieldType: TextFieldType.MULTILINE,
                maxLines: 5,
                decoration: inputDecoration(context, labelText: "Address"),
                suffix: Icon(Icons.location_on, size: 20).paddingAll(14),
              ),
              40.height,
              AppButton(
                text: "Save",
                color: Colors.blue,
                textColor: Colors.white,
                width: context.width(),
                onTap: () {
                  // Save logic would go here
                  toast("Profile saved");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
