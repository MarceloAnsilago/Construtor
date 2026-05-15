#ifndef __ALPHAFORGE_V3_RUNTIME_VALIDATION_MQH__
#define __ALPHAFORGE_V3_RUNTIME_VALIDATION_MQH__

void NormalizeRuntimeConfig(SRuntimeConfig &config)
  {
   string order_mode=config.signals.order_mode;
   string limit_mode=config.signals.limit.mode;
   string reference_base=config.signals.limit.reference.base;
   string reference_candle=config.signals.limit.reference.candle;
   string reference_expire=config.signals.limit.reference.expire;

   StringTrimLeft(order_mode);
   StringTrimRight(order_mode);
   StringTrimLeft(limit_mode);
   StringTrimRight(limit_mode);
   StringTrimLeft(reference_base);
   StringTrimRight(reference_base);
   StringTrimLeft(reference_candle);
   StringTrimRight(reference_candle);
   StringTrimLeft(reference_expire);
   StringTrimRight(reference_expire);

   if(order_mode!="Mercado" && order_mode!="Limite")
      order_mode="Mercado";
   if(limit_mode!="Referencia" && limit_mode!="Media")
      limit_mode="Referencia";
   if(reference_base!="Maxima" && reference_base!="Minima" && reference_base!="Abertura" && reference_base!="Fechamento")
      reference_base="Maxima";
   if(reference_candle!="Atual" && reference_candle!="Ultimo" && reference_candle!="Penultimo" && reference_candle!="Antepenultimo")
      reference_candle="Atual";
   if(reference_expire!="Nao expirar" && reference_expire!="1 candle" && reference_expire!="2 candles" && reference_expire!="3 candles" && reference_expire!="4 candles")
      reference_expire="Nao expirar";

   config.signals.order_mode=order_mode;
   config.signals.limit.mode=limit_mode;
   config.signals.limit.reference.base=reference_base;
   config.signals.limit.reference.candle=reference_candle;
   config.signals.limit.reference.expire=reference_expire;

   if(config.risk.initial_volume<0.0)
      config.risk.initial_volume=0.0;
   if(config.risk.max_spread<0.0)
      config.risk.max_spread=0.0;
   if(config.signals.limit.reference.distance<0.0)
      config.signals.limit.reference.distance=0.0;
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
