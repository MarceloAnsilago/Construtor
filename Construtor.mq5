#property strict

#include "Construtor\\ConstrutorDialog.mqh"

CConstrutorDialog ExtDialog;

int OnInit()
  {
   if(!ExtDialog.Create(ChartID(),"ConstrutorUI",0,30,30,1030,700))
     {
      Print("Construtor: dialog create failed");
      return(INIT_SUCCEEDED);
     }
   if(!ExtDialog.Run())
     {
      Print("Construtor: dialog run failed");
      return(INIT_SUCCEEDED);
     }
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
