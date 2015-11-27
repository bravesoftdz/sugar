﻿namespace Sugar.Test;

interface

uses
  Sugar,
  RemObjects.Elements.EUnit;

type
  DateTimeTest = public class (Test)
  private
    Data: DateTime;
    method AreEqual(Expected, Actual: DateTime);
    method AssertFormat(Expected: String; Date: DateTime; Locale: String; Format: String);
    method AssertFormat(Expected: String; Date: DateTime; Format: String);
    method AssertFormatDef(Expected: String; Locale: String; Format: String);
    method AssertFormatDef(Expected: String; Format: String);
  public
    method Setup; override;
    method AddDays;
    method AddHours;
    method AddMinutes;
    method AddMonths;
    method AddSeconds;
    method AddYears;
    method CompareTo;

    method Ticks;

    //Formats
    method FormatYears;
    method FormatMonths;
    method FormatDays;
    method FormatHours;
    method FormatMinutesSeconds;
    method ToStringFormat;

    //fields
    method Fields;
  end;

implementation

method DateTimeTest.Setup;
begin
  Data := new DateTime(1961, 4, 12, 6, 7, 0);
end;

method DateTimeTest.AreEqual(Expected: DateTime; Actual: DateTime);
begin
  Assert.AreEqual(Actual.Year, Expected.Year);
  Assert.AreEqual(Actual.Month, Expected.Month);
  Assert.AreEqual(Actual.Day, Expected.Day);
  Assert.AreEqual(Actual.Hour, Expected.Hour);
  Assert.AreEqual(Actual.Minute, Expected.Minute);
  Assert.AreEqual(Actual.Second, Expected.Second);
end;

method DateTimeTest.AssertFormat(Expected: String; Date: DateTime; Locale: String; Format: String);
begin
  Assert.AreEqual(Date.ToString(Format, Locale), Expected);
end;

method DateTimeTest.AssertFormat(Expected: String; Date: DateTime; Format: String);
begin
  AssertFormat(Expected, Date, nil, Format);
end;

method DateTimeTest.AssertFormatDef(Expected: String; Locale: String; Format: String);
begin
  AssertFormat(Expected, Data, Locale, Format);
end;

method DateTimeTest.AssertFormatDef(Expected: String; Format: String);
begin
  AssertFormat(Expected, Data, Format);
end;

method DateTimeTest.AddDays;
begin
  var Value := Data.AddDays(1);
  Assert.AreEqual(Value.Day, 13);
  Value := Data.AddDays(-1);
  Assert.AreEqual(Value.Day, 11);

  Value := Data.AddDays(19); //next month
  Assert.AreEqual(Value.Day, 1);
  Assert.AreEqual(Value.Month, 5);
end;

method DateTimeTest.AddHours;
begin
  var Value := Data.AddHours(1);
  Assert.AreEqual(Value.Hour, 7);
  Value := Data.AddHours(-1);
  Assert.AreEqual(Value.Hour, 5);

  Value := Data.AddHours(19); //next day
  Assert.AreEqual(Value.Day, 13);
  Assert.AreEqual(Value.Hour, 1);
end;

method DateTimeTest.AddMinutes;
begin
  var Value := Data.AddMinutes(1);
  Assert.AreEqual(Value.Minute, 8);
  Value := Data.AddMinutes(-1);
  Assert.AreEqual(Value.Minute, 6);

  Value := Data.AddMinutes(53); //next hour
  Assert.AreEqual(Value.Minute, 0);
  Assert.AreEqual(Value.Hour, 7);
end;

method DateTimeTest.AddMonths;
begin
  var Value := Data.AddMonths(1);
  Assert.AreEqual(Value.Month, 5);
  Value := Data.AddMonths(-1);
  Assert.AreEqual(Value.Month, 3);

  Value := Data.AddMonths(9); //next year
  Assert.AreEqual(Value.Month, 1);
  Assert.AreEqual(Value.Year, 1962);
end;

method DateTimeTest.AddSeconds;
begin
  var Value := Data.AddSeconds(1);
  Assert.AreEqual(Value.Second, 1);
  Value := Data.AddSeconds(-1);
  Assert.AreEqual(Value.Second, 59);

  Value := Data.AddSeconds(60); //next year
  Assert.AreEqual(Value.Second, 0);
  Assert.AreEqual(Value.Minute, 8); 
end;

method DateTimeTest.AddYears;
begin
  var Value := Data.AddYears(1);
  Assert.AreEqual(Value.Year, 1962);
  Value := Data.AddYears(-1);
  Assert.AreEqual(Value.Year, 1960);
end;

method DateTimeTest.CompareTo;
begin
  Assert.AreEqual(Data.CompareTo(Data), 0);
  Assert.IsTrue(Data.CompareTo(Data.AddDays(10)) <> 0);
  Assert.AreEqual(Data.CompareTo(new DateTime(1961, 4, 12, 6, 7, 0)), 0);
end;

method DateTimeTest.FormatYears;
begin
  //single digit not supported
  Assert.Throws(->Data.ToString("{y}"));
  Assert.Throws(->Data.ToString("{yyy}"));

  AssertFormatDef("61", "{yy}");  
  AssertFormatDef("1961", "{yyyy}");

  AssertFormat("05", new DateTime(5, 1, 1), "{yy}");
  AssertFormat("0005", new DateTime(5, 1, 1), "{yyyy}");

  AssertFormat("25", new DateTime(25, 1, 1), "{yy}");
  AssertFormat("0025", new DateTime(25, 1, 1), "{yyyy}");

  AssertFormat("25", new DateTime(325, 1, 1), "{yy}");
  AssertFormat("0325", new DateTime(325, 1, 1), "{yyyy}");

  AssertFormat("05", new DateTime(2305, 1, 1), "{yy}");
  AssertFormat("2305", new DateTime(2305, 1, 1), "{yyyy}");
end;

method DateTimeTest.FormatMonths;
begin
  AssertFormatDef("4", "{M}");
  AssertFormatDef("04", "{MM}");
  AssertFormat("1", new DateTime(1,1,1), "{M}");
  AssertFormat("01", new DateTime(1,1,1), "{MM}");   

  //short
  AssertFormat("Jan", new DateTime(1, 1, 1), "en-US", "{MMM}");
  AssertFormat("Feb", new DateTime(1, 2, 1), "en-US", "{MMM}");
  AssertFormat("Mar", new DateTime(1, 3, 1), "en-US", "{MMM}");
  AssertFormat("Apr", new DateTime(1, 4, 1), "en-US", "{MMM}");
  AssertFormat("May", new DateTime(1, 5, 1), "en-US", "{MMM}");
  AssertFormat("Jun", new DateTime(1, 6, 1), "en-US", "{MMM}");
  AssertFormat("Jul", new DateTime(1, 7, 1), "en-US", "{MMM}");
  AssertFormat("Aug", new DateTime(1, 8, 1), "en-US", "{MMM}");
  AssertFormat("Sep", new DateTime(1, 9, 1), "en-US", "{MMM}");
  AssertFormat("Oct", new DateTime(1, 10, 1), "en-US", "{MMM}");
  AssertFormat("Nov", new DateTime(1, 11, 1), "en-US", "{MMM}");
  AssertFormat("Dec", new DateTime(1, 12, 1), "en-US", "{MMM}");

  AssertFormat("janv.", new DateTime(1, 1, 1), "fr-FR", "{MMM}");
  AssertFormat("févr.", new DateTime(1, 2, 1), "fr-FR", "{MMM}");
  AssertFormat("mars", new DateTime(1, 3, 1), "fr-FR", "{MMM}");
  AssertFormat("avr.", new DateTime(1, 4, 1), "fr-FR", "{MMM}");
  AssertFormat("mai", new DateTime(1, 5, 1), "fr-FR", "{MMM}");
  AssertFormat("juin", new DateTime(1, 6, 1), "fr-FR", "{MMM}");
  AssertFormat("juil.", new DateTime(1, 7, 1), "fr-FR", "{MMM}");
  AssertFormat("août", new DateTime(1, 8, 1), "fr-FR", "{MMM}");
  AssertFormat("sept.", new DateTime(1, 9, 1), "fr-FR", "{MMM}");
  AssertFormat("oct.", new DateTime(1, 10, 1), "fr-FR", "{MMM}");
  AssertFormat("nov.", new DateTime(1, 11, 1), "fr-FR", "{MMM}");
  AssertFormat("déc.", new DateTime(1, 12, 1), "fr-FR", "{MMM}");

  //long
  AssertFormat("January", new DateTime(1, 1, 1), "en-US", "{MMMM}");
  AssertFormat("February", new DateTime(1, 2, 1), "en-US", "{MMMM}");
  AssertFormat("March", new DateTime(1, 3, 1), "en-US", "{MMMM}");
  AssertFormat("April", new DateTime(1, 4, 1), "en-US", "{MMMM}");
  AssertFormat("May", new DateTime(1, 5, 1), "en-US", "{MMMM}");
  AssertFormat("June", new DateTime(1, 6, 1), "en-US", "{MMMM}");
  AssertFormat("July", new DateTime(1, 7, 1), "en-US", "{MMMM}");
  AssertFormat("August", new DateTime(1, 8, 1), "en-US", "{MMMM}");
  AssertFormat("September", new DateTime(1, 9, 1), "en-US", "{MMMM}");
  AssertFormat("October", new DateTime(1, 10, 1), "en-US", "{MMMM}");
  AssertFormat("November", new DateTime(1, 11, 1), "en-US", "{MMMM}");
  AssertFormat("December", new DateTime(1, 12, 1), "en-US", "{MMMM}");

  AssertFormat("janvier", new DateTime(1, 1, 1), "fr-FR", "{MMMM}");
  AssertFormat("février", new DateTime(1, 2, 1), "fr-FR", "{MMMM}");
  AssertFormat("mars", new DateTime(1, 3, 1), "fr-FR", "{MMMM}");
  AssertFormat("avril", new DateTime(1, 4, 1), "fr-FR", "{MMMM}");
  AssertFormat("mai", new DateTime(1, 5, 1), "fr-FR", "{MMMM}");
  AssertFormat("juin", new DateTime(1, 6, 1), "fr-FR", "{MMMM}");
  AssertFormat("juillet", new DateTime(1, 7, 1), "fr-FR", "{MMMM}");
  AssertFormat("août", new DateTime(1, 8, 1), "fr-FR", "{MMMM}");
  AssertFormat("septembre", new DateTime(1, 9, 1), "fr-FR", "{MMMM}");
  AssertFormat("octobre", new DateTime(1, 10, 1), "fr-FR", "{MMMM}");
  AssertFormat("novembre", new DateTime(1, 11, 1), "fr-FR", "{MMMM}");
  AssertFormat("décembre", new DateTime(1, 12, 1), "fr-FR", "{MMMM}");
end;

method DateTimeTest.FormatDays;
begin
  AssertFormatDef("12", "{d}");
  AssertFormatDef("12", "{dd}");

  AssertFormat("5", new DateTime(1, 1, 5), "{d}");
  AssertFormat("05", new DateTime(1, 1, 5), "{dd}");

  //short
  AssertFormat("Mon", new DateTime(2013, 7, 1), "en-US", "{ddd}");
  AssertFormat("Tue", new DateTime(2013, 7, 2), "en-US", "{ddd}");
  AssertFormat("Wed", new DateTime(2013, 7, 3), "en-US", "{ddd}");
  AssertFormat("Thu", new DateTime(2013, 7, 4), "en-US", "{ddd}");
  AssertFormat("Fri", new DateTime(2013, 7, 5), "en-US", "{ddd}");
  AssertFormat("Sat", new DateTime(2013, 7, 6), "en-US", "{ddd}");
  AssertFormat("Sun", new DateTime(2013, 7, 7), "en-US", "{ddd}");

  AssertFormat("lun.", new DateTime(2013, 7, 1), "fr-FR", "{ddd}");
  AssertFormat("mar.", new DateTime(2013, 7, 2), "fr-FR", "{ddd}");
  AssertFormat("mer.", new DateTime(2013, 7, 3), "fr-FR", "{ddd}");
  AssertFormat("jeu.", new DateTime(2013, 7, 4), "fr-FR", "{ddd}");
  AssertFormat("ven.", new DateTime(2013, 7, 5), "fr-FR", "{ddd}");
  AssertFormat("sam.", new DateTime(2013, 7, 6), "fr-FR", "{ddd}");
  AssertFormat("dim.", new DateTime(2013, 7, 7), "fr-FR", "{ddd}");

  //long
  AssertFormat("Monday", new DateTime(2013, 7, 1), "en-US", "{dddd}");
  AssertFormat("Tuesday", new DateTime(2013, 7, 2), "en-US", "{dddd}");
  AssertFormat("Wednesday", new DateTime(2013, 7, 3), "en-US", "{dddd}");
  AssertFormat("Thursday", new DateTime(2013, 7, 4), "en-US", "{dddd}");
  AssertFormat("Friday", new DateTime(2013, 7, 5), "en-US", "{dddd}");
  AssertFormat("Saturday", new DateTime(2013, 7, 6), "en-US", "{dddd}");
  AssertFormat("Sunday", new DateTime(2013, 7, 7), "en-US", "{dddd}");

  AssertFormat("lundi", new DateTime(2013, 7, 1), "fr-FR", "{dddd}");
  AssertFormat("mardi", new DateTime(2013, 7, 2), "fr-FR", "{dddd}");
  AssertFormat("mercredi", new DateTime(2013, 7, 3), "fr-FR", "{dddd}");
  AssertFormat("jeudi", new DateTime(2013, 7, 4), "fr-FR", "{dddd}");
  AssertFormat("vendredi", new DateTime(2013, 7, 5), "fr-FR", "{dddd}");
  AssertFormat("samedi", new DateTime(2013, 7, 6), "fr-FR", "{dddd}");
  AssertFormat("dimanche", new DateTime(2013, 7, 7), "fr-FR", "{dddd}");
end;

method DateTimeTest.FormatHours;
begin
  AssertFormatDef("6", "{h}");
  AssertFormatDef("6", "{H}");

  //1-12
  AssertFormat("1", new DateTime(1, 1, 1, 1, 0, 0), "{h}");
  AssertFormat("01", new DateTime(1, 1, 1, 1, 0, 0), "{hh}");
  AssertFormat("12", new DateTime(1, 1, 1, 12, 0, 0), "{h}");
  AssertFormat("1", new DateTime(1, 1, 1, 13, 0, 0), "{h}");
  AssertFormat("01", new DateTime(1, 1, 1, 13, 0, 0), "{hh}");
  AssertFormat("12", new DateTime(1, 1, 1, 0, 0, 0), "{h}");
  AssertFormat("05", new DateTime(1, 1, 1, 5, 0, 0), "{hh}");

  //0-23
  AssertFormat("1", new DateTime(1, 1, 1, 1, 0, 0), "{H}");
  AssertFormat("01", new DateTime(1, 1, 1, 1, 0, 0), "{HH}");
  AssertFormat("12", new DateTime(1, 1, 1, 12, 0, 0), "{H}");
  AssertFormat("13", new DateTime(1, 1, 1, 13, 0, 0), "{H}");
  AssertFormat("13", new DateTime(1, 1, 1, 13, 0, 0), "{HH}");
  AssertFormat("0", new DateTime(1, 1, 1, 0, 0, 0), "{H}");
  AssertFormat("00", new DateTime(1, 1, 1, 0, 0, 0), "{HH}");
  AssertFormat("23", new DateTime(1, 1, 1, 23, 0, 0), "{H}");

  //AM/PM sign
  AssertFormat("AM", new DateTime(1, 1, 1, 1, 0, 0), "en-US", "{a}");
  AssertFormat("PM", new DateTime(1, 1, 1, 13, 0, 0), "en-US", "{a}");  
end;

method DateTimeTest.FormatMinutesSeconds;
begin
  //minutes
  AssertFormat("0", new DateTime(1, 1, 1, 1, 0, 0), "{m}");
  AssertFormat("30", new DateTime(1, 1, 1, 1, 30, 0), "{m}");
  AssertFormat("59", new DateTime(1, 1, 1, 1, 59, 0), "{m}");

  AssertFormat("00", new DateTime(1, 1, 1, 1, 0, 0), "{mm}");
  AssertFormat("07", new DateTime(1, 1, 1, 1, 7, 0), "{mm}");
  AssertFormat("59", new DateTime(1, 1, 1, 1, 59, 0), "{mm}");

  //seconds
  AssertFormat("0", new DateTime(1, 1, 1, 1, 0, 0), "{s}");
  AssertFormat("30", new DateTime(1, 1, 1, 1, 0, 30), "{s}");
  AssertFormat("59", new DateTime(1, 1, 1, 1, 0, 59), "{s}");

  AssertFormat("00", new DateTime(1, 1, 1, 1, 0, 0), "{ss}");
  AssertFormat("07", new DateTime(1, 1, 1, 1, 0, 7), "{ss}");
  AssertFormat("59", new DateTime(1, 1, 1, 1, 0, 59), "{ss}");
end;

method DateTimeTest.ToStringFormat;
begin
  AssertFormatDef("1961/04/12 06:07:00", "{yyyy}/{MM}/{dd} {HH}:{mm}:{ss}");
  AssertFormatDef("On Wednesday, 12 April, 1961 at 6:07 – the first human traveled into outer space", "en-US",
              "On {dddd}, {dd} {MMMM}, {yyyy} at {h}:{mm} – the first human traveled into outer space");
  AssertFormatDef("Formating year 1961, 61", "Formating year {yyyy}, {yy}");
  AssertFormatDef("Time is 6 o'clock", "Time is {h} o\'clock");
  Assert.Throws(->Data.ToString(nil));
  Assert.Throws(->Data.ToString("Year is {yyyy"));
  Assert.Throws(->Data.ToString("Year is yyyy}"));
  Assert.Throws(->Data.ToString("Year is {}"));
  Assert.Throws(->Data.ToString("Year is {Yyyy}"));  
  Assert.AreEqual(Data.ToString(''), '');
end;

method DateTimeTest.Fields;
begin
  Assert.AreEqual(Data.Year, 1961);
  Assert.AreEqual(Data.Month, 4); 
  Assert.AreEqual(Data.Day, 12);
  Assert.AreEqual(Data.Hour, 6); 
  Assert.AreEqual(Data.Minute, 7);
  Assert.AreEqual(Data.Second, 0);

  var Value := new DateTime(106, 12, 27, 23, 51, 37);
  
  Assert.AreEqual(Value.Year, 106);
  Assert.AreEqual(Value.Month, 12);
  Assert.AreEqual(Value.Day, 27);
  Assert.AreEqual(Value.Hour, 23);
  Assert.AreEqual(Value.Minute, 51);
  Assert.AreEqual(Value.Second, 37);

  AreEqual(new DateTime(1961, 4, 12), Data.Date);
  Assert.AreEqual(Data.Date.Hour, 0);
end;

method DateTimeTest.Ticks;
begin
  assert.AreEqual(new DateTime(1970, 1, 2, 1, 2, 3).Ticks, 621356869230000000);
  assert.AreEqual(new DateTime(1820, 1, 2, 1, 2, 3).Ticks, 574020901230000000);
  assert.AreEqual(new DateTime(621356869230000000).Ticks, 621356869230000000);
end;

end.
