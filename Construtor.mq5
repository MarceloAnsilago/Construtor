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
   g_settings.stop_calculo_media_qtd_candles=InpStopCalculoMediaQtdCandles;
   g_settings.stop_calculo_media_base=InpStopCalculoMediaBase;
   g_settings.stop_calculo_multiplicar_base=InpStopCalculoMultiplicarBase;
   g_settings.stop_calculo_multiplicar_candle=InpStopCalculoMultiplicarCandle;
   g_settings.stop_calculo_multiplicar_qtd=InpStopCalculoMultiplicarQtd;
   g_settings.stop_calculo_referencia_base=InpStopCalculoReferenciaBase;
   g_settings.stop_calculo_referencia_posicao=InpStopCalculoReferenciaPosicao;
   g_settings.stop_fixo_distancia  =InpStopFixoDistancia;
  }

int OnInit()
  {
   LoadInputsToSettings();
   ExtDialog.BindSettings(g_settings);
   if(!ExtDialog.Create(ChartID(),"ConstrutorUI",0,30,30,1042,700))
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
