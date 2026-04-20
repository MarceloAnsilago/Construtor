#property strict

#include "Construtor\\ConstrutorDialog.mqh"

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
input ENUM_CONSTRUTOR_SIM_NAO InpUsarStopLoss = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_TIPO_STOP_LOSS InpTipoStopLoss = CONSTRUTOR_STOP_PONTOS;
input ENUM_CONSTRUTOR_SIM_NAO InpStopFixo = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpStopCalculo = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpStopCalculoMedia = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpStopCalculoMultiplicar = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpStopCalculoReferencia = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpUsarTakeProfit = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_TIPO_STOP_LOSS InpTipoTakeProfit = CONSTRUTOR_STOP_PONTOS;
input ENUM_CONSTRUTOR_SIM_NAO InpTakeFixo = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpTakeCalculo = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpTakeCalculoMedia = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpTakeCalculoMultiplicar = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_SIM_NAO InpTakeCalculoReferencia = CONSTRUTOR_NAO;
input int InpTakeCalculoMediaQtdCandles = 3;
input ENUM_CONSTRUTOR_BASE_MEDIA InpTakeCalculoMediaBase = CONSTRUTOR_MEDIA_MAXIMA;
input ENUM_CONSTRUTOR_BASE_MULTIPLICAR InpTakeCalculoMultiplicarBase = CONSTRUTOR_MULTIPLICAR_CORPO;
input int InpTakeCalculoMultiplicarCandle = 3;
input double InpTakeCalculoMultiplicarQtd = 1.0;
input ENUM_CONSTRUTOR_BASE_MEDIA InpTakeCalculoReferenciaBase = CONSTRUTOR_MEDIA_MAXIMA;
input ENUM_CONSTRUTOR_POSICAO_REFERENCIA InpTakeCalculoReferenciaPosicao = CONSTRUTOR_POSICAO_ATUAL;
input double InpTakeFixoDistancia = 100.0;
input ENUM_CONSTRUTOR_SIM_NAO InpStopMovel = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_TIPO_STOP_LOSS InpTipoStopMovel = CONSTRUTOR_STOP_PONTOS;
input ENUM_CONSTRUTOR_STOP_MOVEL_MODO InpStopMovelModo = CONSTRUTOR_STOP_MOVEL_PADRAO;
input ENUM_CONSTRUTOR_STOP_MOVEL_CANDLES_MODO InpStopMovelCandlesModo = CONSTRUTOR_STOP_MOVEL_CANDLES_DISTANCIA;
input int InpStopMovelPadraoAdicionarFavor = 0;
input int InpStopMovelPadraoPasso = 0;
input double InpStopMovelCandlesDistancia = 0.0;
input ENUM_CONSTRUTOR_BASE_MEDIA InpStopMovelCandlesPosicao = CONSTRUTOR_MEDIA_MAXIMA;
input int InpStopMovelCandlesCount = 1;
input ENUM_CONSTRUTOR_BASE_MEDIA InpStopMovelCandlesCountPosicao = CONSTRUTOR_MEDIA_MAXIMA;
input ENUM_CONSTRUTOR_STOP_MOVEL_INDICADOR InpStopMovelIndicador = CONSTRUTOR_STOP_IND_ATR;
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
input ENUM_CONSTRUTOR_SIM_NAO InpSaidaParcial = CONSTRUTOR_NAO;
input ENUM_CONSTRUTOR_TIPO_STOP_LOSS InpTipoSaidaParcial = CONSTRUTOR_STOP_PONTOS;
input double InpSaidaParcial1Valor = 0.0;
input double InpSaidaParcial1Distancia = 0.0;
input int InpStopCalculoMediaQtdCandles = 3;
input ENUM_CONSTRUTOR_BASE_MEDIA InpStopCalculoMediaBase = CONSTRUTOR_MEDIA_MAXIMA;
input ENUM_CONSTRUTOR_BASE_MULTIPLICAR InpStopCalculoMultiplicarBase = CONSTRUTOR_MULTIPLICAR_CORPO;
input int InpStopCalculoMultiplicarCandle = 3;
input double InpStopCalculoMultiplicarQtd = 1.0;
input ENUM_CONSTRUTOR_BASE_MEDIA InpStopCalculoReferenciaBase = CONSTRUTOR_MEDIA_MAXIMA;
input ENUM_CONSTRUTOR_POSICAO_REFERENCIA InpStopCalculoReferenciaPosicao = CONSTRUTOR_POSICAO_ATUAL;
input double InpStopFixoDistancia = 100.0;

CConstrutorDialog ExtDialog;
SConstrutorSettings g_settings;
CConstrutorEasyPanel *g_easy_panel=NULL;

void Construtor_ToggleEasyPanel(void)
  {
   if(g_easy_panel==NULL)
      g_easy_panel=new CConstrutorEasyPanel();
   if(g_easy_panel!=NULL)
      g_easy_panel.Toggle();
  }

void LoadInputsToSettings(void)
  {
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
   g_settings.usar_stop_loss      =InpUsarStopLoss;
   g_settings.tipo_stop_loss      =InpTipoStopLoss;
   g_settings.stop_fixo           =InpStopFixo;
   g_settings.stop_calculo        =InpStopCalculo;
   g_settings.stop_calculo_media  =InpStopCalculoMedia;
   g_settings.stop_calculo_multiplicar=InpStopCalculoMultiplicar;
   g_settings.stop_calculo_referencia=InpStopCalculoReferencia;
   g_settings.take_profit         =InpUsarTakeProfit;
   g_settings.tipo_take_profit    =InpTipoTakeProfit;
   g_settings.take_fixo           =InpTakeFixo;
   g_settings.take_calculo        =InpTakeCalculo;
   g_settings.take_calculo_media  =InpTakeCalculoMedia;
   g_settings.take_calculo_multiplicar=InpTakeCalculoMultiplicar;
   g_settings.take_calculo_referencia=InpTakeCalculoReferencia;
   g_settings.take_calculo_media_qtd_candles=InpTakeCalculoMediaQtdCandles;
   g_settings.take_calculo_media_base=InpTakeCalculoMediaBase;
   g_settings.take_calculo_multiplicar_base=InpTakeCalculoMultiplicarBase;
   g_settings.take_calculo_multiplicar_candle=InpTakeCalculoMultiplicarCandle;
   g_settings.take_calculo_multiplicar_qtd=InpTakeCalculoMultiplicarQtd;
   g_settings.take_calculo_referencia_base=InpTakeCalculoReferenciaBase;
   g_settings.take_calculo_referencia_posicao=InpTakeCalculoReferenciaPosicao;
   g_settings.take_fixo_distancia  =InpTakeFixoDistancia;
   g_settings.stop_movel          =InpStopMovel;
   g_settings.tipo_stop_movel     =InpTipoStopMovel;
   g_settings.stop_movel_modo     =InpStopMovelModo;
   g_settings.stop_movel_candles_modo=InpStopMovelCandlesModo;
   g_settings.stop_movel_padrao_adicionar_favor=InpStopMovelPadraoAdicionarFavor;
   g_settings.stop_movel_padrao_passo=InpStopMovelPadraoPasso;
   g_settings.stop_movel_candles_distancia=InpStopMovelCandlesDistancia;
   g_settings.stop_movel_candles_posicao=InpStopMovelCandlesPosicao;
   g_settings.stop_movel_candles_count=InpStopMovelCandlesCount;
   g_settings.stop_movel_candles_count_posicao=InpStopMovelCandlesCountPosicao;
   g_settings.stop_movel_indicador=InpStopMovelIndicador;
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
   g_settings.saida_parcial       =InpSaidaParcial;
   g_settings.tipo_saida_parcial  =InpTipoSaidaParcial;
   g_settings.saida_parcial_valor[0]=InpSaidaParcial1Valor;
   g_settings.saida_parcial_distancia[0]=InpSaidaParcial1Distancia;
   for(int i=1; i<6; i++)
     {
      g_settings.saida_parcial_valor[i]=0.0;
      g_settings.saida_parcial_distancia[i]=0.0;
     }
   g_settings.stop_calculo_media_qtd_candles=InpStopCalculoMediaQtdCandles;
   g_settings.stop_calculo_media_base=InpStopCalculoMediaBase;
   g_settings.stop_calculo_media_distancia=0.0;
   g_settings.stop_calculo_media_expirar=0;
   g_settings.stop_calculo_multiplicar_base=InpStopCalculoMultiplicarBase;
   g_settings.stop_calculo_multiplicar_candle=InpStopCalculoMultiplicarCandle;
   g_settings.stop_calculo_multiplicar_qtd=InpStopCalculoMultiplicarQtd;
   g_settings.stop_calculo_referencia_base=InpStopCalculoReferenciaBase;
   g_settings.stop_calculo_referencia_posicao=InpStopCalculoReferenciaPosicao;
   g_settings.stop_calculo_referencia_distancia=0.0;
   g_settings.stop_calculo_referencia_expirar=0;
   g_settings.stop_fixo_distancia  =InpStopFixoDistancia;
  }

int OnInit()
  {
   LoadInputsToSettings();
   ExtDialog.BindSettings(g_settings);
   if(!ExtDialog.Create(ChartID(),"ConstrutorUI",0,54,30,1370,700))
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
   if(g_easy_panel!=NULL)
     {
      g_easy_panel.Shutdown();
      delete g_easy_panel;
      g_easy_panel=NULL;
     }
  }

void OnTick()
  {
  }

void OnTimer()
  {
   if(g_easy_panel!=NULL && g_easy_panel.IsVisible())
      g_easy_panel.OnTimerEvent();
  }

void OnChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
   if(g_easy_panel!=NULL)
      g_easy_panel.ChartEvent(id,lparam,dparam,sparam);
   ExtDialog.ChartEvent(id,lparam,dparam,sparam);
  }
