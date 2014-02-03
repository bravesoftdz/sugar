﻿namespace Sugar.Test;

interface

uses
  Sugar,
  Sugar.IO,
  Sugar.TestFramework;

type
  FileTest = public class (Testcase)
  private
    Dir: Folder;
    Data: File;
  public
    method Setup; override;
    method TearDown; override;
    method TestCopy;
    method Delete;
    method Move;
    method Rename;
    method FromPath;
    method Path;
    method Name;
  end;

implementation

method FileTest.Setup;
begin
  Dir := Folder.UserLocal.CreateFolder("SugarFileTest", true);
  Assert.IsNotNull(Dir);
  Data := Dir.CreateFile("SugarTest.dat", true);
  Assert.IsNotNull(Data);
end;

method FileTest.TearDown;
begin
  Dir.Delete;
end;

method FileTest.TestCopy;
begin
  var Temp := Dir.CreateFolder("Temp", true);
  Assert.IsNotNull(Temp);
  var Value := Data.Copy(Temp);
  Assert.IsNotNull(Value);
  Assert.IsNotNull(Temp.GetFile("SugarTest.dat"));
  Assert.IsNotNull(Dir.GetFile("SugarTest.dat"));
  Assert.IsException(->Value.Copy(Dir));
  Assert.IsException(->Value.Copy(nil));
  Value.Delete;

  Value := Data.Copy(Temp, "Test.dat");
  Assert.IsNotNull(Value);
  Assert.IsNotNull(Temp.GetFile("Test.dat"));
  Assert.IsNotNull(Dir.GetFile("SugarTest.dat"));
  Assert.IsException(->Value.Copy(Dir, "SugarTest.dat"));
  Assert.IsException(->Value.Copy(nil, "1"));
  Assert.IsException(->Value.Copy(Dir, nil));
  Assert.IsException(->Value.Copy(Dir, ""));
end;

method FileTest.Delete;
begin
  Assert.CheckInt(1, length(Dir.GetFiles));
  Assert.IsNotNull(Dir.GetFile("SugarTest.dat"));
  Data.Delete;
  Assert.CheckInt(0, length(Dir.GetFiles));
  Assert.IsNull(Dir.GetFile("SugarTest.dat"));
  Assert.IsException(->Data.Delete);
end;

method FileTest.Move;
begin
  var Temp := Dir.CreateFolder("Temp", true);
  Assert.IsNotNull(Temp);

  var Value := Data.Move(Temp);
  Assert.IsNotNull(Value);
  Assert.IsNotNull(Temp.GetFile("SugarTest.dat"));
  Assert.IsNull(Dir.GetFile("SugarTest.dat"));
  Assert.IsException(->Value.Move(Temp));
  Assert.IsException(->Value.Move(nil));

  Value := Value.Move(Dir, "Test.dat");
  Assert.IsNotNull(Value);
  Assert.IsNotNull(Dir.GetFile("Test.dat"));
  Assert.IsNull(Temp.GetFile("SugarTest.dat"));
  Assert.IsException(->Value.Move(Dir, "Test.dat"));
  Assert.IsException(->Value.Move(nil, "1"));
  Assert.IsException(->Value.Move(Dir, nil));
  Assert.IsException(->Value.Move(Dir, ""));
end;

method FileTest.Rename;
begin
  var Value := Data.Rename("Test.dat");
  Assert.IsNotNull(Value);
  Assert.CheckString("Test.dat", Value.Name);
  Assert.IsNotNull(Dir.GetFile("Test.dat"));
  Assert.IsNull(Dir.GetFile("SugarTest.dat"));
  Assert.IsException(->Data.Rename("Test.dat"));
  Assert.IsException(->Data.Rename(nil));
  Assert.IsException(->Data.Rename("/"));
  Assert.IsException(->Data.Rename(""));
end;

method FileTest.FromPath;
begin
  Assert.IsNotNull(Dir.CreateFile("1.txt", true));
  Assert.IsNotNull(new File(Dir.Path + Folder.Separator + "1.txt"));
  Assert.IsException(->new File(Dir.Path + Folder.Separator + "2.txt"));
  Assert.IsException(->new File(nil));
end;

method FileTest.Path;
begin
  Assert.CheckBool(false, String.IsNullOrEmpty(Data.Path));
  Assert.IsNotNull(Dir.CreateFile("1.txt", true));
  var Value := new File(Dir.Path +Folder.Separator+"1.txt");
  Assert.IsNotNull(Value);
  Assert.CheckBool(false, String.IsNullOrEmpty(Value.Path));
end;

method FileTest.Name;
begin
  Assert.CheckBool(false, String.IsNullOrEmpty(Data.Name));
  Assert.IsNotNull(Dir.CreateFile("1.txt", true));
  var Value := new File(Dir.Path +Folder.Separator+"1.txt");
  Assert.IsNotNull(Value);
  Assert.CheckBool(false, String.IsNullOrEmpty(Value.Name));
  Assert.CheckString("1.txt", Value.Name);
end;

end.