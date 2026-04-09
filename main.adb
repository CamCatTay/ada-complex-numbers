with Ada.Numerics.Discrete_Random;
with Complex_Numbers;

procedure Main is
   subtype Int_Range is Integer range -10 .. 10;
   package Rand is new Ada.Numerics.Discrete_Random (Int_Range);

   Gen : Rand.Generator;
   C1  : Complex_Numbers.Complex;
   C2  : Complex_Numbers.Complex;
begin
   Rand.Reset (Gen);

   C1 := (Real => Rand.Random (Gen), Imag => Rand.Random (Gen));
   C2 := (Real => Rand.Random (Gen), Imag => Rand.Random (Gen));

   Complex_Numbers.Add      (C1, C2);
   Complex_Numbers.Subtract (C1, C2);
   Complex_Numbers.Multiply (C1, C2);
   Complex_Numbers.Divide   (C1, C2);
end Main;