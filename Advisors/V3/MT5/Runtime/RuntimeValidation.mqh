#ifndef __ALPHAFORGE_V3_RUNTIME_VALIDATION_MQH__
#define __ALPHAFORGE_V3_RUNTIME_VALIDATION_MQH__

void NormalizeRuntimeConfig(SRuntimeConfig &config)
  {
   string order_mode=config.signals.order_mode;
   StringTrimLeft(order_mode);
   StringTrimRight(order_mode);
   if(order_mode!="Mercado" && order_mode!="Limite")
      order_mode="Mercado";
   config.signals.order_mode=order_mode;

   if(config.risk.initial_volume<0.0)
      config.risk.initial_volume=0.0;
   if(config.risk.max_spread<0.0)
      config.risk.max_spread=0.0;
   if(config.signals.filter.candle_min<0.0)
      config.signals.filter.candle_min=0.0;
   if(config.signals.filter.candle_max<0.0)
      config.signals.filter.candle_max=0.0;
   if(config.signals.filter.body_min<0.0)
      config.signals.filter.body_min=0.0;
   if(config.signals.filter.body_max<0.0)
      config.signals.filter.body_max=0.0;
   if(config.signals.filter.upper_wick_min<0.0)
      config.signals.filter.upper_wick_min=0.0;
   if(config.signals.filter.upper_wick_max<0.0)
      config.signals.filter.upper_wick_max=0.0;
   if(config.signals.filter.lower_wick_min<0.0)
      config.signals.filter.lower_wick_min=0.0;
   if(config.signals.filter.lower_wick_max<0.0)
      config.signals.filter.lower_wick_max=0.0;
  }

#endif
