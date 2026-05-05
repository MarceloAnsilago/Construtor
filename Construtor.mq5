#property strict

#include "Construtor\\Settings.mqh"
#include "Construtor\\UI\\V2\\EasyPanelV2.mqh"

input string InpEstrategiaNome = "Minha estrategia";
input ENUM_CONSTRUTOR_MERCADO InpMercadoDesejado = CONSTRUTOR_MERCADO_B3;
input ENUM_CONSTRUTOR_TIPO_OPERACIONAL InpTipoOperacional = CONSTRUTOR_TIPO_DAY_TRADE;
input ENUM_CONSTRUTOR_MODO_PROCESSAMENTO InpModoProcessamento = CONSTRUTOR_MODO_CADA_TICK;
input ENUM_CONSTRUTOR_SIM_NAO InpOperarCompra = CONSTRUTOR_SIM;
input ENUM_CONSTRUTOR_SIM_NAO InpOperarVenda = CONSTRUTOR_SIM;
input int InpInicioHora = 9;
input int InpInicioMinuto = 0;
input int InpFimHora = 17;
input int InpFimMinuto = 0;
input ENUM_CONSTRUTOR_SIM_NAO InpZerarPosicoes = CONSTRUTOR_NAO;
input string InpHorarioZeragem = "17:30";
input ENUM_CONSTRUTOR_TEMPO_GRAFICO InpTempoGrafico = CONSTRUTOR_CORRENTE;
input double InpVolumeInicial = 1.0;
input int InpSpreadMaximo = 10;

// Stop loss
input ENUM_CONSTRUTOR_SIM_NAO InpUsarStopLoss = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_TIPO_STOP_LOSS InpTipoStopLoss = CONSTRUTOR_STOP_PONTOS;
input ENUM_CONSTRUTOR_SIM_NAO InpStopFixo = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpStopCalculo = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpStopCalculoMedia = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpStopCalculoMultiplicar = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpStopCalculoReferencia = CONSTRUTOR_NAO;
input double InpStopFixoDistancia = 100.0;
input int InpStopCalculoMediaQtdCandles = 3;
input ENUM_CONSTRUTOR_BASE_MEDIA InpStopCalculoMediaBase = CONSTRUTOR_MEDIA_MAXIMA;
input double InpStopCalculoMediaDistancia = 0.0;
input int InpStopCalculoMediaExpirar = 0; // 0=Nao expirar, 1..4=candles
input ENUM_CONSTRUTOR_BASE_MULTIPLICAR InpStopCalculoMultiplicarBase = CONSTRUTOR_MULTIPLICAR_CORPO;
input int InpStopCalculoMultiplicarCandle = 3;
input double InpStopCalculoMultiplicarQtd = 1.0;
input ENUM_CONSTRUTOR_BASE_MEDIA InpStopCalculoReferenciaBase = CONSTRUTOR_MEDIA_MAXIMA;
input ENUM_CONSTRUTOR_POSICAO_REFERENCIA InpStopCalculoReferenciaPosicao = CONSTRUTOR_POSICAO_ATUAL;
input double InpStopCalculoReferenciaDistancia = 0.0;
input int InpStopCalculoReferenciaExpirar = 0; // 0=Nao expirar, 1..4=candles

// Take profit
input ENUM_CONSTRUTOR_SIM_NAO InpUsarTakeProfit = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_TIPO_STOP_LOSS InpTipoTakeProfit = CONSTRUTOR_STOP_PONTOS;
input ENUM_CONSTRUTOR_SIM_NAO InpTakeFixo = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpTakeCalculo = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpTakeCalculoMedia = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpTakeCalculoMultiplicar = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpTakeCalculoMaxmin = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_BASE_MEDIA InpTakeCalculoMaxminBase = CONSTRUTOR_MEDIA_MAXIMA;
input int InpTakeCalculoMaxminUltimos = 3;
input double InpTakeCalculoReferenciaDistancia = 0.0;
input int InpTakeCalculoReferenciaExpirar = 0;
input double InpTakeCalculoMediaDistancia = 0.0;
input int InpTakeCalculoMediaExpirar = 0;
input ENUM_CONSTRUTOR_SIM_NAO InpTakeCalculoReferencia = CONSTRUTOR_NAO;
input int InpTakeCalculoMediaQtdCandles = 3;
input ENUM_CONSTRUTOR_BASE_MEDIA InpTakeCalculoMediaBase = CONSTRUTOR_MEDIA_MAXIMA;
input ENUM_CONSTRUTOR_BASE_MULTIPLICAR InpTakeCalculoMultiplicarBase = CONSTRUTOR_MULTIPLICAR_CORPO;
input int InpTakeCalculoMultiplicarCandle = 3;
input double InpTakeCalculoMultiplicarQtd = 1.0;
input ENUM_CONSTRUTOR_BASE_MEDIA InpTakeCalculoReferenciaBase = CONSTRUTOR_MEDIA_MAXIMA;
input ENUM_CONSTRUTOR_POSICAO_REFERENCIA InpTakeCalculoReferenciaPosicao = CONSTRUTOR_POSICAO_ATUAL;
input double InpTakeFixoDistancia = 100.0;

// Trailing stop
input ENUM_CONSTRUTOR_SIM_NAO InpTrailingStop = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_TIPO_STOP_LOSS InpTipoTrailingStop = CONSTRUTOR_STOP_PONTOS;
input ENUM_CONSTRUTOR_STOP_MOVEL_MODO InpTrailingStopModo = CONSTRUTOR_STOP_MOVEL_PADRAO;
input ENUM_CONSTRUTOR_STOP_MOVEL_CANDLES_MODO InpTrailingStopCandlesModo = CONSTRUTOR_STOP_MOVEL_CANDLES_DISTANCIA;
input int InpTrailingStopPadraoAdicionarFavor = 0;
input int InpTrailingStopPadraoPasso = 0;
input double InpTrailingStopCandlesDistancia = 0.0;
input ENUM_CONSTRUTOR_BASE_MEDIA InpTrailingStopCandlesPosicao = CONSTRUTOR_MEDIA_MAXIMA;
input int InpTrailingStopCandlesCount = 1;
input ENUM_CONSTRUTOR_BASE_MEDIA InpTrailingStopCandlesCountPosicao = CONSTRUTOR_MEDIA_MAXIMA;
input ENUM_CONSTRUTOR_STOP_MOVEL_INDICADOR InpTrailingStopIndicador = CONSTRUTOR_STOP_IND_ATR;

SConstrutorSettings g_settings;
CConstrutorEasyPanelV2 *g_panel_new=NULL;

string LAUNCHER_BG_NAME="ConstrutorLauncherBg";
string LAUNCHER_PANEL_BUTTON_NAME="ConstrutorLauncherPanelButton";

void Construtor_ToggleEasyPanel(void)
  {
   if(g_panel_new!=NULL && g_panel_new.IsVisible())
     {
      g_panel_new.HidePanel();
      return;
     }
   ShowNewPanel();
  }

bool CreateLauncherBackground(void)
  {
   if(ObjectFind(0,LAUNCHER_BG_NAME)>=0)
      return(true);
   if(!ObjectCreate(0,LAUNCHER_BG_NAME,OBJ_RECTANGLE_LABEL,0,0,0))
      return(false);
   ObjectSetInteger(0,LAUNCHER_BG_NAME,OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,LAUNCHER_BG_NAME,OBJPROP_XDISTANCE,12);
   ObjectSetInteger(0,LAUNCHER_BG_NAME,OBJPROP_YDISTANCE,24);
   ObjectSetInteger(0,LAUNCHER_BG_NAME,OBJPROP_XSIZE,240);
   ObjectSetInteger(0,LAUNCHER_BG_NAME,OBJPROP_YSIZE,96);
   ObjectSetInteger(0,LAUNCHER_BG_NAME,OBJPROP_BGCOLOR,clrWhiteSmoke);
   ObjectSetInteger(0,LAUNCHER_BG_NAME,OBJPROP_COLOR,clrSilver);
   ObjectSetInteger(0,LAUNCHER_BG_NAME,OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0,LAUNCHER_BG_NAME,OBJPROP_BACK,false);
   ObjectSetInteger(0,LAUNCHER_BG_NAME,OBJPROP_HIDDEN,true);
   ObjectSetInteger(0,LAUNCHER_BG_NAME,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,LAUNCHER_BG_NAME,OBJPROP_SELECTED,false);
   ObjectSetInteger(0,LAUNCHER_BG_NAME,OBJPROP_ZORDER,0);
   return(true);
  }

bool CreateLauncherButton(const string name,const string text,const int y_distance)
  {
   if(ObjectFind(0,name)<0 && !ObjectCreate(0,name,OBJ_BUTTON,0,0,0))
      return(false);
   ObjectSetInteger(0,name,OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,24);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y_distance);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,216);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,28);
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,clrGainsboro);
   ObjectSetInteger(0,name,OBJPROP_COLOR,clrBlack);
   ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,clrSilver);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,true);
   ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,name,OBJPROP_SELECTED,false);
   ObjectSetInteger(0,name,OBJPROP_ZORDER,1);
   ObjectSetString(0,name,OBJPROP_TEXT,text);
   return(true);
  }

bool CreateLauncher(void)
  {
   if(!CreateLauncherBackground())
      return(false);
   if(!CreateLauncherButton(LAUNCHER_PANEL_BUTTON_NAME,"Abrir Painel",34))
      return(false);
   return(true);
  }

void DeleteLauncherObject(const string name)
  {
   if(ObjectFind(0,name)>=0)
      ObjectDelete(0,name);
  }

void DeleteLauncher(void)
  {
   DeleteLauncherObject(LAUNCHER_PANEL_BUTTON_NAME);
   DeleteLauncherObject(LAUNCHER_BG_NAME);
  }

bool EnsureNewPanel(void)
  {
   if(g_panel_new==NULL)
      g_panel_new=new CConstrutorEasyPanelV2();
   return(g_panel_new!=NULL);
  }

bool ShowNewPanel(void)
  {
   if(!EnsureNewPanel())
      return(false);
   g_panel_new.SetSettings(g_settings);
   return(g_panel_new.ShowPanel());
  }

void DestroyNewPanel(void)
  {
   if(g_panel_new==NULL)
      return;
   g_panel_new.Shutdown();
   delete g_panel_new;
   g_panel_new=NULL;
  }

void LoadInputsToSettings(void)
  {
   // General
   g_settings.estrategia_nome    =InpEstrategiaNome;
   g_settings.mercado            =InpMercadoDesejado;
   g_settings.tipo_operacional    =InpTipoOperacional;
   g_settings.modo_processamento  =InpModoProcessamento;
   g_settings.operar_compra       =InpOperarCompra;
   g_settings.operar_venda        =InpOperarVenda;
   g_settings.inicio_hora         =InpInicioHora;
   g_settings.inicio_minuto       =InpInicioMinuto;
   g_settings.fim_hora            =InpFimHora;
   g_settings.fim_minuto          =InpFimMinuto;
   g_settings.zerar_posicoes      =InpZerarPosicoes;
   g_settings.horario_zeragem     =InpHorarioZeragem;
   g_settings.tempo_grafico       =InpTempoGrafico;
   g_settings.volume_inicial      =InpVolumeInicial;
   g_settings.spread_maximo       =InpSpreadMaximo;

   // Stop loss
   g_settings.usar_stop_loss      =InpUsarStopLoss;
   g_settings.tipo_stop_loss      =InpTipoStopLoss;
   g_settings.stop_fixo           =InpStopFixo;
   g_settings.stop_calculo        =InpStopCalculo;
   g_settings.stop_calculo_media  =InpStopCalculoMedia;
   g_settings.stop_calculo_multiplicar=InpStopCalculoMultiplicar;
   g_settings.stop_calculo_referencia=InpStopCalculoReferencia;
   g_settings.stop_fixo_distancia  =InpStopFixoDistancia;
   g_settings.stop_calculo_media_qtd_candles=InpStopCalculoMediaQtdCandles;
   g_settings.stop_calculo_media_base=InpStopCalculoMediaBase;
   g_settings.stop_calculo_media_distancia=InpStopCalculoMediaDistancia;
   g_settings.stop_calculo_media_expirar=InpStopCalculoMediaExpirar;
   g_settings.stop_calculo_multiplicar_base=InpStopCalculoMultiplicarBase;
   g_settings.stop_calculo_multiplicar_candle=InpStopCalculoMultiplicarCandle;
   g_settings.stop_calculo_multiplicar_qtd=InpStopCalculoMultiplicarQtd;
   g_settings.stop_calculo_referencia_base=InpStopCalculoReferenciaBase;
   g_settings.stop_calculo_referencia_posicao=InpStopCalculoReferenciaPosicao;
   g_settings.stop_calculo_referencia_distancia=InpStopCalculoReferenciaDistancia;
   g_settings.stop_calculo_referencia_expirar=InpStopCalculoReferenciaExpirar;

   // Take profit
   g_settings.take_profit         =InpUsarTakeProfit;
   g_settings.tipo_take_profit    =InpTipoTakeProfit;
   g_settings.take_fixo           =InpTakeFixo;
   g_settings.take_calculo        =InpTakeCalculo;
   g_settings.take_calculo_media  =InpTakeCalculoMedia;
   g_settings.take_calculo_multiplicar=InpTakeCalculoMultiplicar;
   g_settings.take_calculo_maxmin=InpTakeCalculoMaxmin;
   g_settings.take_calculo_referencia=InpTakeCalculoReferencia;
   g_settings.take_calculo_media_qtd_candles=InpTakeCalculoMediaQtdCandles;
   g_settings.take_calculo_media_base=InpTakeCalculoMediaBase;
   g_settings.take_calculo_multiplicar_base=InpTakeCalculoMultiplicarBase;
   g_settings.take_calculo_multiplicar_candle=InpTakeCalculoMultiplicarCandle;
   g_settings.take_calculo_multiplicar_qtd=InpTakeCalculoMultiplicarQtd;
   g_settings.take_calculo_referencia_base=InpTakeCalculoReferenciaBase;
   g_settings.take_calculo_referencia_posicao=InpTakeCalculoReferenciaPosicao;
   g_settings.take_fixo_distancia  =InpTakeFixoDistancia;
   g_settings.take_calculo_maxmin_base=InpTakeCalculoMaxminBase;
   g_settings.take_calculo_maxmin_ultimos=InpTakeCalculoMaxminUltimos;
   g_settings.take_calculo_referencia_distancia=InpTakeCalculoReferenciaDistancia;
   g_settings.take_calculo_referencia_expirar=InpTakeCalculoReferenciaExpirar;
   g_settings.take_calculo_media_distancia=InpTakeCalculoMediaDistancia;
   g_settings.take_calculo_media_expirar=InpTakeCalculoMediaExpirar;

   // Trailing stop
   g_settings.trailing_stop       =InpTrailingStop;
   g_settings.tipo_trailing_stop  =InpTipoTrailingStop;
   g_settings.trailing_stop_modo  =InpTrailingStopModo;
   g_settings.trailing_stop_candles_modo=InpTrailingStopCandlesModo;
   g_settings.trailing_stop_padrao_adicionar_favor=InpTrailingStopPadraoAdicionarFavor;
   g_settings.trailing_stop_padrao_passo=InpTrailingStopPadraoPasso;
   g_settings.trailing_stop_candles_distancia=InpTrailingStopCandlesDistancia;
   g_settings.trailing_stop_candles_posicao=InpTrailingStopCandlesPosicao;
   g_settings.trailing_stop_candles_count=InpTrailingStopCandlesCount;
   g_settings.trailing_stop_candles_count_posicao=InpTrailingStopCandlesCountPosicao;
   g_settings.trailing_stop_indicador=InpTrailingStopIndicador;

   // Stop movel tem parametrizacao propria via EasyPanel (nao herda do Trailing stop).
   g_settings.stop_movel=CONSTRUTOR_NAO;
   g_settings.tipo_stop_movel=CONSTRUTOR_STOP_PONTOS;
   g_settings.stop_movel_modo=CONSTRUTOR_STOP_MOVEL_PADRAO;
   g_settings.stop_movel_candles_modo=CONSTRUTOR_STOP_MOVEL_CANDLES_DISTANCIA;
   g_settings.stop_movel_padrao_adicionar_favor=0;
   g_settings.stop_movel_padrao_passo=0;
   g_settings.stop_movel_candles_disparo_distancia=0.0;
   g_settings.stop_movel_candles_posicao=CONSTRUTOR_MEDIA_MAXIMA;
   g_settings.stop_movel_candles_candle_posicao=CONSTRUTOR_MEDIA_MAXIMA;
   g_settings.stop_movel_candles_distancia=0.0;
   g_settings.stop_movel_indicador_disparo_distancia=0.0;
   g_settings.stop_movel_indicador=CONSTRUTOR_STOP_IND_ATR;

   // Partial exits (configured via EasyPanel)
   g_settings.saida_parcial       =CONSTRUTOR_NAO;
   g_settings.tipo_saida_parcial  =CONSTRUTOR_STOP_PONTOS;
   g_settings.saida_parcial_valor[0]=0.0;
   g_settings.saida_parcial_distancia[0]=0.0;
   for(int i=1; i<6; i++)
     {
      g_settings.saida_parcial_valor[i]=0.0;
      g_settings.saida_parcial_distancia[i]=0.0;
     }
  }

int OnInit()
  {
   LoadInputsToSettings();
   if(!CreateLauncher())
      return(INIT_FAILED);
   if(!ShowNewPanel())
     {
      Print(__FUNCTION__,": falha ao abrir o painel V2.");
      return(INIT_FAILED);
     }
   EventSetTimer(1);
   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason)
  {
   EventKillTimer();
   DestroyNewPanel();
   DeleteLauncher();
  }

void OnTick()
  {
  }

void OnTimer()
  {
   if(g_panel_new!=NULL && g_panel_new.IsVisible())
      g_panel_new.OnTimerEvent();
  }

void OnChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      if(sparam==LAUNCHER_PANEL_BUTTON_NAME)
        {
         ShowNewPanel();
         return;
        }
     }

   if(g_panel_new!=NULL && g_panel_new.IsVisible())
     {
      g_panel_new.ChartEvent(id,lparam,dparam,sparam);
      g_panel_new.ConsumeApply(g_settings);
     }
  }
