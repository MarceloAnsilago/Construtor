//+------------------------------------------------------------------+
//|                                                         AMA1.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <my_class_ea.mqh>

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
//variavies de imput do usuario
input int      EA_Magic      = 12345;   // Número Mágico do EA

input group    "Volume Financeiro"
input double   Lot           = 0.2;     // Lote para negociação

//--- Parâmetros de entrada
input group    "Take e Stop"
input int      StopLoss      = 30;      // Stop Loss
input int      TakeProfit    = 100;     // Take Profit

input group    "Configurações das Operações"
input int      ADX_Period    = 14;      // Período do ADX
input int      MA_Period     = 10;      // Período da Média Móvel

input double   Adx_Min       = 22.0;    // Valor mínimo do ADX

//--- Outros parâmetros
int STP, TKP;                           // Variáveis para armazenar os valores de Stop Loss e Take Profit

//--- Cria um objeto da nossa classe
MyExpert Cexpert; // principal objeto

int OnInit()
{
   //--- Executa a função de inicialização
   Cexpert.doInit(ADX_Period, MA_Period);

   //--- Define todas as demais variáveis necessárias para o objeto da classe
   Cexpert.setPeriod(_Period);          // Define o período (timeframe) do gráfico
   Cexpert.setSymbol(_Symbol);          // Define o símbolo (ativo/par de moedas)
   Cexpert.setMagic(EA_Magic);          // Define o Número Mágico do EA
   Cexpert.setadxmin(Adx_Min);          // Define o valor mínimo do ADX
   Cexpert.setLOTS(Lot);                // Define o valor do lote

   //--- Ajusta o EA para corretoras com preços de 5 dígitos em vez de 4
   STP = StopLoss;
   TKP = TakeProfit;

   if(_Digits == 5)
   {
      STP = STP * 10;
      TKP = TKP * 10;
   }

   //---
   return(0);
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   Cexpert.doUninit();
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   int Mybars = iBars(_Symbol, _Period); // Obtém o número de barras no gráfico atual
   if (mybars < 60 return; // Se houver menos de 100 barras, não faz nada
    {
      Alert("Não há barras suficientes para operar. Aguarde mais barras.");
      return;
    }
  }
//+------------------------------------------------------------------+
