#include <math.h>
#include <stdio.h>

// We know
// 2^k >= n + k + 1
unsigned GetKFromN (unsigned n)
{
   for (unsigned k = 0;; ++k)
   {
      unsigned rhs = n + k + 1;
      unsigned lhs = pow (2, k);
      if (lhs >= rhs)
         return k;
   }
   return 0;
}

// We know
// 2^k >= n + k + 1
// 2^k >= total
unsigned GetKFromTotal (unsigned total)
{
   for (unsigned k = 0;; ++k)
   {
      unsigned rhs = total;
      unsigned lhs = pow (2, k);
      if (lhs >= rhs)
         return k;
   }
   return 0;
}


void GenerateHamming (unsigned char* result, unsigned char* input,
   unsigned n, unsigned kT, unsigned total)
{
   for (unsigned i = 1, k = 0; i <= total; ++i)
   {
      if (pow (2, k) == i)
      {
         result[i] = 0;
         ++k;
      }
      else
         result[i] = input[i - k];
   }

   unsigned exp = 1;
   //   0 0 1 1 
   //   0 1 0 2
   //   0 1 1 3
   //   1 0 0 4
   //   1 0 1 5
   //   1 1 0 6
   //   1 1 1 7
   // So for 1st select 1,3,5,7 as there are 1s there

   for (unsigned kI = 0; kI < kT; ++kI)
   {
      unsigned char value = 0;
      for (unsigned i = 1; i <= total; ++i)
         if ((i & exp) == exp)
            value = (value ^ result[i]);
      unsigned pos = pow (2, kI);
      result[pos] = value;
      exp <<= 1;
   }
}

unsigned CheckHamming (unsigned char* input, unsigned total)
{
   //   0 0 1 1 
   //   0 1 0 2
   //   0 1 1 3
   //   1 0 0 4
   //   1 0 1 5
   //   1 1 0 6
   //   1 1 1 7
   // So for 1st select 1,3,5,7 as there are 1s there
   // If there are Odd Number of 1s
   // Then error = 1
   // So errPos = (2^k) + errPos

   unsigned exp = 1;
   unsigned kT = GetKFromTotal (total);

   unsigned errPos = 0;
   for (unsigned kI = 0; kI < kT; ++kI)
   {
      unsigned char error = 0;
      for (unsigned i = 1; i <= total; ++i)
         if ((i & exp) == exp)
            error = (error ^ input[i]);
      if (error == 1)
         errPos = errPos + pow (2, kI);
      exp <<= 1;
   }
   return errPos;
}

void Display (unsigned char* result, unsigned count)
{
   for (unsigned i = 1; i < count; ++i)
      printf ("%d", result[i]);
   printf ("\n");
}

int main ()
{
   unsigned char values [] = {0, 1, 0, 0, 1};
   unsigned n = 4;
   unsigned k = GetKFromN (n);

   unsigned char result[20] = {0};
   unsigned total = n + k + 1;

   Display (result, total);
   GenerateHamming (result, values, n, k, total);
   Display (result, total);

   printf ("\n\nWith Error\n");
   result[4] = 0;
   Display (result, total);
   unsigned error = CheckHamming (result, total);

   if (error == 0)
      printf ("No Error");
   else
   {
      printf ("Error at %d\n", error);
      printf ("Corrected");
      result[error] = result[error] ^ 1;
      Display (result, total);
   }
   return 0;
}
