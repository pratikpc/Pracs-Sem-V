#include <math.h>
#include <stdio.h>

void Display (unsigned char* result, unsigned count)
{
   for (unsigned i = 0; i < count; ++i)
      printf ("%d", result[i]);
   printf ("\n");
}

// Ensure len(left) >= len(right)
void XOR (unsigned char* left, unsigned char* right, unsigned rN)
{
   for (unsigned i = 0; i < rN; ++i)
      left[i] = left[i] ^ right[i];
}

void CRCGenerate (unsigned char* source, unsigned char* generator, unsigned vN, unsigned gN)
{
   unsigned char tmp[30];
   for (unsigned i = 0; i < vN; ++i)
      tmp[i] = source[i];

   // Add 0's to classify as Remainder to the end
   unsigned remainderN = gN - 1;
   for (unsigned i = 0; i < remainderN; ++i)
      source[vN + i] = 0;

   // XOR All Values One by One
   for (unsigned i = 0; i < vN; ++i)
   {
      // If it starts with 0, go to next
      if (source[i] == 0)
         continue;
      // If there are enough values left
      if (i + 1 < vN)
         XOR (source + i, generator, gN);
      else
         break;
   }
   for (unsigned i = 0; i < vN; i++)
      source[i] = tmp[i];
}
int CRCCHeck (unsigned char* source, unsigned char* generator, unsigned vN, unsigned gN)
{
   // XOR All Values One by One
   for (unsigned i = 0; i < vN; ++i)
   {
      // If it starts with 0, go to next
      if (source[i] == 0)
         continue;
      // If there are enough values left
      if (i + 1 < vN)
         XOR (source + i, generator, gN);
      else
         break;
   }
   for (unsigned i = vN; i < vN + gN; i++)
      if (source[i] == 1)
         return 0;
   return 1;
}


int main ()
{
   unsigned char values [20] = {1, 1, 1, 0, 0, 0, 1, 0};
   unsigned vN = 8;
   unsigned char generator [] = {1, 1, 0, 0, 1, 1};
   unsigned gN = 6;

   Display (values, vN);
   CRCGenerate (values, generator, vN, gN);
   Display (values, vN + gN - 1);

   printf ("\n\nWith Error\n");
   values[4] = 1;
   Display (values, vN + gN - 1);

   if (CRCCHeck (values, generator, vN, gN))
      printf ("No Error");
   else
      printf ("Error\n");
   return 0;
}
