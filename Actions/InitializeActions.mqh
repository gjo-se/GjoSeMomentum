//+------------------------------------------------------------------+
//|                                             InitializeAction.mqh |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

void initializeEAAction() {

   Trade.Deviation(InpMaxSlippage);
   Trade.MagicNumber(InpMagicNumber);

}
//+------------------------------------------------------------------+
void initializeGlobalsAction() {

   session1530EndHour = 0;
   session1530EndMinute = 0;

   //lastBuyOrderTime = 0;
   //lastSellOrderTime = 0;

}

void initializeArraysAction() {
   initializeArray(positionTickets, 100);
}

void initializeIndicatorsAction() {

   buyMomentumHandle = iCustom(Symbol(), Period(), "GjoSe\\GjoSeMomentum\\IND_GjoSeMomentum", InpMinMomentum);
   if(buyMomentumHandle == INVALID_HANDLE) Print("Expert: iCustom - buyMomentumHandle - call: Error code=",GetLastError());

    //SGL_MA.Init(Symbol(), InpSGL_MATimeframe, InpSGL_MAPeriod, InpSGL_MAShift, InpSGL_MAMethod, tickvolumeHandle);
}
//+------------------------------------------------------------------+
int initializeTesterAction(){

   criterion_Ptr = new TCustomCriterionArray();
   if(CheckPointer(criterion_Ptr) == POINTER_INVALID) {
      return(-1);
   }
   //criterion_Ptr.Add(new TSimpleCriterion( STAT_PROFIT ));
   //criterion_Ptr.Add(new TSimpleDivCriterion( STAT_EQUITY_DDREL_PERCENT ));

   criterion_Ptr.Add(new TTSSFCriterion());
   
   return(0);
}

void deInitializeTesterAction(){

   if(CheckPointer(criterion_Ptr) == POINTER_DYNAMIC) {
      delete(criterion_Ptr);
   }

}