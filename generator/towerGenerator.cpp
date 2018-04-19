#include "towerGenerator.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
towerGenerator::towerGenerator()
{
   srand(time(NULL));
   //ctor
}

towerGenerator::~towerGenerator()
{
   //dtor
}
void towerGenerator::generateTower(int tower[2][28])
{
   generateSolved(tower[0]);
   generateUnsolved(tower[0],tower[1]);
}
void towerGenerator::generateSolved(int tower[28])
{
   for(int i = 21; i < 28; i++)
   {
      tower[i] = rand()%30 + 1;
   }
   for(int i = 15; i < 21; i++)
   {
      tower[i] = tower[i+6] + tower[i+7];
   }
   for(int i = 10; i < 15; i++)
   {
      tower[i] = tower[i+5] + tower[i+6];
   }
   for(int i = 6; i < 10; i++)
   {
      tower[i] = tower[i+4] + tower[i+5];
   }
   for(int i = 3; i < 6; i++)
   {
      tower[i] = tower[i+3] + tower[i+4];
   }
   for(int i = 1; i < 3; i++)
   {
      tower[i] = tower[i+2] + tower[i+3];
   }
   tower[0] = tower[1] + tower[2];
}
void towerGenerator::generateUnsolved(int solved[28],int unsolved[28])
{
   for(int i = 0; i < 28; i++)
   {
      unsolved[i] = solved[i];
   }
   for(int i = 0; i < 15; i++)
   {
      unsolved[rand()%28] = 0;
   }
   int rowChecks[6];
   rowChecks[0] = rowCheck(unsolved,1,2);
   rowChecks[1] = rowCheck(unsolved,3,5);
   rowChecks[2] = rowCheck(unsolved,6,9);
   rowChecks[3] = rowCheck(unsolved,10,14);
   rowChecks[4] = rowCheck(unsolved,15,20);
   rowChecks[5] = rowCheck(unsolved,21,27);
   for(int i = 0; i < 6; i++)
   {
      if(rowChecks[i] != -1)
      {
         unsolved[rowChecks[i]] = solved[rowChecks[i]];
      }
   }
   if(!diagonalCheck(unsolved))
      unsolved[0] = solved[0];
}

int towerGenerator::rowCheck(int unsolved[28],int start, int end)
{
   bool rowSafe = false;
   for(int i = start; i <= end; i++)
   {
      if(unsolved[i] != 0)
      {
         rowSafe = true;
      }
   }
   if(rowSafe == false)
   {
      return (rand() %(1 + end - start) +start);
   }
   else
      return -1;
}

bool towerGenerator::diagonalCheck(int unsolved[28])
{
   bool left = false;
   bool right = false;
   if(unsolved[0] != 0)
      return true;
   int j = 0;
   for(int i = 1; i < 28; i+=(j + 1))
   {
      j++;
      if(unsolved[i] != 0)
         left = true;
      if(unsolved[i+j] != 0)
         right = true;
   }
   return left&&right;
}
