package Complex_Numbers is

   type Complex is record
      Real : Integer;
      Imag : Integer;
   end record;

   function Image (C : Complex) return String;

   procedure Add      (C1, C2 : Complex);
   procedure Subtract (C1, C2 : Complex);
   procedure Multiply (C1, C2 : Complex);
   procedure Divide   (C1, C2 : Complex);

end Complex_Numbers;
