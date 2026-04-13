#property strict

#include "Construtor\\ConstrutorDialog.mqh"

CConstrutorDialog ExtDialog;

int OnInit()
  {
   if(!ExtDialog.Create(ChartID(),"ConstrutorUI",0,30,30,1030,700))
      return(INIT_FAILED);
   if(!ExtDialog.Run())
      return(INIT_FAILED);
   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason)
  {
   ExtDialog.Destroy(reason);
  }

void OnTick()
  {
  }

void OnChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
   ExtDialog.ChartEvent(id,lparam,dparam,sparam);
  }
