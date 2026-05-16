//+------------------------------------------------------------------+
//|                                                 AlphaForgeV3.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include "Runtime/RuntimeConfig.mqh"
#include "Theme/ChartTheme.mqh"
#include <Trade/Trade.mqh>

#import "shell32.dll"
int ShellExecuteW(int hwnd,string lpOperation,string lpFile,string lpParameters,string lpDirectory,int nShowCmd);
#import

input group "1.Estrategia"
input string InpNomeDaEstrategia = "Minha estrategia";
input long InpMagicNumber = 100000;

input group "2.Sinais"
input string InpModoDeOrdem = "Mercado";
input string InpModoDaOrdemLimite = "Referencia";
input string InpReferenciaDaOrdemLimite = "Maxima";
input string InpCandleDaReferenciaDaOrdemLimite = "Atual";
input bool InpMoverParaOProximoCandle = false;
input double InpDistanciaDaOrdemLimite = 0.0;
input string InpExpiracaoDaOrdemLimite = "Nao expirar";

input group "3.Risco e execucao"
input bool InpOperarNaCompra = true;
input bool InpOperarNaVenda = true;
input double InpVolumeInicial = 1.0;
input double InpSpreadMaximo = 10.0;

input group "4.Filtro"
input bool InpAtivarFiltro = false;
input bool InpMedirEmPercentual = false;
input ENUM_TIMEFRAMES InpTempoGraficoDoFiltro = PERIOD_CURRENT;
input double InpTamanhoMinimoDaVela = 0.0;
input double InpTamanhoMaximoDaVela = 0.0;
input double InpTamanhoMinimoDoCorpoDaVela = 0.0;
input double InpTamanhoMaximoDoCorpoDaVela = 0.0;
input double InpTamanhoMinimoPavioSuperior = 0.0;
input double InpTamanhoMaximoPavioSuperior = 0.0;
input double InpTamanhoMinimoPavioInferior = 0.0;
input double InpTamanhoMaximoPavioInferior = 0.0;

string BUTTON_CREATE_NAME   = "AlphaForgeV3.BtnCreateStrategy";
string PANEL_NAME           = "AlphaForgeV3.Panel";
string LOG_PANEL_NAME       = "AlphaForgeV3.LogPanel";
string LOG_LABEL_PREFIX     = "AlphaForgeV3.LogLabel.";
string SIGNAL_MARKER_PREFIX = "AlphaForgeV3.SignalMarker.";

string g_config_source = "Inputs/.set";
datetime g_last_signal_bar_time = 0;
CAlphaForgeChartTheme g_chart_theme;
CTrade g_trade;
SRuntimeConfig g_config;

#include "Runtime/RuntimeValidation.mqh"
#include "Runtime/RuntimeApply.mqh"

bool IsRunningInTester()
  {
   return((bool)MQLInfoInteger(MQL_TESTER));
  }

bool HasInteractiveChart()
  {
   return(!IsRunningInTester());
  }

bool CanDrawChartObjects()
  {
   return(ChartID()>0);
  }

string TimeframeToBridgeText(const ENUM_TIMEFRAMES timeframe)
  {
   switch(timeframe)
     {
      case PERIOD_CURRENT:
         return("Corrente");
      case PERIOD_M1:
         return("M1");
      case PERIOD_M2:
         return("M2");
      case PERIOD_M3:
         return("M3");
      case PERIOD_M4:
         return("M4");
      case PERIOD_M5:
         return("M5");
      case PERIOD_M6:
         return("M6");
      case PERIOD_M10:
         return("M10");
      case PERIOD_M12:
         return("M12");
      case PERIOD_M15:
         return("M15");
      case PERIOD_M30:
         return("M30");
      case PERIOD_H1:
         return("H1");
      case PERIOD_H2:
         return("H2");
      case PERIOD_H3:
         return("H3");
      case PERIOD_H4:
         return("H4");
      case PERIOD_H6:
         return("H6");
      case PERIOD_H8:
         return("H8");
      case PERIOD_H12:
         return("H12");
      case PERIOD_D1:
         return("D1");
      case PERIOD_W1:
         return("W1");
      case PERIOD_MN1:
         return("MN1");
     }

   return("Corrente");
  }

void ApplyInputFallbackConfig()
  {
   SyncRuntimeConfigFromInputs();
  }

string NormalizeText(const string value)
  {
   string text=value;
   StringTrimLeft(text);
   StringTrimRight(text);
   return(text);
  }

long ResolveMagicNumberValue()
  {
   if(g_config.magic_number>0)
      return(g_config.magic_number);
   return(InpMagicNumber);
  }

double ResolveInitialVolume()
  {
   if(g_config.risk.initial_volume>0.0)
      return(g_config.risk.initial_volume);
   return(1.0);
  }

double ResolveMaxSpreadPoints()
  {
   if(g_config.risk.max_spread>0.0)
      return(g_config.risk.max_spread);
   return(0.0);
  }

string ResolveMagicNumberText()
  {
   return(StringFormat("%I64d",ResolveMagicNumberValue()));
  }

string ResolveStrategyNameText()
  {
   if(g_config.strategy_name!="")
      return(g_config.strategy_name);
   return(InpNomeDaEstrategia);
  }

string BuildFrontendPath(const string entry_name)
  {
   string root_dir=TerminalInfoString(TERMINAL_DATA_PATH)+"\\MQL5\\Experts\\Advisors\\V3\\Frontend";
   if(entry_name=="")
      return(root_dir);

   return(root_dir+"\\"+entry_name);
  }

bool LaunchFrontendWith(const string executable,const string parameters,const string working_dir)
  {
   int result=ShellExecuteW(0,"open",executable,parameters,working_dir,1);
   return(result>32);
  }

void NotifyFrontendPending()
  {
   string frontend_dir=BuildFrontendPath("");
   string app_path=BuildFrontendPath("app.py");
   if(frontend_dir=="" || app_path=="")
     {
      Print("AlphaForge V3: nao foi possivel resolver o caminho do frontend.");
      return;
     }

   string app_argument="\""+app_path+"\"";
   if(LaunchFrontendWith("pythonw.exe",app_argument,frontend_dir))
     {
      Print("AlphaForge V3: frontend iniciado com pythonw.exe -> ",app_path);
      return;
     }

   if(LaunchFrontendWith("python.exe",app_argument,frontend_dir))
     {
      Print("AlphaForge V3: frontend iniciado com python.exe -> ",app_path);
      return;
     }

   if(LaunchFrontendWith("py.exe","-3 "+app_argument,frontend_dir))
     {
      Print("AlphaForge V3: frontend iniciado com py.exe -> ",app_path);
      return;
     }

   Print("AlphaForge V3: falha ao iniciar o frontend. Verifique Python e customtkinter instalados.");
  }

ENUM_TIMEFRAMES ResolveTimeframe(const string timeframe_text)
  {
   string text=NormalizeText(timeframe_text);

   if(text=="" || text=="Corrente")
      return((ENUM_TIMEFRAMES)Period());
   if(text=="M1")
      return(PERIOD_M1);
   if(text=="M2")
      return(PERIOD_M2);
   if(text=="M3")
      return(PERIOD_M3);
   if(text=="M4")
      return(PERIOD_M4);
   if(text=="M5")
      return(PERIOD_M5);
   if(text=="M6")
      return(PERIOD_M6);
   if(text=="M10")
      return(PERIOD_M10);
   if(text=="M12")
      return(PERIOD_M12);
   if(text=="M15")
      return(PERIOD_M15);
   if(text=="M30")
      return(PERIOD_M30);
   if(text=="H1")
      return(PERIOD_H1);
   if(text=="H2")
      return(PERIOD_H2);
   if(text=="H3")
      return(PERIOD_H3);
   if(text=="H4")
      return(PERIOD_H4);
   if(text=="H6")
      return(PERIOD_H6);
   if(text=="H8")
      return(PERIOD_H8);
   if(text=="H12")
      return(PERIOD_H12);
   if(text=="D1")
      return(PERIOD_D1);
   if(text=="W1")
      return(PERIOD_W1);
   if(text=="MN1")
      return(PERIOD_MN1);

   return((ENUM_TIMEFRAMES)Period());
  }

double ConvertDistanceToMetric(const double distance_price,const double reference_price,const string measure)
  {
   if(NormalizeText(measure)=="Percentual")
     {
      if(reference_price<=0.0)
         return(0.0);
      return((distance_price/reference_price)*100.0);
     }

   if(_Point<=0.0)
      return(0.0);
   return(distance_price/_Point);
  }

double NormalizeVolume(const double requested_volume)
  {
   double min_volume=SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MIN);
   double max_volume=SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MAX);
   double step=SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_STEP);

   if(step<=0.0)
      step=0.01;

   double volume=requested_volume;
   if(volume<min_volume)
      volume=min_volume;
   if(max_volume>0.0 && volume>max_volume)
      volume=max_volume;

   volume=MathRound(volume/step)*step;
   if(volume<min_volume)
      volume=min_volume;
   if(max_volume>0.0 && volume>max_volume)
      volume=max_volume;

   return(NormalizeDouble(volume,8));
  }

bool HasOpenPositionForSymbol()
  {
   return(PositionSelect(_Symbol));
  }

bool HasPendingOrderForSymbol()
  {
   long magic_number=ResolveMagicNumberValue();
   int total=OrdersTotal();
   for(int index=0;index<total;index++)
     {
      ulong ticket=OrderGetTicket(index);
      if(ticket==0 || !OrderSelect(ticket))
         continue;

      if(OrderGetString(ORDER_SYMBOL)!=_Symbol)
         continue;
      if((long)OrderGetInteger(ORDER_MAGIC)!=magic_number)
         continue;

      ENUM_ORDER_TYPE type=(ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE);
      if(type==ORDER_TYPE_BUY_LIMIT || type==ORDER_TYPE_SELL_LIMIT)
         return(true);
     }

   return(false);
  }

bool FindPendingLimitOrderForSymbol(
   ulong &ticket,
   ENUM_ORDER_TYPE &type,
   datetime &expiration,
   ENUM_ORDER_TYPE_TIME &order_time,
   double &price
)
  {
   long magic_number=ResolveMagicNumberValue();
   int total=OrdersTotal();
   for(int index=0;index<total;index++)
     {
      ulong current_ticket=OrderGetTicket(index);
      if(current_ticket==0 || !OrderSelect(current_ticket))
         continue;

      if(OrderGetString(ORDER_SYMBOL)!=_Symbol)
         continue;
      if((long)OrderGetInteger(ORDER_MAGIC)!=magic_number)
         continue;

      ENUM_ORDER_TYPE current_type=(ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE);
      if(current_type!=ORDER_TYPE_BUY_LIMIT && current_type!=ORDER_TYPE_SELL_LIMIT)
         continue;

      ticket=current_ticket;
      type=current_type;
      expiration=(datetime)OrderGetInteger(ORDER_TIME_EXPIRATION);
      order_time=(ENUM_ORDER_TYPE_TIME)OrderGetInteger(ORDER_TYPE_TIME);
      price=OrderGetDouble(ORDER_PRICE_OPEN);
      return(true);
     }

   return(false);
  }

bool IsCurrentSpreadAllowed()
  {
   double max_spread=ResolveMaxSpreadPoints();
   if(max_spread<=0.0)
      return(true);

   MqlTick tick;
   if(!SymbolInfoTick(_Symbol,tick))
      return(false);

   double spread_points=(tick.ask-tick.bid)/_Point;
   return(spread_points<=max_spread);
  }

bool IsNewSignalBar(const ENUM_TIMEFRAMES timeframe)
  {
   datetime current_bar_time=iTime(_Symbol,timeframe,0);
   if(current_bar_time<=0)
      return(false);

   if(g_last_signal_bar_time==current_bar_time)
      return(false);

   g_last_signal_bar_time=current_bar_time;
   return(true);
  }

bool ReadClosedSignalBar(const ENUM_TIMEFRAMES timeframe,MqlRates &signal_bar)
  {
   MqlRates rates[];
   ArraySetAsSeries(rates,true);
   int copied=CopyRates(_Symbol,timeframe,0,3,rates);
   if(copied<2)
      return(false);

   signal_bar=rates[1];
  return(true);
  }

bool ReadSignalBarAtShift(const ENUM_TIMEFRAMES timeframe,const int shift,MqlRates &signal_bar)
  {
   if(shift<0)
      return(false);

   MqlRates rates[];
   ArraySetAsSeries(rates,true);
   int copied=CopyRates(_Symbol,timeframe,shift,1,rates);
   if(copied<1)
      return(false);

   signal_bar=rates[0];
   return(true);
  }

void DrawSignalMarker(const int direction,const ENUM_TIMEFRAMES timeframe,const MqlRates &signal_bar)
  {
   if(direction==0 || !CanDrawChartObjects())
      return;

   string marker_name=SIGNAL_MARKER_PREFIX+IntegerToString((int)timeframe)+"."+IntegerToString((int)signal_bar.time)+"."+(direction>0 ? "BUY" : "SELL");
   if(ObjectFind(0,marker_name)>=0)
      return;

   double anchor_price=direction>0 ? signal_bar.low-(12.0*_Point) : signal_bar.high+(12.0*_Point);

   if(!ObjectCreate(0,marker_name,OBJ_TEXT,0,signal_bar.time,anchor_price))
      return;

   uchar marker_code=(uchar)(direction>0 ? 233 : 234);
   ObjectSetString(0,marker_name,OBJPROP_FONT,"Wingdings");
   ObjectSetString(0,marker_name,OBJPROP_TEXT,CharToString(marker_code));
   ObjectSetInteger(0,marker_name,OBJPROP_FONTSIZE,16);
   ObjectSetInteger(0,marker_name,OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,marker_name,OBJPROP_COLOR,clrYellow);
   ObjectSetInteger(0,marker_name,OBJPROP_BACK,false);
   ObjectSetInteger(0,marker_name,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,marker_name,OBJPROP_HIDDEN,false);
   ChartRedraw();
  }

void DestroySignalMarkers()
  {
   int total=ObjectsTotal(0);
   for(int index=total-1;index>=0;index--)
     {
      string name=ObjectName(0,index);
      if(StringFind(name,SIGNAL_MARKER_PREFIX)==0)
         ObjectDelete(0,name);
     }
  }

bool PassesNumericFilter(const double metric_value,const double min_value,const double max_value)
  {
   if(min_value>0.0 && metric_value<min_value)
      return(false);
   if(max_value>0.0 && metric_value>max_value)
      return(false);
   return(true);
  }

bool EvaluateSignalFilter(const MqlRates &signal_bar)
  {
   double candle_size_price=signal_bar.high-signal_bar.low;
   double candle_body_price=MathAbs(signal_bar.close-signal_bar.open);
   double upper_wick_price=signal_bar.high-MathMax(signal_bar.open,signal_bar.close);
   double lower_wick_price=MathMin(signal_bar.open,signal_bar.close)-signal_bar.low;
   if(upper_wick_price<0.0)
      upper_wick_price=0.0;
   if(lower_wick_price<0.0)
      lower_wick_price=0.0;

   double reference_price=signal_bar.open;
   if(reference_price<=0.0)
      reference_price=signal_bar.close;
   if(reference_price<=0.0)
      return(false);

   double candle_metric=ConvertDistanceToMetric(candle_size_price,reference_price,g_config.signals.filter.measure);
   double body_metric=ConvertDistanceToMetric(candle_body_price,reference_price,g_config.signals.filter.measure);
   double upper_wick_metric=ConvertDistanceToMetric(upper_wick_price,reference_price,g_config.signals.filter.measure);
   double lower_wick_metric=ConvertDistanceToMetric(lower_wick_price,reference_price,g_config.signals.filter.measure);

   if(!PassesNumericFilter(candle_metric,g_config.signals.filter.candle_min,g_config.signals.filter.candle_max))
      return(false);
   if(!PassesNumericFilter(body_metric,g_config.signals.filter.body_min,g_config.signals.filter.body_max))
      return(false);
   if(!PassesNumericFilter(upper_wick_metric,g_config.signals.filter.upper_wick_min,g_config.signals.filter.upper_wick_max))
      return(false);
   if(!PassesNumericFilter(lower_wick_metric,g_config.signals.filter.lower_wick_min,g_config.signals.filter.lower_wick_max))
      return(false);

   return(true);
  }

int ResolveSignalDirection(const MqlRates &signal_bar)
  {
   if(signal_bar.close>signal_bar.open)
      return(1);
   if(signal_bar.close<signal_bar.open)
      return(-1);
  return(0);
  }

int ResolveReferenceBarShift(const string candle_name)
  {
   string value=NormalizeText(candle_name);
   if(value=="Ultimo")
      return(1);
   if(value=="Penultimo")
      return(2);
   if(value=="Antepenultimo")
      return(3);
   return(0);
  }

double ResolveReferencePrice(const MqlRates &reference_bar,const string reference_name)
  {
   string value=NormalizeText(reference_name);
   if(value=="Minima")
      return(reference_bar.low);
   if(value=="Abertura")
      return(reference_bar.open);
   if(value=="Fechamento")
      return(reference_bar.close);
   return(reference_bar.high);
  }

int ResolveExpirationCandles(const string expire_name)
  {
   string value=NormalizeText(expire_name);
   if(value=="1 candle")
      return(1);
   if(value=="2 candles")
      return(2);
   if(value=="3 candles")
      return(3);
   if(value=="4 candles")
      return(4);
   return(0);
  }

datetime ResolvePendingExpiration(const ENUM_TIMEFRAMES timeframe,const string expire_name)
  {
   int candles=ResolveExpirationCandles(expire_name);
   if(candles<=0)
      return(0);

   int seconds=PeriodSeconds(timeframe);
   if(seconds<=0)
      return(0);

   return(TimeCurrent()+(datetime)(candles*seconds));
  }

int ResolvePendingMoveReferenceBarShift(const string candle_name)
  {
   int shift=ResolveReferenceBarShift(candle_name);
   if(shift<=0)
      return(1);
   return(shift);
  }

void UpdateLimitReferencePendingOrder(const ENUM_TIMEFRAMES timeframe)
  {
   if(NormalizeText(g_config.signals.order_mode)!="Limite")
      return;
   if(NormalizeText(g_config.signals.limit.mode)!="Referencia")
      return;
   if(!g_config.signals.limit.reference.move_next_candle)
      return;
   if(HasOpenPositionForSymbol())
      return;

   ulong ticket=0;
   ENUM_ORDER_TYPE order_type=WRONG_VALUE;
   datetime expiration=0;
   ENUM_ORDER_TYPE_TIME order_time=ORDER_TIME_GTC;
   double current_price=0.0;
   if(!FindPendingLimitOrderForSymbol(ticket,order_type,expiration,order_time,current_price))
      return;

   MqlTick tick;
   if(!SymbolInfoTick(_Symbol,tick))
     {
      Print("AlphaForge V3: falha ao capturar tick para mover ordem limite.");
      return;
     }

   MqlRates reference_bar;
   int reference_shift=ResolvePendingMoveReferenceBarShift(g_config.signals.limit.reference.candle);
   if(!ReadSignalBarAtShift(timeframe,reference_shift,reference_bar))
     {
      Print("AlphaForge V3: nao foi possivel ler a vela para mover a ordem limite por referencia.");
      return;
     }

   double reference_price=ResolveReferencePrice(reference_bar,g_config.signals.limit.reference.base);
   double price_offset=g_config.signals.limit.reference.distance*_Point;
   double updated_price=(order_type==ORDER_TYPE_BUY_LIMIT) ? reference_price-price_offset : reference_price+price_offset;
   updated_price=NormalizeDouble(updated_price,_Digits);

   if(updated_price<=0.0)
      return;

   if(MathAbs(updated_price-current_price)<=(_Point/2.0))
      return;

   if(order_type==ORDER_TYPE_BUY_LIMIT && updated_price>=tick.ask)
     {
      Print("AlphaForge V3: mover Buy Limit ignorado; preco recalculado ficou acima/igual ao ask. Ticket=",ticket);
      return;
     }

   if(order_type==ORDER_TYPE_SELL_LIMIT && updated_price<=tick.bid)
     {
      Print("AlphaForge V3: mover Sell Limit ignorado; preco recalculado ficou abaixo/igual ao bid. Ticket=",ticket);
      return;
     }

   g_trade.SetExpertMagicNumber(ResolveMagicNumberValue());
   g_trade.SetTypeFillingBySymbol(_Symbol);
   g_trade.SetDeviationInPoints(20);

   if(!g_trade.OrderModify(ticket,updated_price,0.0,0.0,order_time,expiration))
     {
      Print(
         "AlphaForge V3: falha ao mover ordem limite por referencia. Ticket=",ticket,
         " Retcode=",g_trade.ResultRetcode(),
         " Desc=",g_trade.ResultRetcodeDescription()
      );
      return;
     }

   Print(
      "AlphaForge V3: ordem limite movida para o proximo candle. Ticket=",ticket,
      " NovoPreco=",DoubleToString(updated_price,_Digits),
      " Base=",g_config.signals.limit.reference.base,
      " Candle=",g_config.signals.limit.reference.candle
   );
  }

bool SubmitMarketOrder(const int direction,const ENUM_TIMEFRAMES timeframe,const MqlRates &signal_bar)
  {
   if(direction==0)
     {
      Print("AlphaForge V3: vela neutra; nenhuma ordem enviada.");
      return(false);
     }

   if(direction>0 && !g_config.risk.allow_buy)
     {
      Print("AlphaForge V3: compra bloqueada pela configuracao atual.");
      return(false);
     }

   if(direction<0 && !g_config.risk.allow_sell)
     {
      Print("AlphaForge V3: venda bloqueada pela configuracao atual.");
      return(false);
     }

   if(HasOpenPositionForSymbol())
     {
      Print("AlphaForge V3: existe posicao aberta no simbolo; nova entrada ignorada.");
      return(false);
     }

   if(!IsCurrentSpreadAllowed())
     {
      Print("AlphaForge V3: spread atual acima do maximo configurado.");
      return(false);
     }

   MqlTick tick;
   if(!SymbolInfoTick(_Symbol,tick))
     {
      Print("AlphaForge V3: falha ao capturar tick para envio da ordem.");
      return(false);
     }

   double volume=NormalizeVolume(ResolveInitialVolume());
   if(volume<=0.0)
     {
      Print("AlphaForge V3: volume invalido para envio da ordem.");
      return(false);
     }

   g_trade.SetExpertMagicNumber(ResolveMagicNumberValue());
   g_trade.SetTypeFillingBySymbol(_Symbol);
   g_trade.SetDeviationInPoints(20);

   string comment=StringFormat(
      "AlphaForgeV3 %s tf=%d candle=%s",
      direction>0 ? "BUY" : "SELL",
      (int)timeframe,
      TimeToString(signal_bar.time,TIME_DATE|TIME_MINUTES)
   );

   bool sent=false;
   if(direction>0)
      sent=g_trade.Buy(volume,_Symbol,0.0,0.0,0.0,comment);
   else
      sent=g_trade.Sell(volume,_Symbol,0.0,0.0,0.0,comment);

   if(!sent)
     {
      Print("AlphaForge V3: falha ao enviar ordem. Retcode=",g_trade.ResultRetcode()," Desc=",g_trade.ResultRetcodeDescription());
      return(false);
     }

  Print("AlphaForge V3: ordem a mercado enviada com sucesso. Ticket=",g_trade.ResultOrder()," Volume=",DoubleToString(volume,2));
  return(true);
  }

bool SubmitLimitReferenceOrder(const int direction,const ENUM_TIMEFRAMES timeframe,const MqlRates &signal_bar)
  {
   if(direction==0)
     {
      Print("AlphaForge V3: vela neutra; nenhuma ordem limite enviada.");
      return(false);
     }

   if(NormalizeText(g_config.signals.limit.mode)!="Referencia")
     {
      Print("AlphaForge V3: modo de ordem limite ainda nao suportado: ",g_config.signals.limit.mode);
      return(false);
     }

   if(direction>0 && !g_config.risk.allow_buy)
     {
      Print("AlphaForge V3: compra limite bloqueada pela configuracao atual.");
      return(false);
     }

   if(direction<0 && !g_config.risk.allow_sell)
     {
      Print("AlphaForge V3: venda limite bloqueada pela configuracao atual.");
      return(false);
     }

   if(HasOpenPositionForSymbol())
     {
      Print("AlphaForge V3: existe posicao aberta no simbolo; ordem limite ignorada.");
      return(false);
     }

   if(HasPendingOrderForSymbol())
     {
      Print("AlphaForge V3: ja existe ordem pendente no simbolo para este magic number.");
      return(false);
     }

   if(!IsCurrentSpreadAllowed())
     {
      Print("AlphaForge V3: spread atual acima do maximo configurado.");
      return(false);
     }

   MqlTick tick;
   if(!SymbolInfoTick(_Symbol,tick))
     {
      Print("AlphaForge V3: falha ao capturar tick para ordem limite.");
      return(false);
     }

   MqlRates reference_bar;
   int reference_shift=ResolveReferenceBarShift(g_config.signals.limit.reference.candle);
   if(!ReadSignalBarAtShift(timeframe,reference_shift,reference_bar))
     {
      Print("AlphaForge V3: nao foi possivel ler a vela de referencia da ordem limite.");
      return(false);
     }

   double reference_price=ResolveReferencePrice(reference_bar,g_config.signals.limit.reference.base);
   double price_offset=g_config.signals.limit.reference.distance*_Point;
   double pending_price=direction>0 ? reference_price-price_offset : reference_price+price_offset;
   pending_price=NormalizeDouble(pending_price,_Digits);

   if(pending_price<=0.0)
     {
      Print("AlphaForge V3: preco calculado para ordem limite e invalido.");
      return(false);
     }

   if(direction>0 && pending_price>=tick.ask)
     {
      Print("AlphaForge V3: preco de Buy Limit precisa ficar abaixo do ask atual. Preco=",DoubleToString(pending_price,_Digits)," Ask=",DoubleToString(tick.ask,_Digits));
      return(false);
     }

   if(direction<0 && pending_price<=tick.bid)
     {
      Print("AlphaForge V3: preco de Sell Limit precisa ficar acima do bid atual. Preco=",DoubleToString(pending_price,_Digits)," Bid=",DoubleToString(tick.bid,_Digits));
      return(false);
     }

   double volume=NormalizeVolume(ResolveInitialVolume());
   if(volume<=0.0)
     {
      Print("AlphaForge V3: volume invalido para ordem limite.");
      return(false);
     }

   g_trade.SetExpertMagicNumber(ResolveMagicNumberValue());
   g_trade.SetTypeFillingBySymbol(_Symbol);
   g_trade.SetDeviationInPoints(20);

   ENUM_ORDER_TYPE_TIME order_time=ORDER_TIME_GTC;
   datetime expiration=ResolvePendingExpiration(timeframe,g_config.signals.limit.reference.expire);
   if(expiration>0)
      order_time=ORDER_TIME_SPECIFIED;

   string comment=StringFormat(
      "AlphaForgeV3 LIMIT %s tf=%d candle=%s",
      direction>0 ? "BUY" : "SELL",
      (int)timeframe,
      TimeToString(signal_bar.time,TIME_DATE|TIME_MINUTES)
   );

   bool sent=false;
   if(direction>0)
      sent=g_trade.BuyLimit(volume,pending_price,_Symbol,0.0,0.0,order_time,expiration,comment);
   else
      sent=g_trade.SellLimit(volume,pending_price,_Symbol,0.0,0.0,order_time,expiration,comment);

   if(!sent)
     {
      Print("AlphaForge V3: falha ao enviar ordem limite. Retcode=",g_trade.ResultRetcode()," Desc=",g_trade.ResultRetcodeDescription());
      return(false);
     }

   Print(
      "AlphaForge V3: ordem limite por referencia enviada. Ticket=",g_trade.ResultOrder(),
      " Preco=",DoubleToString(pending_price,_Digits),
      " Base=",g_config.signals.limit.reference.base,
      " Candle=",g_config.signals.limit.reference.candle,
      " Dist=",DoubleToString(g_config.signals.limit.reference.distance,2)
   );
   return(true);
  }

void EvaluateAndTrade()
  {
   if(!g_config.signals.filter.enabled)
      return;

   ENUM_TIMEFRAMES timeframe=g_config.signals.filter.timeframe;
   if(!IsNewSignalBar(timeframe))
      return;

   UpdateLimitReferencePendingOrder(timeframe);

   MqlRates signal_bar;
   if(!ReadClosedSignalBar(timeframe,signal_bar))
     {
      Print("AlphaForge V3: nao foi possivel ler a vela fechada do filtro.");
      return;
     }

   if(!EvaluateSignalFilter(signal_bar))
      return;

   int direction=ResolveSignalDirection(signal_bar);
   DrawSignalMarker(direction,timeframe,signal_bar);
   string order_mode=NormalizeText(g_config.signals.order_mode);
   if(order_mode=="Mercado")
     {
      SubmitMarketOrder(direction,timeframe,signal_bar);
      return;
     }

   if(order_mode=="Limite")
     {
      SubmitLimitReferenceOrder(direction,timeframe,signal_bar);
      return;
     }
  }

bool CreateLogOverlay()
  {
   if(ObjectFind(0,LOG_PANEL_NAME)<0)
     {
      if(!ObjectCreate(0,LOG_PANEL_NAME,OBJ_RECTANGLE_LABEL,0,0,0))
         return(false);
     }

   ObjectSetInteger(0,LOG_PANEL_NAME,OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,LOG_PANEL_NAME,OBJPROP_XDISTANCE,18);
   ObjectSetInteger(0,LOG_PANEL_NAME,OBJPROP_YDISTANCE,86);
   ObjectSetInteger(0,LOG_PANEL_NAME,OBJPROP_XSIZE,458);
   ObjectSetInteger(0,LOG_PANEL_NAME,OBJPROP_YSIZE,56);
   ObjectSetInteger(0,LOG_PANEL_NAME,OBJPROP_BGCOLOR,C'18,27,42');
   ObjectSetInteger(0,LOG_PANEL_NAME,OBJPROP_BORDER_COLOR,C'50,70,100');
   ObjectSetInteger(0,LOG_PANEL_NAME,OBJPROP_COLOR,C'50,70,100');
   ObjectSetInteger(0,LOG_PANEL_NAME,OBJPROP_BACK,false);
   ObjectSetInteger(0,LOG_PANEL_NAME,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,LOG_PANEL_NAME,OBJPROP_HIDDEN,true);

   string names[3]=
     {
      LOG_LABEL_PREFIX+"0",
      LOG_LABEL_PREFIX+"1",
      LOG_LABEL_PREFIX+"2"
     };
   int y_positions[3]={94,110,126};

   for(int i=0;i<3;i++)
     {
      if(ObjectFind(0,names[i])<0)
        {
         if(!ObjectCreate(0,names[i],OBJ_LABEL,0,0,0))
            return(false);
        }

      ObjectSetInteger(0,names[i],OBJPROP_CORNER,CORNER_LEFT_UPPER);
      ObjectSetInteger(0,names[i],OBJPROP_XDISTANCE,26);
      ObjectSetInteger(0,names[i],OBJPROP_YDISTANCE,y_positions[i]);
      ObjectSetInteger(0,names[i],OBJPROP_FONTSIZE,8);
      ObjectSetInteger(0,names[i],OBJPROP_COLOR,C'210,220,235');
      ObjectSetInteger(0,names[i],OBJPROP_SELECTABLE,false);
      ObjectSetInteger(0,names[i],OBJPROP_HIDDEN,true);
      ObjectSetString(0,names[i],OBJPROP_FONT,"Consolas");
     }
   return(true);
  }

void RefreshBridgeOverlay()
  {
   CreateLogOverlay();
   ObjectSetString(0,LOG_LABEL_PREFIX+"0",OBJPROP_TEXT,"AlphaForge V3 | Origem: "+g_config_source);
   ObjectSetString(0,LOG_LABEL_PREFIX+"1",OBJPROP_TEXT,"Strategy: "+ResolveStrategyNameText()+" | Magic: "+ResolveMagicNumberText());
   ObjectSetString(0,LOG_LABEL_PREFIX+"2",OBJPROP_TEXT,"Ordem: "+g_config.signals.order_mode+" / "+g_config.signals.limit.mode+" | Filtro: "+(g_config.signals.filter.enabled ? "Sim" : "Nao")+" | TF: "+g_config.signals.filter.timeframe_label+" | Medida: "+g_config.signals.filter.measure);
   ChartRedraw();
  }

bool CreateButtonObject(const string name,const string text,const int x,const int y,const int width,const color back_color)
  {
   if(ObjectFind(0,name)<0)
     {
      if(!ObjectCreate(0,name,OBJ_BUTTON,0,0,0))
         return(false);
     }

   ObjectSetInteger(0,name,OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,34);
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,10);
   ObjectSetInteger(0,name,OBJPROP_COLOR,C'210,220,235');
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,back_color);
   ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,C'50,70,100');
   ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,true);
   ObjectSetString(0,name,OBJPROP_TEXT,text);
   return(true);
  }

bool CreateBackgroundPanel()
  {
   if(ObjectFind(0,PANEL_NAME)<0)
     {
      if(!ObjectCreate(0,PANEL_NAME,OBJ_RECTANGLE_LABEL,0,0,0))
         return(false);
     }

   ObjectSetInteger(0,PANEL_NAME,OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,PANEL_NAME,OBJPROP_XDISTANCE,18);
   ObjectSetInteger(0,PANEL_NAME,OBJPROP_YDISTANCE,18);
   ObjectSetInteger(0,PANEL_NAME,OBJPROP_XSIZE,458);
   ObjectSetInteger(0,PANEL_NAME,OBJPROP_YSIZE,56);
   ObjectSetInteger(0,PANEL_NAME,OBJPROP_BGCOLOR,C'24,36,58');
   ObjectSetInteger(0,PANEL_NAME,OBJPROP_BORDER_COLOR,C'50,70,100');
   ObjectSetInteger(0,PANEL_NAME,OBJPROP_COLOR,C'50,70,100');
   ObjectSetInteger(0,PANEL_NAME,OBJPROP_BACK,false);
   ObjectSetInteger(0,PANEL_NAME,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,PANEL_NAME,OBJPROP_HIDDEN,true);
   return(true);
  }

bool CreateControlPanel()
  {
   if(!CreateBackgroundPanel())
      return(false);
   if(!CreateButtonObject(BUTTON_CREATE_NAME,"Criar Estrategia",28,29,432,C'45,110,255'))
      return(false);

   ChartRedraw();
   return(true);
  }

void DestroyControlPanel()
  {
   ObjectDelete(0,BUTTON_CREATE_NAME);
   ObjectDelete(0,PANEL_NAME);
   ObjectDelete(0,LOG_PANEL_NAME);
   ObjectDelete(0,LOG_LABEL_PREFIX+"0");
   ObjectDelete(0,LOG_LABEL_PREFIX+"1");
   ObjectDelete(0,LOG_LABEL_PREFIX+"2");
   DestroySignalMarkers();
  }
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   g_chart_theme.SetChartId(ChartID());
   ApplyInputFallbackConfig();
   Print("AlphaForge V3: configuracao carregada pelos inputs/.set do MT5.");

   if(!HasInteractiveChart())
      return(INIT_SUCCEEDED);

   if(!g_chart_theme.SaveCurrentTheme())
     {
      Print("AlphaForge V3: falha ao salvar o tema original do grafico.");
      return(INIT_FAILED);
     }

   if(!g_chart_theme.ApplyAlphaForgeTheme())
     {
      Print("AlphaForge V3: falha ao aplicar o tema visual.");
      g_chart_theme.RestoreTheme();
      return(INIT_FAILED);
     }

   if(!CreateControlPanel())
     {
      Print("AlphaForge V3: falha ao criar o painel inicial.");
      g_chart_theme.RestoreTheme();
      return(INIT_FAILED);
     }

   if(!CreateLogOverlay())
     {
      Print("AlphaForge V3: falha ao criar painel de logs.");
      DestroyControlPanel();
      g_chart_theme.RestoreTheme();
      return(INIT_FAILED);
     }

   RefreshBridgeOverlay();

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   if(HasInteractiveChart())
     {
      DestroyControlPanel();
     }
   if(HasInteractiveChart())
      g_chart_theme.RestoreTheme();
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   EvaluateAndTrade();
  }
//+------------------------------------------------------------------+
//| Chart event                                                      |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
   if(!HasInteractiveChart())
      return;

   if(id==CHARTEVENT_CHART_CHANGE)
     {
      g_chart_theme.RefreshThemeDecorations();
      CreateControlPanel();
      CreateLogOverlay();
      RefreshBridgeOverlay();
      return;
     }

   if(id!=CHARTEVENT_OBJECT_CLICK)
      return;

   if(sparam==BUTTON_CREATE_NAME)
     {
      NotifyFrontendPending();
      return;
     }
  }
