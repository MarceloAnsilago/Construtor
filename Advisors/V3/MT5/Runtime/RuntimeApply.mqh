#ifndef __ALPHAFORGE_V3_RUNTIME_APPLY_MQH__
#define __ALPHAFORGE_V3_RUNTIME_APPLY_MQH__

void SyncRuntimeConfigFromLegacy()
  {
   g_config.strategy_name=ResolveStrategyNameText();
   g_config.magic_number=ResolveMagicNumberValue();
   g_config.signals.order_mode=NormalizeText(g_bridge_signal_order_mode);
   g_config.signals.filter.enabled=g_bridge_filter_enabled;
   g_config.signals.filter.measure=NormalizeText(g_bridge_filter_measure);
   g_config.signals.filter.timeframe_label=NormalizeText(g_bridge_filter_timeframe);
   g_config.signals.filter.timeframe=ResolveTimeframe(g_bridge_filter_timeframe);
   g_config.signals.filter.candle_min=g_bridge_filter_candle_min;
   g_config.signals.filter.candle_max=g_bridge_filter_candle_max;
   g_config.signals.filter.wick_min=g_bridge_filter_wick_min;
   g_config.signals.filter.wick_max=g_bridge_filter_wick_max;
   g_config.risk.allow_buy=g_bridge_allow_buy;
   g_config.risk.allow_sell=g_bridge_allow_sell;
   g_config.risk.initial_volume=g_bridge_initial_volume;
   g_config.risk.max_spread=g_bridge_max_spread;
   NormalizeRuntimeConfig(g_config);
  }

#endif
