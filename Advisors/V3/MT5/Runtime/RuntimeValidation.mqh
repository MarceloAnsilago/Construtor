#ifndef __ALPHAFORGE_V3_RUNTIME_VALIDATION_MQH__
#define __ALPHAFORGE_V3_RUNTIME_VALIDATION_MQH__

void NormalizeRuntimeConfig(SRuntimeConfig &config)
  {
   if(config.signals.order_mode!=ModoOrdemMercado && config.signals.order_mode!=ModoOrdemLimite)
      config.signals.order_mode=ModoOrdemMercado;
   if(config.signals.limit.mode!=ModoLimiteReferencia && config.signals.limit.mode!=ModoLimiteMedia)
      config.signals.limit.mode=ModoLimiteReferencia;
   if(config.signals.limit.reference.base!=BaseMaxima
      && config.signals.limit.reference.base!=BaseMinima
      && config.signals.limit.reference.base!=BaseAbertura
      && config.signals.limit.reference.base!=BaseFechamento)
      config.signals.limit.reference.base=BaseMaxima;
   if(config.signals.limit.reference.candle!=CandleAtual
      && config.signals.limit.reference.candle!=CandleUltimo
      && config.signals.limit.reference.candle!=CandlePenultimo
      && config.signals.limit.reference.candle!=CandleAntepenultimo)
      config.signals.limit.reference.candle=CandleAtual;
   if(config.signals.limit.reference.expire!=NaoExpirar
      && config.signals.limit.reference.expire!=Expirar1Candle
      && config.signals.limit.reference.expire!=Expirar2Candles
      && config.signals.limit.reference.expire!=Expirar3Candles
      && config.signals.limit.reference.expire!=Expirar4Candles)
      config.signals.limit.reference.expire=NaoExpirar;
   if(config.stop_loss.reference.base!=BaseMaxima
      && config.stop_loss.reference.base!=BaseMinima
      && config.stop_loss.reference.base!=BaseAbertura
      && config.stop_loss.reference.base!=BaseFechamento)
      config.stop_loss.reference.base=BaseMaxima;
   if(config.stop_loss.reference.candle!=CandleAtual
      && config.stop_loss.reference.candle!=CandleUltimo
      && config.stop_loss.reference.candle!=CandlePenultimo
      && config.stop_loss.reference.candle!=CandleAntepenultimo)
      config.stop_loss.reference.candle=CandleAtual;
   if(config.stop_loss.media.base!=BaseMaxima
      && config.stop_loss.media.base!=BaseMinima
      && config.stop_loss.media.base!=BaseAbertura
      && config.stop_loss.media.base!=BaseFechamento)
      config.stop_loss.media.base=BaseMaxima;

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
   if(config.stop_loss.fixed.distance<0.0)
      config.stop_loss.fixed.distance=0.0;
   if(config.stop_loss.reference.distance<0.0)
      config.stop_loss.reference.distance=0.0;
   if(config.stop_loss.media.candles<1)
      config.stop_loss.media.candles=1;
   if(config.stop_loss.media.distance<0.0)
      config.stop_loss.media.distance=0.0;
  }

#endif
