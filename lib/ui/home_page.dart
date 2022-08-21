import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo/components/buttons.dart';
import 'package:todo/ui/add_task_page.dart';
import 'package:todo/ui/theme.dart';
import 'package:todo/utils/theme_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            const Gap(10),
            _addNewTask(),
            const Gap(20),
            _dateTimeLine(),
          ],
        ),
      ),
    );
  }

  _appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeServices().switchTheme();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage(
            "images/profile.jpg",
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }

  _addNewTask() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              style: subHeadingStyle,
            ),
            Text(
              "Today",
              style: headingStyle,
            ),
          ],
        ),
        MyButton(
          label: "+ Add task",
          onTap: () => Get.to(() => const AddTaskPage()),
        ),
      ],
    );
  }

  _dateTimeLine() {
    return DatePicker(
      DateTime.now(),
      height: 100,
      width: 70,
      initialSelectedDate: _selectedDate,
      selectionColor: primaryColor,
      deactivatedColor: Colors.grey,
      selectedTextColor: whiteColor,
      onDateChange: (date) {
        setState(() {
          _selectedDate = date;
        });
      },
      dateTextStyle: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
        ),
      ),
      dayTextStyle: GoogleFonts.lato(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
      ),
      monthTextStyle: GoogleFonts.lato(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
      ),
    );
  }
}
