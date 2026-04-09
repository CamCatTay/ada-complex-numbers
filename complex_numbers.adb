with Ada.Text_IO;

package body Complex_Numbers is

   package Float_IO is new Ada.Text_IO.Float_IO (Float);

   -- Gets rid of " " in front of positive integers for formatting
   function Trim_Int (N : Integer) return String is
      S : constant String := Integer'Image (N);
   begin
      if S'Length > 0 and then S (S'First) = ' ' then
         return S (S'First + 1 .. S'Last);
      end if;
      return S;
   end Trim_Int;


   -- Formats float's to look like standard output of Java or C++. basically strips the scientific notation
   function Format_Float (X : Float) return String is
      Buf : String (1 .. 30) := (others => ' ');
   begin
      Float_IO.Put (To => Buf, Item => X, Aft => 6, Exp => 0);

      declare
         Start : Natural := Buf'First;
         Stop  : Natural := Buf'Last;
         Dot   : Natural := 0;
      begin
         while Start <= Stop and then Buf (Start) = ' ' loop
            Start := Start + 1;
         end loop;

         for I in reverse Start .. Stop loop
            if Buf (I) /= '0' then
               Stop := I;
               exit;
            end if;
         end loop;

         for I in Start .. Stop loop
            if Buf (I) = '.' then
               Dot := I;
               exit;
            end if;
         end loop;

         if Dot > 0 and then Dot = Stop then
            Stop := Stop - 1;
         end if;

         return Buf (Start .. Stop);
      end;
   end Format_Float;

   -- Returns a string like "num+numi"
   function Image (C : Complex) return String is
      Op : constant String := (if C.Imag < 0 then "" else "+");
   begin
      return Trim_Int (C.Real) & Op & Trim_Int (C.Imag) & "i";
   end Image;

   procedure Add (C1, C2 : Complex) is
      AC : constant Integer := C1.Real + C2.Real;
      BD : constant Integer := C1.Imag + C2.Imag;
      Op : constant String  := (if BD < 0 then "" else "+");
   begin
      Ada.Text_IO.Put ("(" & Image (C1) & ") + (" & Image (C2) & ") = ");
      Ada.Text_IO.Put_Line (Trim_Int (AC) & Op & Trim_Int (BD) & "i");
   end Add;

   procedure Subtract (C1, C2 : Complex) is
      AC : constant Integer := C1.Real - C2.Real;
      BD : constant Integer := C1.Imag - C2.Imag;
      Op : constant String  := (if BD < 0 then "" else "+");
   begin
      Ada.Text_IO.Put ("(" & Image (C1) & ") - (" & Image (C2) & ") = ");
      Ada.Text_IO.Put_Line (Trim_Int (AC) & Op & Trim_Int (BD) & "i");
   end Subtract;

   procedure Multiply (C1, C2 : Complex) is
      A         : constant Integer := C1.Real;
      B         : constant Integer := C1.Imag;
      C         : constant Integer := C2.Real;
      D         : constant Integer := C2.Imag;
      Real_Part : constant Integer := A * C - B * D;
      Imag_Part : constant Integer := A * D + B * C;
      Op        : constant String  := (if Imag_Part < 0 then "" else "+");
   begin
      Ada.Text_IO.Put ("(" & Image (C1) & ") * (" & Image (C2) & ") = ");
      Ada.Text_IO.Put_Line (Trim_Int (Real_Part) & Op & Trim_Int (Imag_Part) & "i");
   end Multiply;

   procedure Divide (C1, C2 : Complex) is
      A     : constant Integer := C1.Real;
      B     : constant Integer := C1.Imag;
      C     : constant Integer := C2.Real;
      D     : constant Integer := C2.Imag;
      Denom : constant Integer := C * C + D * D;
   begin
      Ada.Text_IO.Put ("(" & Image (C1) & ") / (" & Image (C2) & ") = ");

      if Denom = 0 then
         Ada.Text_IO.Put_Line ("error: cannot divide by zero");
         return;
      end if;

      declare
         Real_Part : constant Float  := Float (A * C + B * D) / Float (Denom);
         Imag_Part : constant Float  := Float (B * C - A * D) / Float (Denom);
         Op        : constant String := (if Imag_Part < 0.0 then "" else "+");
      begin
         Ada.Text_IO.Put_Line
           (Format_Float (Real_Part) & Op & Format_Float (Imag_Part) & "i");
      end;
   end Divide;

end Complex_Numbers;
