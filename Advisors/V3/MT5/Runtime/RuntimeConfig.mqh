#ifndef __ALPHAFORGE_V3_RUNTIME_CONFIG_MQH__
#define __ALPHAFORGE_V3_RUNTIME_CONFIG_MQH__

enum ESignalOrderMode
  {
   SinalOrdemMercado=0,
   SinalOrdemLimite=1
  };

enum ESignalLimitMode
  {
   SinalLimiteReferencia=0,
   SinalLimiteMedia=1
  };

enum ESignalLimitReferenceBase
  {
   ReferenciaMaxima=0,
   ReferenciaMinima=1,
   ReferenciaAbertura=2,
   ReferenciaFechamento=3
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
   ExpiracaoNaoExpirar=0,
   Expiracao1Candle=1,
   Expiracao2Candles=2,
   Expiracao3Candles=3,
   Expiracao4Candles=4
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
   SRiskConfig   risk;
  };

#endif
