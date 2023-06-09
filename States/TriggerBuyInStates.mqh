/*

   TriggerBuyInStates
   Copyright 2021, Gregory Jo
   https://www.gjo-se.com

   Beschreibung
   ===============

*/

bool getTriggerBuyInSignalState() {

   bool signal = true;

   //Print("-------------------getTriggerBuyInSignalState---------------------------------:");

   if(getOpenBuyPositionsFilter() == true) signal = false;
   if(isRedCandleFilter() == true) signal = false;

   if(getMomentumIsLowerMINMomentumBuyInFilter() == true) signal = false;
//   if(getMomentumIsHigherMAXMomentumBuyInFilter() == true) signal = false;
//   if(getMomentumIsLowerHighestHighBuyInFilter() == true) signal = false;

   //if(getMaxCandleFuseBuyInFilter() == true) signal = false;
   //if(getMaxCandleWickBuyInFilter() == true) signal = false;

   return(signal);

}
//+------------------------------------------------------------------+

bool getMomentumIsLowerMINMomentumBuyInFilter() {

   bool     filter = false;
   int      barShift = 0;

//   Print("buyMomentumBuffer[barShift]: " + buyMomentumBuffer[barShift]);
//   Print("InpMinMomentum: " + InpMinMomentum);

   if(buyMomentumBuffer[barShift] < InpMinMomentum) {
      filter = true;

      //Print("MomentumFilter isFalse, also Sleep");
   }else{
       //sleepRestOfSession();
   }

   return (filter);
}

bool getMomentumIsHigherMAXMomentumBuyInFilter() {

   bool filter = false;
   double momentumMaxToLowestLow = InpMomentumMaxToLowestLow * Point();

   if(Bid() > LowestLow(Symbol(), PERIOD_M1, 5) + momentumMaxToLowestLow) {
      filter = true;
      //Print("getMomentumIsHigherMAXMomentumBuyInFilter");
   }

   return (filter);
}
//+------------------------------------------------------------------+


bool getMomentumIsLowerHighestHighBuyInFilter() {

   bool filter = false;
   double momentumMinToHighestHigh = InpMomentumMinToHighestHigh * Point();
   int candles = 5;
   int barShift = 1;
   double highestHigh = HighestHigh(Symbol(), PERIOD_M1, candles, barShift);

   if(Bid() < (highestHigh + momentumMinToHighestHigh)) {
      filter = true;
      //Print("getMomentumIsLowerHighestHighBuyInFilter");
   }

   return (filter);
}


bool getOpenBuyPositionsFilter() {

   bool filter = false;
   long positionTicket = 0;

   int positionTicketsId = 0;
   for(positionTicketsId; positionTicketsId < ArraySize(positionTickets); positionTicketsId++) {
      positionTicket = positionTickets[positionTicketsId];
      if(PositionType(positionTicket) == ORDER_TYPE_BUY) filter = true;
   }

   return (filter);
}
//+------------------------------------------------------------------+

bool isRedCandleFilter() {

   bool filter = false;

   if(Bar.Open() > Bid()) {
      filter = true;
      //Print("isRedCandleFilter");
   }

   return (filter);
}

//+------------------------------------------------------------------+

//bool getMaxCandleFuseBuyInFilter() {
//
//   bool filter = false;
//   int   barOpen = Bar.Open() / Point();
//   int   barLow = Bar.Low() / Point();
//
//   if((barOpen - barLow) > InpMaxCandleFuse) {
//      filter = true;
//      //Print("getMaxCandleFuseBuyInFilter");
//      //sleepRestOfSession();
//   }
//
//   return (filter);
//}
//
//bool getMaxCandleWickBuyInFilter() {
//
//   bool filter = false;
//   int   barHigh = Bar.High() / Point();
//   int   bid = Bid() / Point();
//
//   if((barHigh - bid) > InpMaxCandleWick) {
//      filter = true;
//      //Print("getMaxCandleWickBuyInFilter");
//      //sleepRestOfSession();
//   }
//
//   return (filter);
//}

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void sleepRestOfSession(int pNextBar = 1) {
   session1530EndHour = getHour();
   session1530EndMinute = getMinute() + pNextBar;
}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int getHour() {
   MqlDateTime timeStruct;
   TimeToStruct(TimeCurrent(), timeStruct);

   return(timeStruct.hour);
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int getMinute() {
   MqlDateTime timeStruct;
   TimeToStruct(TimeCurrent(), timeStruct);

   return(timeStruct.min);
}
//+------------------------------------------------------------------+
