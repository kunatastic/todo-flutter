import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/components/inputField.dart';
import 'package:todo/ui/theme.dart';

enum Status { int, String }

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  late DateTime _selectedDate;
  late String _startTime;
  late String _endTime;
  late int _selectedRemind;
  final List<int> _remindList = [5, 10, 20, 30];
  late String _repeatRemind;
  final List<String> _repeatList = ["None", "Daily", "Weekly", "Monthly"];

  String _formatTime(DateTime time) {
    return DateFormat('hh:mm a').format(time);
  }

  @override
  void initState() {
    _selectedDate = DateTime.now();
    _startTime = _formatTime(_selectedDate);
    _endTime = "5:30 AM";
    _selectedRemind = _remindList[0];
    _repeatRemind = _repeatList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _appbar(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Gap(10),
              Text("Add new task", style: headingStyle),
              const Gap(20),
              const MyInputField(label: "Title", hint: "Enter title here"),
              const MyInputField(label: "Note", hint: "Enter note here"),
              MyInputField(
                label: "Date",
                hint: DateFormat('dd/MM/yyyy').format(_selectedDate),
                widget: IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                  ),
                  onPressed: () => _datePicker(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      label: "Start Time",
                      hint: _startTime,
                      widget: IconButton(
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: Get.isDarkMode
                              ? Colors.grey[100]
                              : Colors.grey[700],
                        ),
                        onPressed: () => _timePicker(
                            isStartTime: true, initialTime: _startTime),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Expanded(
                    child: MyInputField(
                      label: "End Time",
                      hint: _endTime,
                      widget: IconButton(
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: Get.isDarkMode
                              ? Colors.grey[100]
                              : Colors.grey[700],
                        ),
                        onPressed: () => _timePicker(
                            isStartTime: false, initialTime: _endTime),
                      ),
                    ),
                  ),
                ],
              ),
              MyInputField(
                label: "Remind",
                hint: "$_selectedRemind minutes early",
                widget: _remindPicker(_remindList, "remind"),
              ),
              MyInputField(
                label: "Repeat",
                hint: _repeatRemind,
                widget: _remindPicker(_repeatList, "repeat"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _appbar(BuildContext context) {
    return AppBar(
      // title: const Text("Add New Task"),
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
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

  _datePicker() async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(primary: Theme.of(context).primaryColor),
          ),
          child: child ?? Container(),
        );
      },
    );

    if (pickerDate != null) {
      setState(() {
        _selectedDate = pickerDate;
      });
    }
  }

  _timePicker({required bool isStartTime, required String initialTime}) async {
    var pickerTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(initialTime.split(":")[0]),
        minute: int.parse(initialTime.split(":")[1].split(" ")[0]),
      ),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(primary: Theme.of(context).primaryColor),
          ),
          child: child ?? Container(),
        );
      },
    );

    if (pickerTime == null) return;

    // ignore: use_build_context_synchronously
    String formattedTime = pickerTime.format(context);

    if (isStartTime) {
      setState(() {
        _startTime = formattedTime;
      });
    } else {
      setState(() {
        _endTime = formattedTime;
      });
    }
  }

  _remindPicker(List<dynamic> array, String update) {
    return DropdownButton(
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.grey,
      ),
      iconSize: 24,
      elevation: 4,
      style: subTitleStyle,
      underline: Container(height: 0),
      items: array.map<DropdownMenuItem>((value) {
        return DropdownMenuItem(
          value: value,
          child: Text("$value"),
        );
      }).toList(),
      onChanged: (dynamic value) {
        setState(() {
          if (update == "remind") {
            _selectedRemind = value;
          } else {
            _repeatRemind = value;
          }
        });
      },
    );
  }
}
