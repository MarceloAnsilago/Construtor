#ifndef __ALPHAFORGE_V3_RUNTIME_APPLY_MQH__
#define __ALPHAFORGE_V3_RUNTIME_APPLY_MQH__

void SyncRuntimeConfigFromInputs()
  {
   g_config.strategy_name=InpNomeDaEstrategia;
   g_config.magic_number=InpMagicNumber;
   g_config.signals.order_mode=InpModoDeOrdem;
   g_config.signals.limit.mode=InpModoDaOrdemLimite;
   g_config.signals.limit.reference.base=InpReferenciaDaOrdemLimite;
   g_config.signals.limit.reference.candle=InpCandleDaReferenciaDaOrdemLimite;
   g_config.signals.limit.reference.move_next_candle=InpMoverParaOProximoCandle;
   g_config.signals.limit.reference.distance=InpDistanciaDaOrdemLimite;
   g_config.signals.limit.reference.expire=InpExpiracaoDaOrdemLimite;
   g_config.signals.filter.enabled=InpAtivarFiltro;
   g_config.signals.filter.measure=InpMedirEmPercentual ? "Percentual" : "Pontos";
   g_config.signals.filter.timeframe_label=TimeframeToBridgeText(InpTempoGraficoDoFiltro);
   g_config.signals.filter.timeframe=ResolveTimeframe(g_config.signals.filter.timeframe_label);
   g_config.signals.filter.candle_min=InpTamanhoMinimoDaVela;
   g_config.signals.filter.candle_max=InpTamanhoMaximoDaVela;
    g_config.signals.filter.body_min=InpTamanhoMinimoDoCorpoDaVela;
    g_config.signals.filter.body_max=InpTamanhoMaximoDoCorpoDaVela;
   g_config.signals.filter.upper_wick_min=InpTamanhoMinimoPavioSuperior;
   g_config.signals.filter.upper_wick_max=InpTamanhoMaximoPavioSuperior;
   g_config.signals.filter.lower_wick_min=InpTamanhoMinimoPavioInferior;
   g_config.signals.filter.lower_wick_max=InpTamanhoMaximoPavioInferior;
   g_config.stop_loss.enabled=InpUsarStopLossFixo;
   g_config.stop_loss.measure=InpTipoDeStopLossPercentual ? "Percentual" : "Pontos";
   g_config.stop_loss.distance=InpDistanciaDoStopLossFixo;
   g_config.risk.allow_buy=InpOperarNaCompra;
   g_config.risk.allow_sell=InpOperarNaVenda;
   g_config.risk.initial_volume=InpVolumeInicial;
   g_config.risk.max_spread=InpSpreadMaximo;
   NormalizeRuntimeConfig(g_config);
  }

#endif
