//+------------------------------------------------------------------+
//|                                                       Inputs.mqh |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Inputs                                                           |
//+------------------------------------------------------------------+
sinput string              Basics;    // ---------- Basics ---------
input long                 InpMagicNumber = 1623984369100;
input string               InpComment = "Momentum";
input bool                 InpLong = true;
input bool                 InpShort = false;
input long                 InpMaxSlippage = 10;

sinput string              SL;    // ---------- SL & TP ---------
input int                  InpBuyStopLoss = 60;
input int                  InpBuyTakeProfit = 200;
input int                  InpSellStopLoss = 10;
input int                  InpSellTakeProfit = 100;

sinput string              TS;    // ---------- Trailing Stop ---------
input bool                 InpUseTrailingStop = true;
input int                  InpTrailingStop = 60;
input int                  InpMinimumProfit = 10;
input int                  InpStep = 10;

sinput string              BE;    // ---------- Break Even ---------
input bool                 InpUseBreakEven = true;
input int                  InpBreakEvenProfit = 30;
input int                  InpLockProfit = 10;

//sinput string              CLOSE;    // ---------- Close On CandleLow ---------
//input bool                 InpUseCloseOnCandleLow = true;

sinput string              MM;    // ---------- MoneyManagement ---------
input bool                 InpUseMoneyManagement = true;
input double               InpLotsPerEquity = 1.0;
input double               InpFixedVolume = 0;

sinput string              TI;    // ---------- Timer ---------
input bool                 InpUseTimer = true;
input int                  InpStartHour = 15;
input int                  InpStartMinute = 15;
input int                  InpEndHour = 15;
input int                  InpEndMinute = 45;
input bool                 InpUseLocalTime = false;

sinput string              SEC;    // ---------- Security ---------
input double               InpMaxAbsoluteEquity = 1000;
input double               InpMaxEquityDD_Out = 20;
input double               InpMaxEquityDD_OutAndStop = 30;

sinput string              MOM;    // ---------- Momentum-Filter ---------
input double               InpMinMomentum = 20;
input double               InpMomentumAVGMinMulti = 1;
input double               InpMomentumAVGSpeedMulti = 8;
input int                  InpMomentumMinToHighestHigh = 20;
input int                  InpMomentumMaxToLowestLow = 150;