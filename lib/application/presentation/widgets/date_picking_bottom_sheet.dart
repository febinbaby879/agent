import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickingShowDialog extends StatefulWidget {
  const DatePickingShowDialog({
    super.key,
    required this.datePicker,
    required this.onPressed,
    this.initialDate,
    this.startYear = 0,
    this.endYear = 0,
    required this.hinttext,
  });

  final TextEditingController datePicker;
  final void Function(String) onPressed;
  final int startYear;
  final int endYear;
  final DateTime? initialDate;
  final String hinttext;

  @override
  State<DatePickingShowDialog> createState() => _DatePickingShowDialogState();
}

class _DatePickingShowDialogState extends State<DatePickingShowDialog> {
  late DateTime _selectedDate;
  late DateTime _focusedDate;
  bool _isTextFieldMode = false;
  bool _isYearSelection = false;
  bool _isMonthSelection = false;

  @override
  void initState() {
    super.initState();

    // Initialize with previously selected date from controller if available
    if (widget.datePicker.text.isNotEmpty) {
      try {
        _selectedDate = DateFormat('yyyy-MM-dd').parse(widget.datePicker.text);
      } catch (e) {
        // If parsing fails, use initialDate or current date
        _selectedDate = widget.initialDate ?? DateTime.now();

        // Update controller with valid date
        widget.datePicker.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
      }
    } else {
      // If no previous selection, use initialDate or current date
      _selectedDate = widget.initialDate ?? DateTime.now();

      // Set the controller text with the selected date
      widget.datePicker.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
    }

    // Initialize focused date to match selected date
    _focusedDate = _selectedDate;
  }

  void _updateSelectedDate(DateTime date) {
    setState(() {
      _selectedDate = date;
      _focusedDate = date;
    });

    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    widget.datePicker.text = formattedDate;
    widget.onPressed(formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final firstDate = now.subtract(Duration(days: widget.startYear * 365));
    final lastDate = widget.endYear != 0
        ? now.add(Duration(days: widget.endYear * 365))
        : (widget.startYear == 0
            ? now.add(const Duration(days: 365 * 100))
            : now);

    return Dialog(
      insetPadding: const EdgeInsets.all(16.0),
      backgroundColor: kWhite,
      shape: RoundedRectangleBorder(borderRadius: kRadius10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth:
                MediaQuery.of(context).size.width > 600 ? 350 : double.infinity,
            maxHeight: 500,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header with title and toggle
              Text(widget.hinttext, style: textHeadStyle1),
              kHeight10,

              // Main content area
              Expanded(
                child: _isTextFieldMode
                    ? _buildTextField()
                    : _isYearSelection
                        ? _buildYearPicker(firstDate, lastDate)
                        : _isMonthSelection
                            ? _buildMonthPicker()
                            : _buildCalendar(firstDate, lastDate),
              ),

              // Footer with buttons
              kHeight15,
              Row(
                children: [
                  const Text('Text'),
                  Switch(
                    value: !_isTextFieldMode,
                    onChanged: (value) {
                      setState(() {
                        _isTextFieldMode = !value;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  const Text('Calendar'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (_isYearSelection || _isMonthSelection)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          if (_isMonthSelection) {
                            _isMonthSelection = false;
                            _isYearSelection = true;
                          } else {
                            _isYearSelection = false;
                          }
                        });
                      },
                      child: const Text('Back'),
                    ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Ensure we return the selected date
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                    ),
                    child: const Text('Done'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        controller: widget.datePicker,
        decoration: InputDecoration(
          hintText: 'YYYY-MM-DD',
          labelText: 'Enter Date',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              setState(() {
                _isTextFieldMode = false;
              });
            },
          ),
        ),
        onChanged: (value) {
          // Simple validation
          try {
            final date = DateFormat('yyyy-MM-dd').parse(value);
            setState(() {
              _selectedDate = date;
              _focusedDate = date;
            });
            widget.onPressed(value);
          } catch (e) {
            // Invalid format
          }
        },
      ),
    );
  }

  Widget _buildCalendar(DateTime firstDate, DateTime lastDate) {
    return Column(
      children: [
        // Navigation header
        GestureDetector(
          onTap: () {
            setState(() {
              _isYearSelection = true;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('MMMM yyyy').format(_focusedDate),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),

        // Calendar view
        Expanded(
          child: CalendarDatePicker(
            initialDate: _selectedDate,
            firstDate: firstDate,
            lastDate: lastDate,
            onDateChanged: _updateSelectedDate,
            currentDate: DateTime.now(),
          ),
        ),
      ],
    );
  }

  Widget _buildYearPicker(DateTime firstDate, DateTime lastDate) {
    return Column(
      children: [
        const Text(
          'Select Year',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: YearPicker(
            firstDate: firstDate,
            lastDate: lastDate,
            selectedDate: _selectedDate,
            onChanged: (DateTime yearDate) {
              setState(() {
                _selectedDate = DateTime(
                    yearDate.year, _selectedDate.month, _selectedDate.day);
                _focusedDate = _selectedDate;
                _isYearSelection = false;
                _isMonthSelection = true;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMonthPicker() {
    final currentYear = _selectedDate.year;

    return Column(
      children: [
        Text(
          'Select Month, $currentYear',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              final month = index + 1;
              final isSelected = _selectedDate.month == month;

              return InkWell(
                onTap: () {
                  // Update with new month, keeping same year and try to maintain day
                  // (adjusting if necessary for shorter months)
                  final daysInMonth = DateTime(currentYear, month + 1, 0).day;
                  final newDay = _selectedDate.day > daysInMonth
                      ? daysInMonth
                      : _selectedDate.day;

                  final newDate = DateTime(currentYear, month, newDay);
                  setState(() {
                    _selectedDate = newDate;
                    _focusedDate = newDate;
                    _isMonthSelection = false;
                  });
                  widget.datePicker.text =
                      DateFormat('yyyy-MM-dd').format(newDate);
                  widget.onPressed(widget.datePicker.text);
                },
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.blue.withOpacity(0.2)
                        : Colors.transparent,
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.grey.shade300,
                      width: isSelected ? 2 : 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      DateFormat('MMM').format(DateTime(currentYear, month)),
                      style: TextStyle(
                        color: isSelected ? Colors.blue : Colors.black,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Add this enum to your file if it doesn't exist elsewhere
enum CalendarFormat { month, twoWeeks, week }
