/*

   EA GjoSeMomentum.mq5
   Copyright 2021, Gregory Jo
   https://www.gjo-se.com

   Version History
   ===============

   1.0.0 Initial version

   ===============

*/
//+------------------------------------------------------------------+
//| Includes                                                         |
//+------------------------------------------------------------------+
#include "Basics\\Includes.mqh"

//+------------------------------------------------------------------+
//| Headers                                                          |
//+------------------------------------------------------------------+
#property copyright   "2021, GjoSe"
#property link        "http://www.gjo-se.com"
#property description "GjoSe Momentum"
#define   VERSION "1.0.0"
#property version VERSION
#property strict

int OnInit() {

   initializeEAAction();
   initializeArraysAction();
   initializeGlobalsAction();
   initializeIndicatorsAction();
   initializeTesterAction();

   return(0);
}


void OnTick() {

   if(session1530EndHour == 0 || isNewBarD1 == true) {
      session1530EndHour = InpEndHour;
      session1530EndMinute = InpEndMinute;
   }
   
   Bar.Update(Symbol(), Period());
   
   bool tradeOnlyOnTradingTime = checkTradeOnlyOnTradingTime(InpUseTimer, InpStartHour, InpStartMinute, session1530EndHour, session1530EndMinute, InpUseLocalTime);
   if(tradeOnlyOnTradingTime == true) {

      if(InpLong == true && getTriggerBuyInSignalState() == true) openBuyOrderAction();
      if(InpShort == true && getTriggerSellInSignalState() == true) openSellOrderAction();
      
   }

    ArraySetAsSeries(buyMomentumBuffer, true);
    CopyBuffer(buyMomentumHandle, BUY_MOMENTUM_BUFFER, 0, 10, buyMomentumBuffer);
   
}

void OnDeinit(const int reason) {

   Comment("");
   deInitializeTesterAction();
   Print(__FUNCTION__, " UninitializeReason() = ", getUninitReasonText(UninitializeReason()));
}

//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double  OnTester() {
   double   param = 0.0;

   if(CheckPointer(criterion_Ptr) != POINTER_INVALID) {
      param = criterion_Ptr.GetCriterion();
   }

   return(param);
}
//+------------------------------------------------------------------+
