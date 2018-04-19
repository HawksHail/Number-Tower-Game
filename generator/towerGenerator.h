#ifndef TOWERGENERATOR_H
#define TOWERGENERATOR_H
#include <iostream>
#include <string>

class towerGenerator
{
   public:
      towerGenerator();
      void generateTower(int[2][28]);
      ~towerGenerator();

   protected:

   private:
      void generateSolved(int[28]);
      void generateUnsolved(int[28],int[28]);
      int rowCheck(int[28],int,int);
      bool diagonalCheck(int[28]);
};

#endif // TOWERGENERATOR_H
