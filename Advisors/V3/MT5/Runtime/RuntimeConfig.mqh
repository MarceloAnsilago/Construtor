#ifndef __ALPHAFORGE_V3_RUNTIME_CONFIG_MQH__
#define __ALPHAFORGE_V3_RUNTIME_CONFIG_MQH__

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

struct SSignalConfig
  {
   string              order_mode;
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
