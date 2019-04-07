using System;

namespace Program
{
    public class Program
    {
        public void Main(int args)
        {
            int num1, num2;
            double t;
            char[200] str;
            
            num1 = 2;
            num2 = 10;

            if(num1>num2){
            	break;
            }
            else if(num1<num2){
            	num2 = num1;
            	if(num2>t){
            		num1 = 10;
            	}
            }
            else{
                t = num1/num2;
            	continue;
            }

            switch(t){
            	case 1:
            		break;
            	case 2:
            		num1 = num2+2;
            		break;
            	default:
            		num1 = num2;
            }
        }
    }
}