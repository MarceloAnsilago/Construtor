#ifndef __ALPHAFORGE_V3_RUNTIME_CONFIG_MQH__
#define __ALPHAFORGE_V3_RUNTIME_CONFIG_MQH__

enum ESignalOrderMode
  {
   ModoOrdemMercado=0,
   ModoOrdemLimite=1
  };

enum ESignalLimitMode
  {
   ModoLimiteReferencia=0,
   ModoLimiteMedia=1
  };

enum ESignalLimitReferenceBase
  {
   BaseMaxima=0,
   BaseMinima=1,
   BaseAbertura=2,
   BaseFechamento=3
  };

enum ESignalLimitReferenceCandle
  {
   CandleAtual=0,
   CandleUltimo=1,
   CandlePenultimo=2,
   CandleAntepenultimo=3
  };

enum ESignalLimitExpiration
  {
   NaoExpirar=0,
   Expirar1Candle=1,
   Expirar2Candles=2,
   Expirar3Candles=3,
   Expirar4Candles=4
  };

enum EStopLossMaxMinExtreme
  {
   StopLossMaior=0,
   StopLossMenor=1
  };

enum EStopLossMultiplierBase
  {
   StopLossMultiplicadorCorpo=0,
   StopLossMultiplicadorRange=1
  };

enum ETakeProfitFixedMode
  {
   TakeProfitDistancia=0,
   TakeProfitVezesStop=1
  };

struct SSignalFilterConfig
  {
   bool             enabled;
   string           measure;
   string           timeframe_label;
   ENUM_TIMEFRAMES  timeframe;
   double           candle_min;
   double           candle_max;
   double           body_min;
   double           body_max;
   double           upper_wick_min;
   double           upper_wick_max;
   double           lower_wick_min;
   double           lower_wick_max;
  };

struct SSignalLimitReferenceConfig
  {
   ESignalLimitReferenceBase    base;
   ESignalLimitReferenceCandle  candle;
   bool                         move_next_candle;
   double                       distance;
   ESignalLimitExpiration       expire;
  };

struct SSignalLimitConfig
  {
   ESignalLimitMode            mode;
   SSignalLimitReferenceConfig reference;
  };

struct SSignalConfig
  {
   ESignalOrderMode    order_mode;
   SSignalLimitConfig  limit;
   SSignalFilterConfig filter;
  };

struct SStopLossFixedConfig
  {
   bool    enabled;
   double  distance;
  };

struct SStopLossReferenceConfig
  {
   bool                         enabled;
   ESignalLimitReferenceBase    base;
   ESignalLimitReferenceCandle  candle;
   double                       distance;
  };

struct SStopLossMediaConfig
  {
   bool                       enabled;
   int                        candles;
   ESignalLimitReferenceBase  base;
   double                     distance;
  };

struct SStopLossMaxMinConfig
  {
   bool                       enabled;
   EStopLossMaxMinExtreme     extreme;
   int                        candles;
   ESignalLimitReferenceBase  base;
  };

struct SStopLossMultiplierConfig
  {
   bool                         enabled;
   EStopLossMultiplierBase      base;
   ESignalLimitReferenceCandle  candle;
   double                       value;
  };

struct SStopLossConfig
  {
   string                     mode;
   string                     measure;
   bool                       is_percent;
   SStopLossFixedConfig       fixed;
   SStopLossReferenceConfig   reference;
   SStopLossMediaConfig       media;
   SStopLossMaxMinConfig      maxmin;
   SStopLossMultiplierConfig  mult;
  };

struct STakeProfitFixedConfig
  {
   bool                  enabled;
   ETakeProfitFixedMode  method;
   double                distance;
   double                stop_multiple;
  };

struct STakeProfitMultiplierConfig
  {
   bool                         enabled;
   EStopLossMultiplierBase      base;
   ESignalLimitReferenceCandle  candle;
   double                       value;
  };

struct STakeProfitConfig
  {
   string                  mode;
   string                  measure;
   bool                    is_percent;
   STakeProfitFixedConfig  fixed;
   STakeProfitMultiplierConfig mult;
  };

struct SRiskConfig
  {
   bool   allow_buy;
   bool   allow_sell;
   double initial_volume;
   double max_spread;
  };

struct SRuntimeConfig
  {
   string        strategy_name;
   long          magic_number;
   SSignalConfig signals;
   SStopLossConfig stop_loss;
   STakeProfitConfig take_profit;
   SRiskConfig   risk;
  };

#endif
