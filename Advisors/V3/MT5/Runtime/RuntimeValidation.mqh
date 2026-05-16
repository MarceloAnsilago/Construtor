#ifndef __ALPHAFORGE_V3_RUNTIME_VALIDATION_MQH__
#define __ALPHAFORGE_V3_RUNTIME_VALIDATION_MQH__

void NormalizeRuntimeConfig(SRuntimeConfig &config)
  {
   if(config.signals.order_mode!=SinalOrdemMercado && config.signals.order_mode!=SinalOrdemLimite)
      config.signals.order_mode=SinalOrdemMercado;
   if(config.signals.limit.mode!=SinalLimiteReferencia && config.signals.limit.mode!=SinalLimiteMedia)
      config.signals.limit.mode=SinalLimiteReferencia;
   if(config.signals.limit.reference.base!=ReferenciaMaxima
      && config.signals.limit.reference.base!=ReferenciaMinima
      && config.signals.limit.reference.base!=ReferenciaAbertura
      && config.signals.limit.reference.base!=ReferenciaFechamento)
      config.signals.limit.reference.base=ReferenciaMaxima;
   if(config.signals.limit.reference.candle!=CandleAtual
      && config.signals.limit.reference.candle!=CandleUltimo
      && config.signals.limit.reference.candle!=CandlePenultimo
      && config.signals.limit.reference.candle!=CandleAntepenultimo)
      config.signals.limit.reference.candle=CandleAtual;
   if(config.signals.limit.reference.expire!=ExpiracaoNaoExpirar
      && config.signals.limit.reference.expire!=Expiracao1Candle
      && config.signals.limit.reference.expire!=Expiracao2Candles
      && config.signals.limit.reference.expire!=Expiracao3Candles
      && config.signals.limit.reference.expire!=Expiracao4Candles)
      config.signals.limit.reference.expire=ExpiracaoNaoExpirar;

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
