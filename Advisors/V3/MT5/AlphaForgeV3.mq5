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

input group "1.1 Estrategia"
input string InpNomeDaEstrategia = "Minha estrategia";
input long InpMagicNumber = 100000;

input group "2.1 Tipo de ordens"
input ESignalOrderMode InpModoDeOrdem = ModoOrdemMercado;
input ESignalLimitMode InpModoDaOrdemLimite = ModoLimiteReferencia;
input ESignalLimitReferenceBase InpReferenciaDaOrdemLimite = BaseMaxima;
input ESignalLimitReferenceCandle InpCandleDaReferenciaDaOrdemLimite = CandleAtual;
input bool InpMoverParaOProximoCandle = false;
input double InpDistanciaDaOrdemLimite = 0.0;
input ESignalLimitExpiration InpExpiracaoDaOrdemLimite = NaoExpirar;

input group "3.1 Risco e execucao"
input bool InpOperarNaCompra = true;
input bool InpOperarNaVenda = true;
input double InpVolumeInicial = 1.0;
input double InpSpreadMaximo = 10.0;

input group "4.1 Filtro"
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

input group "4.2 Canais de bandas"
input bool InpUsarCanaisDeBandas = false;
input string InpIndicadorDosCanais = "Bandas de Bollinger";
input string InpSinalDosCanais = "Fechou fora";
input int InpPeriodoDosCanais = 20;
input double InpDesvioDosCanais = 2.0;
input int InpDeslocamentoDosCanais = 0;
input string InpModoDePrecoDosCanais = "Fechamento";

input group "5.1 Stop loss (fixo)"
input bool InpUsarStopLossFixo = false;
input bool InpTipoDeStopLossPercentual = false;
input double InpDistanciaDoStopLossFixo = 100.0;

input group "5.2 Stop loss (referencia)"
input bool InpUsarStopLossPorReferencia = false;
input ESignalLimitReferenceBase InpReferenciaDoStopLoss = BaseMaxima;
input ESignalLimitReferenceCandle InpCandleDaReferenciaDoStopLoss = CandleAtual;
input double InpDistanciaDoStopLossPorReferencia = 0.0;

input group "5.3 Stop loss (media)"
input bool InpUsarStopLossPorMedia = false;
input int InpQuantidadeDeCandlesDaMediaStopLoss = 3;
input ESignalLimitReferenceBase InpReferenciaDaMediaStopLoss = BaseMaxima;
input double InpDistanciaDoStopLossPorMedia = 0.0;

input group "5.4 Stop loss (max/min)"
input bool InpUsarStopLossPorMaxMin = false;
input EStopLossMaxMinExtreme InpExtremoDoStopLossPorMaxMin = StopLossMaior;
input int InpQuantidadeDeCandlesDoStopLossPorMaxMin = 3;
input ESignalLimitReferenceBase InpReferenciaDoStopLossPorMaxMin = BaseMaxima;

input group "5.5 Stop loss (multiplicador)"
input bool InpUsarStopLossMultiplicador = false;
input EStopLossMultiplierBase InpBaseDoStopLossMultiplicador = StopLossMultiplicadorCorpo;
input ESignalLimitReferenceCandle InpCandleDoStopLossMultiplicador = CandlePenultimo;
input double InpValorDoStopLossMultiplicador = 1.0;

input group "6.1 Take profit (fixo)"
input bool InpUsarTakeProfitFixo = false;
input bool InpTipoDeTakeProfitPercentual = false;
input ETakeProfitFixedMode InpModoDoTakeProfitFixo = TakeProfitDistancia;
input double InpDistanciaDoTakeProfitFixo = 100.0;
input double InpMultiplicadorDoTakeProfitFixo = 1.0;

input group "6.2 Take profit (multiplicador)"
input bool InpUsarTakeProfitMultiplicador = false;
input EStopLossMultiplierBase InpBaseDoTakeProfitMultiplicador = StopLossMultiplicadorCorpo;
input ESignalLimitReferenceCandle InpCandleDoTakeProfitMultiplicador = CandlePenultimo;
input double InpValorDoTakeProfitMultiplicador = 1.0;

string BUTTON_CREATE_NAME   = "AlphaForgeV3.BtnCreateStrategy";
string BUTTON_CARD_NAME     = "AlphaForgeV3.BtnCard";
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

bool IsPercentMeasure(const string measure)
  {
   string normalized=NormalizeText(measure);
   StringToLower(normalized);
   return(normalized=="percentual");
  }

string OrderModeToText(const ESignalOrderMode mode)
  {
   if(mode==ModoOrdemLimite)
      return("Limite");
   return("Mercado");
  }

string LimitModeToText(const ESignalLimitMode mode)
  {
   if(mode==ModoLimiteMedia)
      return("Media");
   return("Referencia");
  }

string ReferenceBaseToText(const ESignalLimitReferenceBase reference_base)
  {
   if(reference_base==BaseMinima)
      return("Minima");
   if(reference_base==BaseAbertura)
      return("Abertura");
   if(reference_base==BaseFechamento)
      return("Fechamento");
   return("Maxima");
  }

string ReferenceCandleToText(const ESignalLimitReferenceCandle candle)
  {
   if(candle==CandleUltimo)
      return("Ultimo");
   if(candle==CandlePenultimo)
      return("Penultimo");
   if(candle==CandleAntepenultimo)
      return("Antepenultimo");
   return("Atual");
  }

string ExpirationToText(const ESignalLimitExpiration expiration)
  {
   if(expiration==Expirar1Candle)
      return("1 candle");
   if(expiration==Expirar2Candles)
      return("2 candles");
   if(expiration==Expirar3Candles)
      return("3 candles");
   if(expiration==Expirar4Candles)
      return("4 candles");
   return("Nao expirar");
  }

string StopLossExtremeToText(const EStopLossMaxMinExtreme extreme)
  {
   if(extreme==StopLossMenor)
      return("Menor");
   return("Maior");
  }

string StopLossMultiplierBaseToText(const EStopLossMultiplierBase base)
  {
   if(base==StopLossMultiplicadorRange)
      return("Range (pavio a pavio)");
   return("Corpo do candle");
  }

string TakeProfitFixedModeToText(const ETakeProfitFixedMode mode)
  {
   if(mode==TakeProfitVezesStop)
      return("Vezes o stop loss");
   return("Take distancia");
  }

string BuildOrderSummaryText()
  {
   string order_text="Ordem: "+OrderModeToText(g_config.signals.order_mode);
   if(g_config.signals.order_mode==ModoOrdemLimite)
      order_text+=" / "+LimitModeToText(g_config.signals.limit.mode);
   return(order_text);
  }

string BuildTakeProfitSummaryText()
  {
   if(g_config.take_profit.mode=="fixed" && g_config.take_profit.fixed.enabled)
     {
      if(g_config.take_profit.fixed.method==TakeProfitVezesStop)
        {
         return(
            "Take profit: fixo / Vezes stop"
            +" / Mult="+FormatRuntimeDouble(g_config.take_profit.fixed.stop_multiple)
         );
        }

      return(
         "Take profit: fixo / "+g_config.take_profit.measure
         +" / Dist="+FormatRuntimeDouble(g_config.take_profit.fixed.distance)
      );
     }

   if(g_config.take_profit.mode=="mult" && g_config.take_profit.mult.enabled)
     {
      return(
         "Take profit: multiplicador"
         +" / Base="+StopLossMultiplierBaseToText(g_config.take_profit.mult.base)
         +" / Candle="+ReferenceCandleToText(g_config.take_profit.mult.candle)
         +" / Mult="+FormatRuntimeDouble(g_config.take_profit.mult.value)
      );
     }

   return("Take profit: desativado");
  }

string BuildStopLossSummaryText()
  {
   if(g_config.stop_loss.mode=="fixed" && g_config.stop_loss.fixed.enabled)
      return("Stop loss: fixo / "+g_config.stop_loss.measure+" / Dist="+FormatRuntimeDouble(g_config.stop_loss.fixed.distance));

   if(g_config.stop_loss.mode=="calc_ref" && g_config.stop_loss.reference.enabled)
     {
      return(
         "Stop loss: ref / "+g_config.stop_loss.measure
         +" / Base="+ReferenceBaseToText(g_config.stop_loss.reference.base)
         +" / Candle="+ReferenceCandleToText(g_config.stop_loss.reference.candle)
         +" / Dist="+FormatRuntimeDouble(g_config.stop_loss.reference.distance)
      );
     }

   if(g_config.stop_loss.mode=="calc_med" && g_config.stop_loss.media.enabled)
     {
      return(
         "Stop loss: media / "+g_config.stop_loss.measure
         +" / Base="+ReferenceBaseToText(g_config.stop_loss.media.base)
         +" / Candles="+IntegerToString(g_config.stop_loss.media.candles)
         +" / Dist="+FormatRuntimeDouble(g_config.stop_loss.media.distance)
      );
     }

   if(g_config.stop_loss.mode=="calc_maxmin" && g_config.stop_loss.maxmin.enabled)
     {
      return(
         "Stop loss: max/min"
         +" / Extremo="+StopLossExtremeToText(g_config.stop_loss.maxmin.extreme)
         +" / Base="+ReferenceBaseToText(g_config.stop_loss.maxmin.base)
         +" / Candles="+IntegerToString(g_config.stop_loss.maxmin.candles)
      );
     }

   if(g_config.stop_loss.mode=="mult" && g_config.stop_loss.mult.enabled)
     {
      return(
         "Stop loss: multiplicador"
         +" / Base="+StopLossMultiplierBaseToText(g_config.stop_loss.mult.base)
         +" / Candle="+ReferenceCandleToText(g_config.stop_loss.mult.candle)
         +" / Mult="+FormatRuntimeDouble(g_config.stop_loss.mult.value)
      );
     }

   if(g_config.stop_loss.reference.enabled)
     {
      return(
         "Stop loss: ref / "+g_config.stop_loss.measure
         +" / Base="+ReferenceBaseToText(g_config.stop_loss.reference.base)
         +" / Candle="+ReferenceCandleToText(g_config.stop_loss.reference.candle)
         +" / Dist="+FormatRuntimeDouble(g_config.stop_loss.reference.distance)
      );
     }

   if(g_config.stop_loss.media.enabled)
     {
      return(
         "Stop loss: media / "+g_config.stop_loss.measure
         +" / Base="+ReferenceBaseToText(g_config.stop_loss.media.base)
         +" / Candles="+IntegerToString(g_config.stop_loss.media.candles)
         +" / Dist="+FormatRuntimeDouble(g_config.stop_loss.media.distance)
      );
     }

   if(g_config.stop_loss.maxmin.enabled)
     {
      return(
         "Stop loss: max/min"
         +" / Extremo="+StopLossExtremeToText(g_config.stop_loss.maxmin.extreme)
         +" / Base="+ReferenceBaseToText(g_config.stop_loss.maxmin.base)
         +" / Candles="+IntegerToString(g_config.stop_loss.maxmin.candles)
      );
     }

   if(g_config.stop_loss.mult.enabled)
     {
      return(
         "Stop loss: multiplicador"
         +" / Base="+StopLossMultiplierBaseToText(g_config.stop_loss.mult.base)
         +" / Candle="+ReferenceCandleToText(g_config.stop_loss.mult.candle)
         +" / Mult="+FormatRuntimeDouble(g_config.stop_loss.mult.value)
      );
     }

   if(!g_config.stop_loss.fixed.enabled)
      return("Stop loss: desativado");
   return("Stop loss: fixo / "+g_config.stop_loss.measure+" / Dist="+FormatRuntimeDouble(g_config.stop_loss.fixed.distance));
  }

string ResolveEffectiveStopLossMode()
  {
   if(g_config.stop_loss.mode=="fixed")
      return("fixed");
   if(g_config.stop_loss.mode=="calc_ref")
      return("calc_ref");
   if(g_config.stop_loss.mode=="calc_med")
      return("calc_med");
   if(g_config.stop_loss.mode=="calc_maxmin")
      return("calc_maxmin");
   if(g_config.stop_loss.mode=="mult")
      return("mult");

   if(g_config.stop_loss.reference.enabled && !g_config.stop_loss.media.enabled)
      return("calc_ref");
   if(g_config.stop_loss.media.enabled && !g_config.stop_loss.reference.enabled)
      return("calc_med");
   if(g_config.stop_loss.maxmin.enabled && !g_config.stop_loss.reference.enabled && !g_config.stop_loss.media.enabled)
      return("calc_maxmin");
   if(g_config.stop_loss.mult.enabled && !g_config.stop_loss.reference.enabled && !g_config.stop_loss.media.enabled && !g_config.stop_loss.maxmin.enabled)
      return("mult");
   if(g_config.stop_loss.fixed.enabled)
      return("fixed");
   if(g_config.stop_loss.reference.enabled)
      return("calc_ref");
   if(g_config.stop_loss.media.enabled)
      return("calc_med");
   if(g_config.stop_loss.maxmin.enabled)
      return("calc_maxmin");
   if(g_config.stop_loss.mult.enabled)
      return("mult");
   return("none");
  }

bool IsStopLossRequired()
  {
   return(ResolveEffectiveStopLossMode()!="none");
  }

double ResolveConfiguredStopLossDistance()
  {
   string effective_mode=ResolveEffectiveStopLossMode();
   if(effective_mode=="calc_ref")
      return(g_config.stop_loss.reference.distance);
   if(effective_mode=="calc_med")
      return(g_config.stop_loss.media.distance);
   if(effective_mode=="calc_maxmin")
      return(0.0);
   if(effective_mode=="mult")
      return(g_config.stop_loss.mult.value);
   return(g_config.stop_loss.fixed.distance);
  }

string ResolveEffectiveTakeProfitMode()
  {
   if(g_config.take_profit.mode=="fixed")
      return("fixed");
   if(g_config.take_profit.mode=="mult")
      return("mult");
   if(g_config.take_profit.fixed.enabled)
      return("fixed");
   if(g_config.take_profit.mult.enabled)
      return("mult");
   return("none");
  }

bool IsTakeProfitRequired()
  {
   return(ResolveEffectiveTakeProfitMode()!="none");
  }

double ResolveConfiguredTakeProfitDistance()
  {
   if(ResolveEffectiveTakeProfitMode()=="mult")
      return(g_config.take_profit.mult.value);
   if(g_config.take_profit.fixed.method==TakeProfitVezesStop)
      return(g_config.take_profit.fixed.stop_multiple);
   return(g_config.take_profit.fixed.distance);
  }

int ResolveConfiguredSignalDirection()
  {
   if(g_config.risk.allow_buy && !g_config.risk.allow_sell)
      return(1);
   if(!g_config.risk.allow_buy && g_config.risk.allow_sell)
      return(-1);
   return(0);
  }

string FormatRuntimeDouble(const double value)
  {
   return(DoubleToString(value,2));
  }

double ConvertPriceDistanceToPoints(const double distance_price)
  {
   if(_Point<=0.0)
      return(0.0);
   return(distance_price/_Point);
  }

string BuildRuntimeCommentText()
  {
   string text="\n\n\n\nAlphaForge V3";
   text+="\nOrigem: "+g_config_source;
   text+="\nStrategy: "+ResolveStrategyNameText()+" | Magic: "+ResolveMagicNumberText();
   text+="\nCompra: "+(g_config.risk.allow_buy ? "Sim" : "Nao")+" | Venda: "+(g_config.risk.allow_sell ? "Sim" : "Nao");
   int configured_direction=ResolveConfiguredSignalDirection();
   text+="\nDirecao base do sinal: "+(configured_direction>0 ? "Compra" : (configured_direction<0 ? "Venda" : "Automatica"));
   text+="\nVolume inicial: "+FormatRuntimeDouble(ResolveInitialVolume())+" | Spread max: "+FormatRuntimeDouble(ResolveMaxSpreadPoints());
   text+="\n"+BuildStopLossSummaryText();
   text+="\n"+BuildTakeProfitSummaryText();
   text+="\n"+BuildOrderSummaryText();

   if(g_config.signals.order_mode==ModoOrdemLimite)
     {
      text+="\nTipo: "+LimitModeToText(g_config.signals.limit.mode);
      if(g_config.signals.limit.mode==ModoLimiteReferencia)
        {
         text+="\nBase: "+ReferenceBaseToText(g_config.signals.limit.reference.base)+" | Candle: "+ReferenceCandleToText(g_config.signals.limit.reference.candle);
         text+="\nMover prox. candle: "+(g_config.signals.limit.reference.move_next_candle ? "Sim" : "Nao");
         text+=" | Distancia: "+FormatRuntimeDouble(g_config.signals.limit.reference.distance);
         text+="\nExpiracao: "+ExpirationToText(g_config.signals.limit.reference.expire);
        }
      else
        {
         text+="\nModo media ativo.";
        }
     }

   if(g_config.signals.filter.enabled)
     {
      text+="\n\nFiltro";
      text+="\nMedir em: "+g_config.signals.filter.measure+" | TF: "+g_config.signals.filter.timeframe_label;
      text+="\nVela min/max: "+FormatRuntimeDouble(g_config.signals.filter.candle_min)+" / "+FormatRuntimeDouble(g_config.signals.filter.candle_max);
      text+="\nCorpo min/max: "+FormatRuntimeDouble(g_config.signals.filter.body_min)+" / "+FormatRuntimeDouble(g_config.signals.filter.body_max);
      text+="\nPavio sup. min/max: "+FormatRuntimeDouble(g_config.signals.filter.upper_wick_min)+" / "+FormatRuntimeDouble(g_config.signals.filter.upper_wick_max);
      text+="\nPavio inf. min/max: "+FormatRuntimeDouble(g_config.signals.filter.lower_wick_min)+" / "+FormatRuntimeDouble(g_config.signals.filter.lower_wick_max);
     }
   else
     {
      text+="\n\nFiltro: desativado";
     }

   if(g_config.signals.channels.enabled)
     {
      text+="\n\nCanais";
      text+="\nIndicador: "+g_config.signals.channels.indicator+" | Sinal: "+g_config.signals.channels.signal;
      text+="\nPeriodo: "+IntegerToString(g_config.signals.channels.period)+" | Desvio: "+FormatRuntimeDouble(g_config.signals.channels.deviation);
      text+="\nShift: "+IntegerToString(g_config.signals.channels.shift)+" | Preco: "+g_config.signals.channels.price_mode;
     }
   else
     {
      text+="\n\nCanais: desativado";
     }

   return(text);
  }

void RefreshRuntimeComment()
  {
   Comment(BuildRuntimeCommentText());
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
   if(IsPercentMeasure(measure))
     {
      if(reference_price<=0.0)
         return(0.0);
      return((distance_price/reference_price)*100.0);
     }

   if(_Point<=0.0)
      return(0.0);
   return(distance_price/_Point);
  }

double ResolveStopLossDistancePrice(const double reference_price)
  {
   if(!g_config.stop_loss.fixed.enabled)
      return(0.0);

   double distance=g_config.stop_loss.fixed.distance;
   if(distance<=0.0)
      return(0.0);

   if(g_config.stop_loss.is_percent)
     {
      if(reference_price<=0.0)
         return(0.0);
      return(reference_price*(distance/100.0));
     }

   return(distance*_Point);
  }

double ResolveMetricDistancePrice(const double distance,const double reference_price)
  {
   if(distance<=0.0)
      return(0.0);

   if(g_config.stop_loss.is_percent)
     {
      if(reference_price<=0.0)
         return(0.0);
      return(reference_price*(distance/100.0));
     }

   return(distance*_Point);
  }

bool TryLoadStopLossReferenceBar(MqlRates &reference_bar)
  {
   int reference_shift=ResolveReferenceBarShift(g_config.stop_loss.reference.candle);
   MqlRates bars[];
   ArraySetAsSeries(bars,true);
   int copied=CopyRates(_Symbol,(ENUM_TIMEFRAMES)Period(),reference_shift,1,bars);
   if(copied<1)
      return(false);

   reference_bar=bars[0];
   return(true);
  }

bool TryLoadStopLossMediaBars(MqlRates &bars[])
  {
   int bars_count=g_config.stop_loss.media.candles;
   if(bars_count<1)
      return(false);

   ArraySetAsSeries(bars,true);
   int copied=CopyRates(_Symbol,(ENUM_TIMEFRAMES)Period(),1,bars_count,bars);
   return(copied>=bars_count);
  }

bool TryLoadStopLossMaxMinBars(MqlRates &bars[])
  {
   int bars_count=g_config.stop_loss.maxmin.candles;
   if(bars_count<1)
      return(false);

   ArraySetAsSeries(bars,true);
   int copied=CopyRates(_Symbol,(ENUM_TIMEFRAMES)Period(),1,bars_count,bars);
   return(copied>=bars_count);
  }

bool TryLoadStopLossMultiplierBar(MqlRates &reference_bar)
  {
   int reference_shift=ResolveReferenceBarShift(g_config.stop_loss.mult.candle);
   MqlRates bars[];
   ArraySetAsSeries(bars,true);
   int copied=CopyRates(_Symbol,(ENUM_TIMEFRAMES)Period(),reference_shift,1,bars);
   if(copied<1)
      return(false);

   reference_bar=bars[0];
   return(true);
  }

void LogRejectedMediaStopLoss(
   const string reason,
   const int direction,
   const double entry_price,
   const double reference_price,
   const double distance_price,
   const double stop_loss_price
)
  {
   Print(
      "AlphaForge V3: stop loss por media rejeitado. Motivo=",reason,
      " Direcao=",IntegerToString(direction),
      " Entry=",DoubleToString(entry_price,_Digits),
      " Media=",DoubleToString(reference_price,_Digits),
      " DistCalc=",DoubleToString(distance_price,_Digits),
      " DistPts=",DoubleToString(ConvertPriceDistanceToPoints(distance_price),2),
      " SL=",DoubleToString(stop_loss_price,_Digits),
      " Base=",ReferenceBaseToText(g_config.stop_loss.media.base),
      " Candles=",IntegerToString(g_config.stop_loss.media.candles),
      " DistCfg=",DoubleToString(g_config.stop_loss.media.distance,2),
      " Medida=",g_config.stop_loss.measure
   );
  }

void LogRejectedReferenceStopLoss(
   const string reason,
   const int direction,
   const double entry_price,
   const double reference_price,
   const double distance_price,
   const double stop_loss_price
)
  {
   Print(
      "AlphaForge V3: stop loss por referencia rejeitado. Motivo=",reason,
      " Direcao=",IntegerToString(direction),
      " Entry=",DoubleToString(entry_price,_Digits),
      " Ref=",DoubleToString(reference_price,_Digits),
      " DistCalc=",DoubleToString(distance_price,_Digits),
      " DistPts=",DoubleToString(ConvertPriceDistanceToPoints(distance_price),2),
      " SL=",DoubleToString(stop_loss_price,_Digits),
      " Base=",ReferenceBaseToText(g_config.stop_loss.reference.base),
      " Candle=",ReferenceCandleToText(g_config.stop_loss.reference.candle),
      " DistCfg=",DoubleToString(g_config.stop_loss.reference.distance,2),
      " Medida=",g_config.stop_loss.measure
  );
 }

void LogRejectedMaxMinStopLoss(
   const string reason,
   const int direction,
   const double entry_price,
   const double reference_price,
   const double stop_loss_price
)
  {
   Print(
      "AlphaForge V3: stop loss por max/min rejeitado. Motivo=",reason,
      " Direcao=",IntegerToString(direction),
      " Entry=",DoubleToString(entry_price,_Digits),
      " Ref=",DoubleToString(reference_price,_Digits),
      " SL=",DoubleToString(stop_loss_price,_Digits),
      " Extremo=",StopLossExtremeToText(g_config.stop_loss.maxmin.extreme),
      " Base=",ReferenceBaseToText(g_config.stop_loss.maxmin.base),
      " Candles=",IntegerToString(g_config.stop_loss.maxmin.candles)
   );
  }

void LogRejectedMultiplierStopLoss(
   const string reason,
   const int direction,
   const double entry_price,
   const double reference_price,
   const double distance_price,
   const double stop_loss_price
)
  {
   Print(
      "AlphaForge V3: stop loss por multiplicador rejeitado. Motivo=",reason,
      " Direcao=",IntegerToString(direction),
      " Entry=",DoubleToString(entry_price,_Digits),
      " Ref=",DoubleToString(reference_price,_Digits),
      " DistCalc=",DoubleToString(distance_price,_Digits),
      " DistPts=",DoubleToString(ConvertPriceDistanceToPoints(distance_price),2),
      " SL=",DoubleToString(stop_loss_price,_Digits),
      " Base=",StopLossMultiplierBaseToText(g_config.stop_loss.mult.base),
      " Candle=",ReferenceCandleToText(g_config.stop_loss.mult.candle),
      " Mult=",DoubleToString(g_config.stop_loss.mult.value,2)
   );
  }

void LogReferenceStopLossCalculation(
   const int direction,
   const double entry_price,
   const double reference_price,
   const double configured_distance,
   const double distance_price,
   const double stop_loss_price
)
  {
   Print(
      "AlphaForge V3: calculo do stop loss por referencia.",
      " Direcao=",IntegerToString(direction),
      " Entry=",DoubleToString(entry_price,_Digits),
      " Ref=",DoubleToString(reference_price,_Digits),
      " Base=",ReferenceBaseToText(g_config.stop_loss.reference.base),
      " Candle=",ReferenceCandleToText(g_config.stop_loss.reference.candle),
      " Medida=",g_config.stop_loss.measure,
      " DistCfg=",DoubleToString(configured_distance,2),
      " DistCalc=",DoubleToString(distance_price,_Digits),
      " DistPts=",DoubleToString(ConvertPriceDistanceToPoints(distance_price),2),
      " SL=",DoubleToString(stop_loss_price,_Digits)
   );
  }

double ResolveReferenceStopLossPrice(const int direction,const double entry_price)
  {
   if(!g_config.stop_loss.reference.enabled)
      return(0.0);

   MqlRates reference_bar;
   if(!TryLoadStopLossReferenceBar(reference_bar))
     {
      LogRejectedReferenceStopLoss("vela_referencia_indisponivel",direction,entry_price,0.0,0.0,0.0);
      return(0.0);
     }

   double reference_price=ResolveReferencePrice(reference_bar,g_config.stop_loss.reference.base);
   double distance_price=ResolveMetricDistancePrice(
      g_config.stop_loss.reference.distance,
      reference_price
   );
   if(reference_price<=0.0 || distance_price<0.0 || entry_price<=0.0)
     {
      LogRejectedReferenceStopLoss("preco_ou_distancia_invalido",direction,entry_price,reference_price,distance_price,0.0);
      return(0.0);
     }

   double stop_loss_price=(direction>0) ? reference_price-distance_price : reference_price+distance_price;
   stop_loss_price=NormalizeDouble(stop_loss_price,_Digits);
   LogReferenceStopLossCalculation(
      direction,
      entry_price,
      reference_price,
      g_config.stop_loss.reference.distance,
      distance_price,
      stop_loss_price
   );
   if(stop_loss_price<=0.0)
     {
      LogRejectedReferenceStopLoss("stop_loss_menor_ou_igual_zero",direction,entry_price,reference_price,distance_price,stop_loss_price);
      return(0.0);
     }

   if(direction>0 && stop_loss_price>=entry_price)
     {
      LogRejectedReferenceStopLoss("compra_com_sl_acima_ou_igual_entrada",direction,entry_price,reference_price,distance_price,stop_loss_price);
      return(0.0);
     }
   if(direction<0 && stop_loss_price<=entry_price)
     {
      LogRejectedReferenceStopLoss("venda_com_sl_abaixo_ou_igual_entrada",direction,entry_price,reference_price,distance_price,stop_loss_price);
      return(0.0);
     }

   return(stop_loss_price);
  }

double ResolveAverageReferencePrice(const MqlRates &bars[],const int count,const ESignalLimitReferenceBase reference_name)
  {
   if(count<=0)
      return(0.0);

   double total=0.0;
   for(int index=0; index<count; index++)
      total+=ResolveReferencePrice(bars[index],reference_name);

   return(total/(double)count);
  }

double ResolveExtremeReferencePrice(const MqlRates &bars[],const int count,const ESignalLimitReferenceBase reference_name,const EStopLossMaxMinExtreme extreme)
  {
   if(count<=0)
      return(0.0);

   double selected_price=ResolveReferencePrice(bars[0],reference_name);
   for(int index=1; index<count; index++)
     {
      double price=ResolveReferencePrice(bars[index],reference_name);
      if(extreme==StopLossMaior)
        {
         if(price>selected_price)
            selected_price=price;
        }
      else
        {
         if(price<selected_price)
            selected_price=price;
        }
     }

   return(selected_price);
  }

double ResolveStopLossMultiplierReferencePrice(const MqlRates &reference_bar)
  {
   if(g_config.stop_loss.mult.base==StopLossMultiplicadorRange)
      return(reference_bar.high-reference_bar.low);

   return(MathAbs(reference_bar.close-reference_bar.open));
  }

bool TryLoadTakeProfitMultiplierBar(MqlRates &reference_bar)
  {
   int reference_shift=ResolveReferenceBarShift(g_config.take_profit.mult.candle);
   MqlRates bars[];
   ArraySetAsSeries(bars,true);
   int copied=CopyRates(_Symbol,(ENUM_TIMEFRAMES)Period(),reference_shift,1,bars);
   if(copied<1)
      return(false);

   reference_bar=bars[0];
   return(true);
  }

double ResolveTakeProfitMultiplierReferencePrice(const MqlRates &reference_bar)
  {
   if(g_config.take_profit.mult.base==StopLossMultiplicadorRange)
      return(reference_bar.high-reference_bar.low);

   return(MathAbs(reference_bar.close-reference_bar.open));
  }

double ResolveMediaStopLossPrice(const int direction,const double entry_price)
  {
   if(!g_config.stop_loss.media.enabled)
      return(0.0);

   MqlRates bars[];
   if(!TryLoadStopLossMediaBars(bars))
     {
      LogRejectedMediaStopLoss("velas_media_indisponiveis",direction,entry_price,0.0,0.0,0.0);
      return(0.0);
     }

   double reference_price=ResolveAverageReferencePrice(bars,g_config.stop_loss.media.candles,g_config.stop_loss.media.base);
   double distance_price=ResolveMetricDistancePrice(
      g_config.stop_loss.media.distance,
      reference_price
   );
   if(reference_price<=0.0 || distance_price<0.0 || entry_price<=0.0)
     {
      LogRejectedMediaStopLoss("preco_ou_distancia_invalido",direction,entry_price,reference_price,distance_price,0.0);
      return(0.0);
     }

   double stop_loss_price=(direction>0) ? reference_price-distance_price : reference_price+distance_price;
   stop_loss_price=NormalizeDouble(stop_loss_price,_Digits);
   Print(
      "AlphaForge V3: calculo do stop loss por media.",
      " Direcao=",IntegerToString(direction),
      " Entry=",DoubleToString(entry_price,_Digits),
      " Media=",DoubleToString(reference_price,_Digits),
      " Base=",ReferenceBaseToText(g_config.stop_loss.media.base),
      " Candles=",IntegerToString(g_config.stop_loss.media.candles),
      " Medida=",g_config.stop_loss.measure,
      " DistCfg=",DoubleToString(g_config.stop_loss.media.distance,2),
      " DistCalc=",DoubleToString(distance_price,_Digits),
      " DistPts=",DoubleToString(ConvertPriceDistanceToPoints(distance_price),2),
      " SL=",DoubleToString(stop_loss_price,_Digits)
   );
   if(stop_loss_price<=0.0)
     {
      LogRejectedMediaStopLoss("stop_loss_menor_ou_igual_zero",direction,entry_price,reference_price,distance_price,stop_loss_price);
      return(0.0);
     }
   if(direction>0 && stop_loss_price>=entry_price)
     {
      LogRejectedMediaStopLoss("compra_com_sl_acima_ou_igual_entrada",direction,entry_price,reference_price,distance_price,stop_loss_price);
      return(0.0);
     }
   if(direction<0 && stop_loss_price<=entry_price)
     {
      LogRejectedMediaStopLoss("venda_com_sl_abaixo_ou_igual_entrada",direction,entry_price,reference_price,distance_price,stop_loss_price);
      return(0.0);
     }

   return(stop_loss_price);
  }

double ResolveMaxMinStopLossPrice(const int direction,const double entry_price)
  {
   if(!g_config.stop_loss.maxmin.enabled)
      return(0.0);

   MqlRates bars[];
   if(!TryLoadStopLossMaxMinBars(bars))
     {
      LogRejectedMaxMinStopLoss("velas_maxmin_indisponiveis",direction,entry_price,0.0,0.0);
      return(0.0);
     }

   double reference_price=ResolveExtremeReferencePrice(
      bars,
      g_config.stop_loss.maxmin.candles,
      g_config.stop_loss.maxmin.base,
      g_config.stop_loss.maxmin.extreme
   );
   if(reference_price<=0.0 || entry_price<=0.0)
     {
      LogRejectedMaxMinStopLoss("preco_invalido",direction,entry_price,reference_price,0.0);
      return(0.0);
     }

   double stop_loss_price=NormalizeDouble(reference_price,_Digits);
   Print(
      "AlphaForge V3: calculo do stop loss por max/min.",
      " Direcao=",IntegerToString(direction),
      " Entry=",DoubleToString(entry_price,_Digits),
      " Ref=",DoubleToString(reference_price,_Digits),
      " Extremo=",StopLossExtremeToText(g_config.stop_loss.maxmin.extreme),
      " Base=",ReferenceBaseToText(g_config.stop_loss.maxmin.base),
      " Candles=",IntegerToString(g_config.stop_loss.maxmin.candles),
      " SL=",DoubleToString(stop_loss_price,_Digits)
   );
   if(stop_loss_price<=0.0)
     {
      LogRejectedMaxMinStopLoss("stop_loss_menor_ou_igual_zero",direction,entry_price,reference_price,stop_loss_price);
      return(0.0);
     }
   if(direction>0 && stop_loss_price>=entry_price)
     {
      LogRejectedMaxMinStopLoss("compra_com_sl_acima_ou_igual_entrada",direction,entry_price,reference_price,stop_loss_price);
      return(0.0);
     }
   if(direction<0 && stop_loss_price<=entry_price)
     {
      LogRejectedMaxMinStopLoss("venda_com_sl_abaixo_ou_igual_entrada",direction,entry_price,reference_price,stop_loss_price);
      return(0.0);
     }

   return(stop_loss_price);
  }

double ResolveMultiplierStopLossPrice(const int direction,const double entry_price)
  {
   if(!g_config.stop_loss.mult.enabled)
      return(0.0);

   MqlRates reference_bar;
   if(!TryLoadStopLossMultiplierBar(reference_bar))
     {
      LogRejectedMultiplierStopLoss("vela_referencia_indisponivel",direction,entry_price,0.0,0.0,0.0);
      return(0.0);
     }

   double reference_price=ResolveStopLossMultiplierReferencePrice(reference_bar);
   double distance_price=reference_price*g_config.stop_loss.mult.value;
   if(reference_price<=0.0 || distance_price<=0.0 || entry_price<=0.0)
     {
      LogRejectedMultiplierStopLoss("preco_ou_distancia_invalido",direction,entry_price,reference_price,distance_price,0.0);
      return(0.0);
     }

   double stop_loss_price=(direction>0) ? entry_price-distance_price : entry_price+distance_price;
   stop_loss_price=NormalizeDouble(stop_loss_price,_Digits);
   Print(
      "AlphaForge V3: calculo do stop loss por multiplicador.",
      " Direcao=",IntegerToString(direction),
      " Entry=",DoubleToString(entry_price,_Digits),
      " Ref=",DoubleToString(reference_price,_Digits),
      " Base=",StopLossMultiplierBaseToText(g_config.stop_loss.mult.base),
      " Candle=",ReferenceCandleToText(g_config.stop_loss.mult.candle),
      " Mult=",DoubleToString(g_config.stop_loss.mult.value,2),
      " DistCalc=",DoubleToString(distance_price,_Digits),
      " DistPts=",DoubleToString(ConvertPriceDistanceToPoints(distance_price),2),
      " SL=",DoubleToString(stop_loss_price,_Digits)
   );
   if(stop_loss_price<=0.0)
     {
      LogRejectedMultiplierStopLoss("stop_loss_menor_ou_igual_zero",direction,entry_price,reference_price,distance_price,stop_loss_price);
      return(0.0);
     }
   if(direction>0 && stop_loss_price>=entry_price)
     {
      LogRejectedMultiplierStopLoss("compra_com_sl_acima_ou_igual_entrada",direction,entry_price,reference_price,distance_price,stop_loss_price);
      return(0.0);
     }
   if(direction<0 && stop_loss_price<=entry_price)
     {
      LogRejectedMultiplierStopLoss("venda_com_sl_abaixo_ou_igual_entrada",direction,entry_price,reference_price,distance_price,stop_loss_price);
      return(0.0);
     }

   return(stop_loss_price);
  }

double ResolveStopLossPrice(const int direction,const double entry_price)
  {
   string effective_mode=ResolveEffectiveStopLossMode();
   if(effective_mode=="calc_ref")
      return(ResolveReferenceStopLossPrice(direction,entry_price));
   if(effective_mode=="calc_med")
      return(ResolveMediaStopLossPrice(direction,entry_price));
   if(effective_mode=="calc_maxmin")
      return(ResolveMaxMinStopLossPrice(direction,entry_price));
   if(effective_mode=="mult")
      return(ResolveMultiplierStopLossPrice(direction,entry_price));

   double distance_price=ResolveStopLossDistancePrice(entry_price);
   if(distance_price<=0.0 || entry_price<=0.0)
      return(0.0);

   double stop_loss_price=(direction>0) ? entry_price-distance_price : entry_price+distance_price;
   stop_loss_price=NormalizeDouble(stop_loss_price,_Digits);
   if(stop_loss_price<=0.0)
      return(0.0);
   return(stop_loss_price);
  }

double ResolveTakeProfitPrice(const int direction,const double entry_price,const double stop_loss_price)
  {
   string effective_mode=ResolveEffectiveTakeProfitMode();
   if(effective_mode=="mult")
     {
      if(!g_config.take_profit.mult.enabled || entry_price<=0.0 || g_config.take_profit.mult.value<=0.0)
         return(0.0);

      MqlRates reference_bar;
      if(!TryLoadTakeProfitMultiplierBar(reference_bar))
         return(0.0);

      double reference_price=ResolveTakeProfitMultiplierReferencePrice(reference_bar);
      double distance_price=reference_price*g_config.take_profit.mult.value;
      if(reference_price<=0.0 || distance_price<=0.0)
         return(0.0);

      double take_profit_price=(direction>0) ? entry_price+distance_price : entry_price-distance_price;
      take_profit_price=NormalizeDouble(take_profit_price,_Digits);
      if(take_profit_price<=0.0)
         return(0.0);
      if(direction>0 && take_profit_price<=entry_price)
         return(0.0);
      if(direction<0 && take_profit_price>=entry_price)
         return(0.0);

      Print(
         "AlphaForge V3: calculo do take profit por multiplicador.",
         " Direcao=",IntegerToString(direction),
         " Entry=",DoubleToString(entry_price,_Digits),
         " Base=",StopLossMultiplierBaseToText(g_config.take_profit.mult.base),
         " Candle=",ReferenceCandleToText(g_config.take_profit.mult.candle),
         " Mult=",DoubleToString(g_config.take_profit.mult.value,2),
         " DistCalc=",DoubleToString(distance_price,_Digits),
         " DistPts=",DoubleToString(ConvertPriceDistanceToPoints(distance_price),2),
         " TP=",DoubleToString(take_profit_price,_Digits)
      );
      return(take_profit_price);
     }

   if(effective_mode!="fixed")
      return(0.0);
   if(!g_config.take_profit.fixed.enabled || entry_price<=0.0)
      return(0.0);

   double distance_price=0.0;
   if(g_config.take_profit.fixed.method==TakeProfitVezesStop)
     {
      double stop_distance=MathAbs(entry_price-stop_loss_price);
      if(stop_distance<=0.0 || g_config.take_profit.fixed.stop_multiple<=0.0)
        {
         Print(
            "AlphaForge V3: take profit fixo rejeitado. Motivo=distancia_stop_indisponivel",
            " Direcao=",IntegerToString(direction),
            " Entry=",DoubleToString(entry_price,_Digits),
            " SL=",DoubleToString(stop_loss_price,_Digits),
            " Metodo=",TakeProfitFixedModeToText(g_config.take_profit.fixed.method),
            " Mult=",DoubleToString(g_config.take_profit.fixed.stop_multiple,2)
         );
         return(0.0);
        }

      distance_price=stop_distance*g_config.take_profit.fixed.stop_multiple;
     }
   else
     {
      if(g_config.take_profit.fixed.distance<=0.0)
         return(0.0);

      if(g_config.take_profit.is_percent)
         distance_price=entry_price*(g_config.take_profit.fixed.distance/100.0);
      else
         distance_price=g_config.take_profit.fixed.distance*_Point;
     }

   if(distance_price<=0.0)
      return(0.0);

   double take_profit_price=(direction>0) ? entry_price+distance_price : entry_price-distance_price;
   take_profit_price=NormalizeDouble(take_profit_price,_Digits);
   if(take_profit_price<=0.0)
      return(0.0);
   if(direction>0 && take_profit_price<=entry_price)
      return(0.0);
   if(direction<0 && take_profit_price>=entry_price)
      return(0.0);

   Print(
      "AlphaForge V3: calculo do take profit fixo.",
      " Direcao=",IntegerToString(direction),
      " Entry=",DoubleToString(entry_price,_Digits),
      " SL=",DoubleToString(stop_loss_price,_Digits),
      " Metodo=",TakeProfitFixedModeToText(g_config.take_profit.fixed.method),
      " Medida=",g_config.take_profit.measure,
      " DistCfg=",DoubleToString(ResolveConfiguredTakeProfitDistance(),2),
      " DistCalc=",DoubleToString(distance_price,_Digits),
      " DistPts=",DoubleToString(ConvertPriceDistanceToPoints(distance_price),2),
      " TP=",DoubleToString(take_profit_price,_Digits)
   );
   return(take_profit_price);
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

void LogSymbolTradeDiagnostics()
  {
   long digits=SymbolInfoInteger(_Symbol,SYMBOL_DIGITS);
   long calc_mode=SymbolInfoInteger(_Symbol,SYMBOL_TRADE_CALC_MODE);
   double point=SymbolInfoDouble(_Symbol,SYMBOL_POINT);
   double tick_size=SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_SIZE);
   double tick_value=SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_VALUE);
   double contract_size=SymbolInfoDouble(_Symbol,SYMBOL_TRADE_CONTRACT_SIZE);
   double min_volume=SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MIN);
   double max_volume=SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MAX);
   double step_volume=SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_STEP);

   Print(
      "AlphaForge V3: diagnostico do simbolo. Symbol=",_Symbol,
      " Digits=",IntegerToString((int)digits),
      " Point=",DoubleToString(point,8),
      " TickSize=",DoubleToString(tick_size,8),
      " TickValue=",DoubleToString(tick_value,8),
      " ContractSize=",DoubleToString(contract_size,2),
      " CalcMode=",IntegerToString((int)calc_mode),
      " VolumeMin=",DoubleToString(min_volume,2),
      " VolumeMax=",DoubleToString(max_volume,2),
      " VolumeStep=",DoubleToString(step_volume,2)
   );

   if(tick_size<=0.0 || tick_value<=0.0 || contract_size<=0.0)
     {
      Print(
         "AlphaForge V3: aviso. O simbolo possui propriedade economica invalida para backtest.",
         " TickSize=",DoubleToString(tick_size,8),
         " TickValue=",DoubleToString(tick_value,8),
         " ContractSize=",DoubleToString(contract_size,2),
         " Isso costuma deixar a curva reta e o lucro zerado mesmo com ordens executadas."
      );
     }
  }

bool GetOpenPositionData(
   ENUM_POSITION_TYPE &position_type,
   double &stop_loss,
   double &take_profit,
   ulong &ticket,
   datetime &open_time
)
  {
   if(!PositionSelect(_Symbol))
      return(false);

   ticket=(ulong)PositionGetInteger(POSITION_TICKET);
   position_type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
   stop_loss=PositionGetDouble(POSITION_SL);
   take_profit=PositionGetDouble(POSITION_TP);
   open_time=(datetime)PositionGetInteger(POSITION_TIME);
   return(true);
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
   double &price,
   datetime &setup_time
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
      setup_time=(datetime)OrderGetInteger(ORDER_TIME_SETUP);
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

void EnforceManualStopLoss(void)
  {
   ENUM_POSITION_TYPE position_type=WRONG_VALUE;
   double stop_loss=0.0;
   double take_profit=0.0;
   ulong ticket=0;
   datetime open_time=0;
   if(!GetOpenPositionData(position_type,stop_loss,take_profit,ticket,open_time))
      return;
   if(stop_loss<=0.0)
      return;

   MqlTick tick;
   if(!SymbolInfoTick(_Symbol,tick))
      return;

   bool should_close=false;
   string reason="";
   if(position_type==POSITION_TYPE_BUY && tick.bid<=stop_loss)
     {
      should_close=true;
      reason="bid<=sl";
     }
   else if(position_type==POSITION_TYPE_SELL && tick.ask>=stop_loss)
     {
      should_close=true;
      reason="ask>=sl";
     }

   if(!should_close)
     {
      datetime current_bar_open=iTime(_Symbol,PERIOD_CURRENT,0);
      if(current_bar_open>0 && open_time<=current_bar_open)
        {
         MqlRates current_bar;
         if(ReadSignalBarAtShift(PERIOD_CURRENT,0,current_bar))
           {
            if(position_type==POSITION_TYPE_BUY && current_bar.low<=stop_loss)
              {
               should_close=true;
               reason="bar.low<=sl";
              }
            else if(position_type==POSITION_TYPE_SELL && current_bar.high>=stop_loss)
              {
               should_close=true;
               reason="bar.high>=sl";
              }
           }
        }
     }

   if(!should_close)
      return;

   g_trade.SetExpertMagicNumber(ResolveMagicNumberValue());
   if(!g_trade.PositionClose(_Symbol))
     {
      Print(
         "AlphaForge V3: falha ao encerrar posicao por stop manual. Ticket=",ticket,
         " SL=",DoubleToString(stop_loss,_Digits),
         " Reason=",reason,
         " Retcode=",g_trade.ResultRetcode(),
         " Desc=",g_trade.ResultRetcodeDescription()
      );
      return;
     }

   Print(
      "AlphaForge V3: posicao encerrada por stop manual. Ticket=",ticket,
      " SL=",DoubleToString(stop_loss,_Digits),
      " Reason=",reason,
      " Open=",DoubleToString(PositionGetDouble(POSITION_PRICE_OPEN),_Digits),
      " Volume=",DoubleToString(PositionGetDouble(POSITION_VOLUME),2),
      " ProfitBeforeClose=",DoubleToString(PositionGetDouble(POSITION_PROFIT),2)
   );
  }

void EnforceManualTakeProfit(void)
  {
   ENUM_POSITION_TYPE position_type=WRONG_VALUE;
   double stop_loss=0.0;
   double take_profit=0.0;
   ulong ticket=0;
   datetime open_time=0;
   if(!GetOpenPositionData(position_type,stop_loss,take_profit,ticket,open_time))
      return;
   if(take_profit<=0.0)
      return;

   MqlTick tick;
   if(!SymbolInfoTick(_Symbol,tick))
      return;

   bool should_close=false;
   string reason="";
   if(position_type==POSITION_TYPE_BUY && tick.bid>=take_profit)
     {
      should_close=true;
      reason="bid>=tp";
     }
   else if(position_type==POSITION_TYPE_SELL && tick.ask<=take_profit)
     {
      should_close=true;
      reason="ask<=tp";
     }

   if(!should_close)
     {
      datetime current_bar_open=iTime(_Symbol,PERIOD_CURRENT,0);
      if(current_bar_open>0 && open_time<=current_bar_open)
        {
         MqlRates current_bar;
         if(ReadSignalBarAtShift(PERIOD_CURRENT,0,current_bar))
           {
            if(position_type==POSITION_TYPE_BUY && current_bar.high>=take_profit)
              {
               should_close=true;
               reason="bar.high>=tp";
              }
            else if(position_type==POSITION_TYPE_SELL && current_bar.low<=take_profit)
              {
               should_close=true;
               reason="bar.low<=tp";
              }
           }
        }
     }

   if(!should_close)
      return;

   g_trade.SetExpertMagicNumber(ResolveMagicNumberValue());
   if(!g_trade.PositionClose(_Symbol))
     {
      Print(
         "AlphaForge V3: falha ao encerrar posicao por take profit manual. Ticket=",ticket,
         " TP=",DoubleToString(take_profit,_Digits),
         " Reason=",reason,
         " Retcode=",g_trade.ResultRetcode(),
         " Desc=",g_trade.ResultRetcodeDescription()
      );
      return;
     }

   Print(
      "AlphaForge V3: posicao encerrada por take profit manual. Ticket=",ticket,
      " TP=",DoubleToString(take_profit,_Digits),
      " Reason=",reason,
      " Open=",DoubleToString(PositionGetDouble(POSITION_PRICE_OPEN),_Digits),
      " Volume=",DoubleToString(PositionGetDouble(POSITION_VOLUME),2),
      " ProfitBeforeClose=",DoubleToString(PositionGetDouble(POSITION_PROFIT),2)
   );
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

bool HasAnySignalCriteriaEnabled()
  {
   return(g_config.signals.filter.enabled || g_config.signals.channels.enabled);
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

ENUM_APPLIED_PRICE ResolveAppliedPrice(const string price_mode)
  {
   string normalized=NormalizeText(price_mode);
   if(normalized=="Abertura")
      return(PRICE_OPEN);
   if(normalized=="Maximo")
      return(PRICE_HIGH);
   if(normalized=="Minimo")
      return(PRICE_LOW);
   if(normalized=="Mediano")
      return(PRICE_MEDIAN);
   if(normalized=="Tipico")
      return(PRICE_TYPICAL);
   if(normalized=="Medio")
      return(PRICE_WEIGHTED);
   return(PRICE_CLOSE);
  }

double ResolveBarPrice(const MqlRates &bar,const ENUM_APPLIED_PRICE applied_price)
  {
   if(applied_price==PRICE_OPEN)
      return(bar.open);
   if(applied_price==PRICE_HIGH)
      return(bar.high);
   if(applied_price==PRICE_LOW)
      return(bar.low);
   if(applied_price==PRICE_MEDIAN)
      return((bar.high+bar.low)/2.0);
   if(applied_price==PRICE_TYPICAL)
      return((bar.high+bar.low+bar.close)/3.0);
   if(applied_price==PRICE_WEIGHTED)
      return((bar.high+bar.low+(2.0*bar.close))/4.0);
   return(bar.close);
  }

int ClassifyBandPosition(const double price_value,const double upper_band,const double lower_band)
  {
   if(price_value>upper_band)
      return(1);
   if(price_value<lower_band)
      return(-1);
   return(0);
  }

bool ResolveBandDirection(const int band_position,int &direction)
  {
   direction=0;
   if(band_position>0)
      direction=-1;
   else if(band_position<0)
      direction=1;
   return(direction!=0);
  }

bool ReadBollingerBandValue(const ENUM_TIMEFRAMES timeframe,const int period,const double deviation,const int bands_shift,const ENUM_APPLIED_PRICE applied_price,const int buffer_index,const int bar_shift,double &value)
  {
   int handle=iBands(_Symbol,timeframe,period,bands_shift,deviation,applied_price);
   if(handle==INVALID_HANDLE)
      return(false);

   double buffer[];
   ArraySetAsSeries(buffer,true);
   bool copied=(CopyBuffer(handle,buffer_index,bar_shift,1,buffer)==1);
   IndicatorRelease(handle);
   if(!copied)
      return(false);

   value=buffer[0];
   return(true);
  }

bool ReadBollingerBandsAtShift(const ENUM_TIMEFRAMES timeframe,const int bar_shift,double &upper_band,double &middle_band,double &lower_band)
  {
   int period=g_config.signals.channels.period;
   double deviation=g_config.signals.channels.deviation;
   int bands_shift=g_config.signals.channels.shift;
   ENUM_APPLIED_PRICE applied_price=ResolveAppliedPrice(g_config.signals.channels.price_mode);

   if(!ReadBollingerBandValue(timeframe,period,deviation,bands_shift,applied_price,1,bar_shift,upper_band))
      return(false);
   if(!ReadBollingerBandValue(timeframe,period,deviation,bands_shift,applied_price,0,bar_shift,middle_band))
      return(false);
   if(!ReadBollingerBandValue(timeframe,period,deviation,bands_shift,applied_price,2,bar_shift,lower_band))
      return(false);
   return(true);
  }

bool ReadMovingAverageValue(const ENUM_TIMEFRAMES timeframe,const int period,const int ma_shift,const ENUM_MA_METHOD ma_method,const ENUM_APPLIED_PRICE applied_price,const int bar_shift,double &value)
  {
   int handle=iMA(_Symbol,timeframe,period,ma_shift,ma_method,applied_price);
   if(handle==INVALID_HANDLE)
      return(false);

   double buffer[];
   ArraySetAsSeries(buffer,true);
   bool copied=(CopyBuffer(handle,0,bar_shift,1,buffer)==1);
   IndicatorRelease(handle);
   if(!copied)
      return(false);

   value=buffer[0];
   return(true);
  }

bool ReadAtrValue(const ENUM_TIMEFRAMES timeframe,const int period,const int bar_shift,double &value)
  {
   int handle=iATR(_Symbol,timeframe,period);
   if(handle==INVALID_HANDLE)
      return(false);

   double buffer[];
   ArraySetAsSeries(buffer,true);
   bool copied=(CopyBuffer(handle,0,bar_shift,1,buffer)==1);
   IndicatorRelease(handle);
   if(!copied)
      return(false);

   value=buffer[0];
   return(true);
  }

bool ReadKeltnerBandsAtShift(const ENUM_TIMEFRAMES timeframe,const int bar_shift,double &upper_band,double &middle_band,double &lower_band)
  {
   int period=g_config.signals.channels.period;
   double deviation=g_config.signals.channels.deviation;
   int bands_shift=g_config.signals.channels.shift;
   ENUM_APPLIED_PRICE applied_price=ResolveAppliedPrice(g_config.signals.channels.price_mode);
   double atr_value=0.0;

   if(!ReadMovingAverageValue(timeframe,period,bands_shift,MODE_EMA,applied_price,bar_shift,middle_band))
      return(false);
   if(!ReadAtrValue(timeframe,period,bar_shift,atr_value))
      return(false);

   upper_band=middle_band+(deviation*atr_value);
   lower_band=middle_band-(deviation*atr_value);
   return(true);
  }

bool ReadChannelBandsAtShift(const string indicator_name,const ENUM_TIMEFRAMES timeframe,const int bar_shift,double &upper_band,double &middle_band,double &lower_band)
  {
   if(indicator_name=="Bandas de Bollinger")
      return(ReadBollingerBandsAtShift(timeframe,bar_shift,upper_band,middle_band,lower_band));
   if(indicator_name=="Keltner")
      return(ReadKeltnerBandsAtShift(timeframe,bar_shift,upper_band,middle_band,lower_band));
   return(false);
  }

bool EvaluateChannelSignal(const string indicator_name,const ENUM_TIMEFRAMES timeframe,const string signal_mode,int &direction)
  {
   MqlRates current_bar;
   MqlRates previous_bar;
   if(!ReadSignalBarAtShift(timeframe,1,current_bar))
      return(false);
   if(!ReadSignalBarAtShift(timeframe,2,previous_bar))
      return(false);

   double current_upper=0.0;
   double current_middle=0.0;
   double current_lower=0.0;
   double previous_upper=0.0;
   double previous_middle=0.0;
   double previous_lower=0.0;
   if(!ReadChannelBandsAtShift(indicator_name,timeframe,1,current_upper,current_middle,current_lower))
      return(false);
   if(!ReadChannelBandsAtShift(indicator_name,timeframe,2,previous_upper,previous_middle,previous_lower))
      return(false);

   ENUM_APPLIED_PRICE applied_price=ResolveAppliedPrice(g_config.signals.channels.price_mode);
   double current_price=ResolveBarPrice(current_bar,applied_price);
   double previous_price=ResolveBarPrice(previous_bar,applied_price);
   int current_position=ClassifyBandPosition(current_price,current_upper,current_lower);
   int previous_position=ClassifyBandPosition(previous_price,previous_upper,previous_lower);

   direction=0;
   if(signal_mode=="Fechou fora")
     {
      return(ResolveBandDirection(current_position,direction));
     }

   if(signal_mode=="Fechou fora e voltou")
     {
      if(previous_position>0 && current_position==0)
         direction=-1;
      else if(previous_position<0 && current_position==0)
         direction=1;
      return(direction!=0);
     }

   if(signal_mode=="Fechou dentro e saiu")
     {
      if(previous_position==0)
         return(ResolveBandDirection(current_position,direction));
      return(false);
     }

   if(signal_mode=="Estando fora")
     {
      if(previous_position==current_position && current_position!=0)
         return(ResolveBandDirection(current_position,direction));
      return(false);
     }

   return(false);
  }

bool EvaluateBollingerSignal(const ENUM_TIMEFRAMES timeframe,int &direction)
  {
   return(EvaluateChannelSignal("Bandas de Bollinger",timeframe,NormalizeText(g_config.signals.channels.signal),direction));
  }

bool EvaluateKeltnerSignal(const ENUM_TIMEFRAMES timeframe,int &direction)
  {
   return(EvaluateChannelSignal("Keltner",timeframe,NormalizeText(g_config.signals.channels.signal),direction));
  }

bool EvaluateSignalChannels(const ENUM_TIMEFRAMES timeframe,int &direction)
  {
   direction=0;
   if(!g_config.signals.channels.enabled)
      return(true);

   string indicator_name=NormalizeText(g_config.signals.channels.indicator);
   bool evaluated=false;
   if(indicator_name=="Bandas de Bollinger")
      evaluated=EvaluateBollingerSignal(timeframe,direction);
   else if(indicator_name=="Keltner")
      evaluated=EvaluateKeltnerSignal(timeframe,direction);
   else
     {
      Print("AlphaForge V3: indicador de canais ainda nao suportado no runtime: ",indicator_name);
      return(false);
     }

   if(!evaluated)
      return(false);

   return(direction!=0);
  }

int ResolveSignalDirection(const MqlRates &signal_bar)
  {
   // For non-directional criteria like the current candle filter, honor the
   // direction selected in the CTk when exactly one side is marked.
   int configured_direction=ResolveConfiguredSignalDirection();
   if(configured_direction!=0)
      return(configured_direction);

   if(signal_bar.close>signal_bar.open)
      return(1);
   if(signal_bar.close<signal_bar.open)
      return(-1);
  return(0);
  }

int ResolveReferenceBarShift(const ESignalLimitReferenceCandle candle_name)
  {
   if(candle_name==CandleUltimo)
      return(1);
   if(candle_name==CandlePenultimo)
      return(2);
   if(candle_name==CandleAntepenultimo)
      return(3);
   return(0);
  }

double ResolveReferencePrice(const MqlRates &reference_bar,const ESignalLimitReferenceBase reference_name)
  {
   if(reference_name==BaseMinima)
      return(reference_bar.low);
   if(reference_name==BaseAbertura)
      return(reference_bar.open);
   if(reference_name==BaseFechamento)
      return(reference_bar.close);
   return(reference_bar.high);
  }

int ResolveExpirationCandles(const ESignalLimitExpiration expire_name)
  {
   if(expire_name==Expirar1Candle)
      return(1);
   if(expire_name==Expirar2Candles)
      return(2);
   if(expire_name==Expirar3Candles)
      return(3);
   if(expire_name==Expirar4Candles)
      return(4);
   return(0);
  }

int ResolvePendingMoveReferenceBarShift(const ESignalLimitReferenceCandle candle_name)
  {
   int shift=ResolveReferenceBarShift(candle_name);
   if(shift<=0)
      return(1);
   return(shift);
  }

int ResolvePendingElapsedClosedCandles(const ENUM_TIMEFRAMES timeframe,const datetime setup_time)
  {
   if(setup_time<=0)
      return(0);

   int shift=iBarShift(_Symbol,timeframe,setup_time,false);
   if(shift<0)
      return(0);

   return(shift);
  }

void LogPendingExpirationProgress(const ENUM_TIMEFRAMES timeframe,const ulong ticket,const datetime setup_time)
  {
   int total_candles=ResolveExpirationCandles(g_config.signals.limit.reference.expire);
   if(total_candles<=0)
      return;

   datetime current_bar_time=iTime(_Symbol,timeframe,0);
   if(current_bar_time<=0)
      return;

   int setup_shift=ResolvePendingElapsedClosedCandles(timeframe,setup_time);
   if(setup_shift<=0)
      return;

   datetime count_start_bar_time=iTime(_Symbol,timeframe,setup_shift);
   int elapsed_candles=setup_shift;
   if(elapsed_candles>total_candles)
      elapsed_candles=total_candles;

   Print(
      "AlphaForge V3: contagem da expiracao da pendente. Ticket=",ticket,
      " Fechados=",IntegerToString(elapsed_candles),"/",IntegerToString(total_candles),
      " InicioContagem=",TimeToString(count_start_bar_time,TIME_DATE|TIME_MINUTES),
      " CandleAtual=",TimeToString(current_bar_time,TIME_DATE|TIME_MINUTES)
   );
  }

void UpdateLimitReferencePendingOrder(const ENUM_TIMEFRAMES timeframe)
  {
   if(g_config.signals.order_mode!=ModoOrdemLimite)
      return;
   if(g_config.signals.limit.mode!=ModoLimiteReferencia)
      return;
   if(HasOpenPositionForSymbol())
      return;

   ulong ticket=0;
   ENUM_ORDER_TYPE order_type=WRONG_VALUE;
   datetime expiration=0;
   ENUM_ORDER_TYPE_TIME order_time=ORDER_TIME_GTC;
   double current_price=0.0;
   datetime setup_time=0;
   if(!FindPendingLimitOrderForSymbol(ticket,order_type,expiration,order_time,current_price,setup_time))
      return;

   int expiration_candles=ResolveExpirationCandles(g_config.signals.limit.reference.expire);
   int elapsed_candles=ResolvePendingElapsedClosedCandles(timeframe,setup_time);
   LogPendingExpirationProgress(timeframe,ticket,setup_time);

   if(expiration_candles>0 && elapsed_candles>=expiration_candles)
     {
      g_trade.SetExpertMagicNumber(ResolveMagicNumberValue());
      if(!g_trade.OrderDelete(ticket))
        {
         Print(
            "AlphaForge V3: falha ao cancelar pendente expirada. Ticket=",ticket,
            " Retcode=",g_trade.ResultRetcode(),
            " Desc=",g_trade.ResultRetcodeDescription()
         );
        }
      else
        {
         Print(
            "AlphaForge V3: pendente cancelada por expiracao em candles. Ticket=",ticket,
            " Fechados=",IntegerToString(elapsed_candles),"/",IntegerToString(expiration_candles)
         );
        }
      return;
     }

   if(!g_config.signals.limit.reference.move_next_candle)
      return;

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
   int pending_direction=(order_type==ORDER_TYPE_BUY_LIMIT) ? 1 : -1;
   double updated_stop_loss=ResolveStopLossPrice(pending_direction,updated_price);
   double updated_take_profit=ResolveTakeProfitPrice(pending_direction,updated_price,updated_stop_loss);

   if(IsStopLossRequired() && updated_stop_loss<=0.0)
     {
      Print(
         "AlphaForge V3: movimento da ordem limite ignorado porque o stop loss configurado ficou invalido.",
         " Ticket=",ticket,
         " NovoPreco=",DoubleToString(updated_price,_Digits),
         " Mode=",ResolveEffectiveStopLossMode()
      );
      return;
     }

   if(IsTakeProfitRequired() && updated_take_profit<=0.0)
     {
      Print(
         "AlphaForge V3: movimento da ordem limite ignorado porque o take profit configurado ficou invalido.",
         " Ticket=",ticket,
         " NovoPreco=",DoubleToString(updated_price,_Digits),
         " Mode=",ResolveEffectiveTakeProfitMode()
      );
      return;
     }

   if(updated_price<=0.0)
      return;

   if(MathAbs(updated_price-current_price)<=(_Point/2.0))
      return;

   g_trade.SetExpertMagicNumber(ResolveMagicNumberValue());
   g_trade.SetTypeFillingBySymbol(_Symbol);
   g_trade.SetDeviationInPoints(20);

   if(!g_trade.OrderModify(ticket,updated_price,updated_stop_loss,updated_take_profit,order_time,expiration))
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
      " SL=",DoubleToString(updated_stop_loss,_Digits),
      " TP=",DoubleToString(updated_take_profit,_Digits),
      " Base=",ReferenceBaseToText(g_config.signals.limit.reference.base),
      " Candle=",ReferenceCandleToText(g_config.signals.limit.reference.candle)
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

   double entry_price=direction>0 ? tick.ask : tick.bid;
   double stop_loss_price=ResolveStopLossPrice(direction,entry_price);
   double take_profit_price=ResolveTakeProfitPrice(direction,entry_price,stop_loss_price);

   if(IsStopLossRequired() && stop_loss_price<=0.0)
     {
      Print(
         "AlphaForge V3: ordem a mercado bloqueada porque o stop loss configurado ficou invalido.",
         " Direcao=",IntegerToString(direction),
         " Entry=",DoubleToString(entry_price,_Digits),
         " Mode=",ResolveEffectiveStopLossMode()
      );
      return(false);
     }

   if(IsTakeProfitRequired() && take_profit_price<=0.0)
     {
      Print(
         "AlphaForge V3: ordem a mercado bloqueada porque o take profit configurado ficou invalido.",
         " Direcao=",IntegerToString(direction),
         " Entry=",DoubleToString(entry_price,_Digits),
         " Mode=",ResolveEffectiveTakeProfitMode()
      );
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
      sent=g_trade.Buy(volume,_Symbol,0.0,stop_loss_price,take_profit_price,comment);
   else
      sent=g_trade.Sell(volume,_Symbol,0.0,stop_loss_price,take_profit_price,comment);

   if(!sent)
     {
      Print("AlphaForge V3: falha ao enviar ordem. Retcode=",g_trade.ResultRetcode()," Desc=",g_trade.ResultRetcodeDescription());
      return(false);
     }

  Print(
     "AlphaForge V3: ordem a mercado enviada com sucesso. Ticket=",g_trade.ResultOrder(),
     " Volume=",DoubleToString(volume,2),
      " SL=",DoubleToString(stop_loss_price,_Digits),
      " TP=",DoubleToString(take_profit_price,_Digits),
      " TipoSL=",g_config.stop_loss.measure,
     " DistSL=",DoubleToString(ResolveConfiguredStopLossDistance(),2),
      " DistTP=",DoubleToString(ResolveConfiguredTakeProfitDistance(),2)
  );
  return(true);
  }

bool SubmitLimitReferenceOrder(const int direction,const ENUM_TIMEFRAMES timeframe,const MqlRates &signal_bar)
  {
   if(direction==0)
     {
      Print("AlphaForge V3: vela neutra; nenhuma ordem limite enviada.");
      return(false);
     }

   if(g_config.signals.limit.mode!=ModoLimiteReferencia)
     {
      Print("AlphaForge V3: modo de ordem limite ainda nao suportado: ",LimitModeToText(g_config.signals.limit.mode));
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

   double volume=NormalizeVolume(ResolveInitialVolume());
   if(volume<=0.0)
     {
      Print("AlphaForge V3: volume invalido para ordem limite.");
      return(false);
     }

   double stop_loss_price=ResolveStopLossPrice(direction,pending_price);
   double take_profit_price=ResolveTakeProfitPrice(direction,pending_price,stop_loss_price);

   if(IsStopLossRequired() && stop_loss_price<=0.0)
     {
      Print(
         "AlphaForge V3: ordem limite bloqueada porque o stop loss configurado ficou invalido.",
         " Direcao=",IntegerToString(direction),
         " Preco=",DoubleToString(pending_price,_Digits),
         " Mode=",ResolveEffectiveStopLossMode()
      );
      return(false);
     }

   if(IsTakeProfitRequired() && take_profit_price<=0.0)
     {
      Print(
         "AlphaForge V3: ordem limite bloqueada porque o take profit configurado ficou invalido.",
         " Direcao=",IntegerToString(direction),
         " Preco=",DoubleToString(pending_price,_Digits),
         " Mode=",ResolveEffectiveTakeProfitMode()
      );
      return(false);
     }

   g_trade.SetExpertMagicNumber(ResolveMagicNumberValue());
   g_trade.SetTypeFillingBySymbol(_Symbol);
   g_trade.SetDeviationInPoints(20);

   int expiration_candles=ResolveExpirationCandles(g_config.signals.limit.reference.expire);
   datetime expiration_count_start=iTime(_Symbol,timeframe,0);

   string comment=StringFormat(
      "AlphaForgeV3 LIMIT %s tf=%d candle=%s",
      direction>0 ? "BUY" : "SELL",
      (int)timeframe,
      TimeToString(signal_bar.time,TIME_DATE|TIME_MINUTES)
   );

   bool sent=false;
   if(direction>0)
      sent=g_trade.BuyLimit(volume,pending_price,_Symbol,stop_loss_price,take_profit_price,ORDER_TIME_GTC,0,comment);
   else
      sent=g_trade.SellLimit(volume,pending_price,_Symbol,stop_loss_price,take_profit_price,ORDER_TIME_GTC,0,comment);

   if(!sent)
     {
      Print("AlphaForge V3: falha ao enviar ordem limite. Retcode=",g_trade.ResultRetcode()," Desc=",g_trade.ResultRetcodeDescription());
      return(false);
     }

   Print(
      "AlphaForge V3: ordem limite por referencia enviada. Ticket=",g_trade.ResultOrder(),
      " Preco=",DoubleToString(pending_price,_Digits),
      " SL=",DoubleToString(stop_loss_price,_Digits),
      " TP=",DoubleToString(take_profit_price,_Digits),
      " TipoSL=",g_config.stop_loss.measure,
      " DistSL=",DoubleToString(ResolveConfiguredStopLossDistance(),2),
      " DistTP=",DoubleToString(ResolveConfiguredTakeProfitDistance(),2),
      " BaseSL=",ReferenceBaseToText(g_config.stop_loss.reference.base),
      " CandleSL=",ReferenceCandleToText(g_config.stop_loss.reference.candle),
      " Base=",ReferenceBaseToText(g_config.signals.limit.reference.base),
      " Candle=",ReferenceCandleToText(g_config.signals.limit.reference.candle),
      " Dist=",DoubleToString(g_config.signals.limit.reference.distance,2)
   );

   if(expiration_count_start>0 && expiration_candles>0)
     {
      Print(
         "AlphaForge V3: expiracao manual da ordem pendente. Sinal=",
         TimeToString(signal_bar.time,TIME_DATE|TIME_MINUTES),
         " InicioContagem=",
         TimeToString(expiration_count_start,TIME_DATE|TIME_MINUTES),
         " Candles=",
         IntegerToString(expiration_candles),
         " Regra=cancelar quando fechar o candle ",
         IntegerToString(expiration_candles),
         " apos o sinal, se a pendente nao executar"
      );
     }
   else
     {
      Print(
         "AlphaForge V3: expiracao da ordem pendente desabilitada. Sinal=",
         TimeToString(signal_bar.time,TIME_DATE|TIME_MINUTES)
      );
     }
   return(true);
  }

void EvaluateAndTrade()
  {
   if(!HasAnySignalCriteriaEnabled())
      return;

   ENUM_TIMEFRAMES timeframe=g_config.signals.filter.timeframe;
   if(!IsNewSignalBar(timeframe))
      return;

   UpdateLimitReferencePendingOrder(timeframe);

   MqlRates signal_bar;
   if(!ReadClosedSignalBar(timeframe,signal_bar))
     {
      Print("AlphaForge V3: nao foi possivel ler a vela fechada do sinal.");
      return;
     }

   if(g_config.signals.filter.enabled && !EvaluateSignalFilter(signal_bar))
      return;

   int direction=0;
   if(g_config.signals.channels.enabled)
     {
      if(!EvaluateSignalChannels(timeframe,direction))
         return;
     }
   else
     {
      direction=ResolveSignalDirection(signal_bar);
     }

   if(direction==0)
      return;

   DrawSignalMarker(direction,timeframe,signal_bar);
   ESignalOrderMode order_mode=g_config.signals.order_mode;
   if(order_mode==ModoOrdemMercado)
     {
      SubmitMarketOrder(direction,timeframe,signal_bar);
      return;
     }

   if(order_mode==ModoOrdemLimite)
     {
      SubmitLimitReferenceOrder(direction,timeframe,signal_bar);
      return;
     }
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
   ObjectSetInteger(0,name,OBJPROP_YSIZE,40);
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,11);
   ObjectSetInteger(0,name,OBJPROP_COLOR,C'249,243,233');
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,back_color);
   ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,C'200,148,99');
   ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,true);
   ObjectSetInteger(0,name,OBJPROP_ZORDER,1);
   ObjectSetString(0,name,OBJPROP_FONT,"Segoe UI Semibold");
   ObjectSetString(0,name,OBJPROP_TEXT,text);
   return(true);
  }

bool CreateControlPanel()
  {
   if(ObjectFind(0,BUTTON_CARD_NAME)<0)
     {
      if(!ObjectCreate(0,BUTTON_CARD_NAME,OBJ_RECTANGLE_LABEL,0,0,0))
         return(false);
     }

   ObjectSetInteger(0,BUTTON_CARD_NAME,OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,BUTTON_CARD_NAME,OBJPROP_XDISTANCE,14);
   ObjectSetInteger(0,BUTTON_CARD_NAME,OBJPROP_YDISTANCE,14);
   ObjectSetInteger(0,BUTTON_CARD_NAME,OBJPROP_XSIZE,236);
   ObjectSetInteger(0,BUTTON_CARD_NAME,OBJPROP_YSIZE,48);
   ObjectSetInteger(0,BUTTON_CARD_NAME,OBJPROP_BGCOLOR,C'43,57,80');
   ObjectSetInteger(0,BUTTON_CARD_NAME,OBJPROP_BORDER_COLOR,C'54,71,99');
   ObjectSetInteger(0,BUTTON_CARD_NAME,OBJPROP_COLOR,C'54,71,99');
   ObjectSetInteger(0,BUTTON_CARD_NAME,OBJPROP_BACK,false);
   ObjectSetInteger(0,BUTTON_CARD_NAME,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,BUTTON_CARD_NAME,OBJPROP_HIDDEN,true);
   ObjectSetInteger(0,BUTTON_CARD_NAME,OBJPROP_ZORDER,0);

   if(!CreateButtonObject(BUTTON_CREATE_NAME,"Abrir AlphaForge V3",22,18,228,C'230,118,59'))
      return(false);

   ChartRedraw();
   return(true);
  }

void DestroyControlPanel()
  {
   ObjectDelete(0,BUTTON_CREATE_NAME);
   ObjectDelete(0,BUTTON_CARD_NAME);
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
   LogSymbolTradeDiagnostics();

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
   RefreshRuntimeComment();

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
      Comment("");
     }
   if(HasInteractiveChart())
      g_chart_theme.RestoreTheme();
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   EnforceManualStopLoss();
   EnforceManualTakeProfit();
   EvaluateAndTrade();
   if(HasInteractiveChart())
      RefreshRuntimeComment();
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
      RefreshRuntimeComment();
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
