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
  }

int OnInit()
  {
   LoadInputsToSettings();
   ExtDialog.BindSettings(g_settings);
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
