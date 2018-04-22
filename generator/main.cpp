#include "towerGenerator.h"
#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
using namespace std;

int main()
{
   ofstream file;
   towerGenerator test1;
   int testTower[2][28];
   for(int i = 0; i <10; i++)
   {
      stringstream sstream;
      sstream <<"pyramid"<<i<<".dat";
      file.open(sstream.str());
      test1.generateTower(testTower);
      if(testTower[1][0] != 0)
         file<<testTower[1][0];
      else
         file<<"\n";
      for(int j = 1; j < 28; j++)
      {
         if(testTower[1][j] != 0)
            file<<"\n"<<testTower[1][j];
         else
            file<<"\n";
      }
      for(int j = 0; j < 28; j++)
      {
         file<<"\n"<<testTower[0][j];
      }
      file.close();   test1.generateTower(testTower);
   }
}
