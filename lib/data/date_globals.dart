/* 
Assorted global helper functions and variables related to DateTime usage
Author: Vance Spears
Date: 2022/12/13
*/

///
final days = [
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
  "Sun",
];

///
DateTime mostRecentWeekday(DateTime date, int weekday) =>
    DateTime(date.year, date.month, date.day - (date.weekday - weekday) % 7);

///
String formattedDate(DateTime date) =>
    "${date.month.toString().padLeft(2, "0")}/${date.day.toString().padLeft(2, "0")}/${date.year.toString().substring(2)}";
