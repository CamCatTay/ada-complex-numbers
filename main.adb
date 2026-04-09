with Complex_Numbers;
with Ada.Wide_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Main is
   A   : Integer;
   B   : Integer;
   C   : Integer;
   D   : Integer;
   C1  : Complex_Numbers.Complex;
   C2  : Complex_Numbers.Complex;
begin

   Put("C1 Real Part: ");
   Get(A);
   Skip_Line;

   Put("C1 Imag Part: ");
   Get(B);
   Skip_Line;

   Put("C2 Real Part: ");
   Get(C);
   Skip_Line;

   Put("C2 Imag Part: ");
   Get(D);
   Skip_Line;

   C1 := (Real => A, Imag => B);
   C2 := (Real => C, Imag => D);

   Complex_Numbers.Add      (C1, C2);
   Complex_Numbers.Subtract (C1, C2);
   Complex_Numbers.Multiply (C1, C2);
   Complex_Numbers.Divide   (C1, C2);
end Main;