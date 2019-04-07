using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
 
namespace Program
{
    class Program
    {
        static void Main(string args[)
        {
            int num, sum, r;
            num = 231;
            sum = 0;
            char str[100];
            while (num != 0)
            {
                r = num % 10;
                num = num / 10;
                sum = sum + r;
            }
 
        }

        int square(int num){
            return num*num;
        }
    }
}