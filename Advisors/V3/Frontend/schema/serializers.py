from __future__ import annotations

from state.strategy_store import StrategyStore
from schema.strategy_document import (
    SCHEMA_VERSION,
    SignalFilterDocument,
    SignalLimitDocument,
    SignalLimitReferenceDocument,
    SignalsDocument,
    StopLossCalcDocument,
    StopLossCalcMaxMinDocument,
    StopLossCalcMediaDocument,
    StopLossCalcReferenceDocument,
    StopLossDocument,
    StopLossFixedDocument,
    StopLossMultiplierDocument,
    TakeProfitDocument,
    TakeProfitFixedDocument,
    TakeProfitMultiplierDocument,
    StrategyDocument,
)

ORDER_MODE_TO_SET = {
    "Mercado": "0",
    "Limite": "1",
}

LIMIT_MODE_TO_SET = {
    "Referencia": "0",
    "Media": "1",
}

REFERENCE_BASE_TO_SET = {
    "Maxima": "0",
    "Minima": "1",
    "Abertura": "2",
    "Fechamento": "3",
}

REFERENCE_CANDLE_TO_SET = {
    "Atual": "0",
    "Ultimo": "1",
    "Penultimo": "2",
    "Antepenultimo": "3",
}

EXPIRATION_TO_SET = {
    "Nao expirar": "0",
    "1 candle": "1",
    "2 candles": "2",
    "3 candles": "3",
    "4 candles": "4",
}


def build_strategy_document(store: StrategyStore) -> StrategyDocument:
    return StrategyDocument(
        schema_version=SCHEMA_VERSION,
        strategy_name=str(store.get("strategy.name")),
        magic_number=str(store.get("strategy.magic_number")),
        signals=SignalsDocument(
            order_mode=str(store.get("signals.order_mode")),
            limit=SignalLimitDocument(
                mode=str(store.get("signals.limit_mode")),
                reference=SignalLimitReferenceDocument(
                    base=str(store.get("signals.limit_reference.base")),
                    candle=str(store.get("signals.limit_reference.candle")),
                    move_next_candle=bool(store.get("signals.limit_reference.move_next_candle")),
                    distance=str(store.get("signals.limit_reference.distance")),
                    expire=str(store.get("signals.limit_reference.expire")),
                ),
            ),
            filter=SignalFilterDocument(
                enabled=bool(store.get("signals.filter.enabled")),
                measure=str(store.get("signals.filter.measure")),
                timeframe=str(store.get("signals.filter.timeframe")),
                candle_min=str(store.get("signals.filter.candle_min")),
                candle_max=str(store.get("signals.filter.candle_max")),
                body_min=str(store.get("signals.filter.body_min")),
                body_max=str(store.get("signals.filter.body_max")),
                upper_wick_min=str(store.get("signals.filter.upper_wick_min")),
                upper_wick_max=str(store.get("signals.filter.upper_wick_max")),
                lower_wick_min=str(store.get("signals.filter.lower_wick_min")),
                lower_wick_max=str(store.get("signals.filter.lower_wick_max")),
            ),
        ),
        stop_loss=StopLossDocument(
            mode=str(store.get("stop_loss.mode")),
            measure=str(store.get("stop_loss.measure")),
            fixed=StopLossFixedDocument(
                enabled=bool(store.get("stop_loss.fixed.enabled")),
                distance=str(store.get("stop_loss.fixed.distance")),
            ),
            calc=StopLossCalcDocument(
                method=str(store.get("stop_loss.calc_method")),
                reference=StopLossCalcReferenceDocument(
                    base=str(store.get("stop_loss.calc.reference.base")),
                    candle=str(store.get("stop_loss.calc.reference.candle")),
                    distance=str(store.get("stop_loss.calc.reference.distance")),
                ),
                media=StopLossCalcMediaDocument(
                    candles=str(store.get("stop_loss.calc.media.candles")),
                    base=str(store.get("stop_loss.calc.media.base")),
                    distance=str(store.get("stop_loss.calc.media.distance")),
                ),
                maxmin=StopLossCalcMaxMinDocument(
                    extreme=str(store.get("stop_loss.calc.maxmin.extreme")),
                    base=str(store.get("stop_loss.calc.maxmin.base")),
                    count=str(store.get("stop_loss.calc.maxmin.count")),
                ),
            ),
            mult=StopLossMultiplierDocument(
                base=str(store.get("stop_loss.mult.base")),
                candle=str(store.get("stop_loss.mult.candle")),
                value=str(store.get("stop_loss.mult.value")),
            ),
        ),
        take_profit=TakeProfitDocument(
            mode=str(store.get("take_profit.mode")),
            measure=str(store.get("take_profit.measure")),
            fixed=TakeProfitFixedDocument(
                enabled=bool(store.get("take_profit.fixed.enabled")),
                method=str(store.get("take_profit.fixed.method")),
                distance=str(store.get("take_profit.fixed.distance")),
                stop_multiple=str(store.get("take_profit.fixed.stop_multiple")),
            ),
            mult=TakeProfitMultiplierDocument(
                base=str(store.get("take_profit.mult.base")),
                candle=str(store.get("take_profit.mult.candle")),
                value=str(store.get("take_profit.mult.value")),
            ),
        ),
    )


def build_runtime_snapshot(store: StrategyStore) -> dict[str, str]:
    return {
        "signal_order_mode": str(store.get("signals.order_mode")),
        "signal_limit_mode": str(store.get("signals.limit_mode")),
        "signal_limit_reference_base": str(store.get("signals.limit_reference.base")),
        "signal_limit_reference_candle": str(store.get("signals.limit_reference.candle")),
        "signal_limit_reference_move_next_candle": "Sim" if bool(store.get("signals.limit_reference.move_next_candle")) else "Nao",
        "signal_limit_reference_distance": str(store.get("signals.limit_reference.distance")),
        "signal_limit_reference_expire": str(store.get("signals.limit_reference.expire")),
        "signal_filter_enabled": "Sim" if bool(store.get("signals.filter.enabled")) else "Nao",
        "signal_filter_measure": str(store.get("signals.filter.measure")),
        "signal_filter_timeframe": str(store.get("signals.filter.timeframe")),
        "signal_filter_candle_min": str(store.get("signals.filter.candle_min")),
        "signal_filter_candle_max": str(store.get("signals.filter.candle_max")),
        "signal_filter_body_min": str(store.get("signals.filter.body_min")),
        "signal_filter_body_max": str(store.get("signals.filter.body_max")),
        "signal_filter_upper_wick_min": str(store.get("signals.filter.upper_wick_min")),
        "signal_filter_upper_wick_max": str(store.get("signals.filter.upper_wick_max")),
        "signal_filter_lower_wick_min": str(store.get("signals.filter.lower_wick_min")),
        "signal_filter_lower_wick_max": str(store.get("signals.filter.lower_wick_max")),
        "stop_loss_mode": str(store.get("stop_loss.mode")),
        "stop_loss_measure": str(store.get("stop_loss.measure")),
        "stop_loss_fixed_enabled": "Sim" if bool(store.get("stop_loss.fixed.enabled")) else "Nao",
        "stop_loss_fixed_distance": str(store.get("stop_loss.fixed.distance")),
        "stop_loss_calc_method": str(store.get("stop_loss.calc_method")),
        "stop_loss_calc_reference_base": str(store.get("stop_loss.calc.reference.base")),
        "stop_loss_calc_reference_candle": str(store.get("stop_loss.calc.reference.candle")),
        "stop_loss_calc_reference_distance": str(store.get("stop_loss.calc.reference.distance")),
        "stop_loss_calc_media_candles": str(store.get("stop_loss.calc.media.candles")),
        "stop_loss_calc_media_base": str(store.get("stop_loss.calc.media.base")),
        "stop_loss_calc_media_distance": str(store.get("stop_loss.calc.media.distance")),
        "stop_loss_calc_maxmin_extreme": str(store.get("stop_loss.calc.maxmin.extreme")),
        "stop_loss_calc_maxmin_base": str(store.get("stop_loss.calc.maxmin.base")),
        "stop_loss_calc_maxmin_count": str(store.get("stop_loss.calc.maxmin.count")),
        "stop_loss_mult_base": str(store.get("stop_loss.mult.base")),
        "stop_loss_mult_candle": str(store.get("stop_loss.mult.candle")),
        "stop_loss_mult_value": str(store.get("stop_loss.mult.value")),
    }


def _bool_to_set(value: object) -> str:
    return "true" if bool(value) else "false"


def _timeframe_to_set(value: str) -> str:
    normalized = str(value).strip()
    if normalized == "" or normalized == "Corrente":
        return "current"
    return normalized


def _enum_to_set(mapping: dict[str, str], value: object, default: str) -> str:
    normalized = str(value).strip()
    return mapping.get(normalized, default)


def _resolve_effective_stop_loss_mode(store: StrategyStore) -> str:
    if bool(store.get("stop_loss.fixed.enabled")):
        return "fixed"

    mode = str(store.get("stop_loss.mode")).strip()
    if mode in {"calc", "mult"}:
        return mode

    calc_method = str(store.get("stop_loss.calc_method")).strip()
    if calc_method == "med":
        return "calc"
    if calc_method == "maxmin":
        maxmin_count = str(store.get("stop_loss.calc.maxmin.count")).strip()
        maxmin_base = str(store.get("stop_loss.calc.maxmin.base")).strip()
        maxmin_extreme = str(store.get("stop_loss.calc.maxmin.extreme")).strip()
        if maxmin_count not in {"", "3"} or maxmin_base != "Maxima" or maxmin_extreme != "Maior":
            return "calc"

    ref_distance = str(store.get("stop_loss.calc.reference.distance")).strip()
    ref_base = str(store.get("stop_loss.calc.reference.base")).strip()
    ref_candle = str(store.get("stop_loss.calc.reference.candle")).strip()
    if calc_method == "ref" and (ref_distance not in {"", "0", "0.0"} or ref_base != "Maxima" or ref_candle != "Atual"):
        return "calc"

    mult_base = str(store.get("stop_loss.mult.base")).strip()
    mult_candle = str(store.get("stop_loss.mult.candle")).strip()
    mult_value = str(store.get("stop_loss.mult.value")).strip()
    if mult_value not in {"", "0", "0.0", "1", "1.0"} or mult_base != "Corpo do candle" or mult_candle != "Penultimo":
        return "mult"

    return "none"


def build_tester_set_lines(store: StrategyStore) -> list[str]:
    effective_stop_loss_mode = _resolve_effective_stop_loss_mode(store)
    calc_method = str(store.get("stop_loss.calc_method")).strip()
    return [
        f"InpNomeDaEstrategia={store.get('strategy.name')}",
        f"InpMagicNumber={store.get('strategy.magic_number')}",
        f"InpModoDeOrdem={_enum_to_set(ORDER_MODE_TO_SET, store.get('signals.order_mode'), '0')}",
        f"InpModoDaOrdemLimite={_enum_to_set(LIMIT_MODE_TO_SET, store.get('signals.limit_mode'), '0')}",
        f"InpReferenciaDaOrdemLimite={_enum_to_set(REFERENCE_BASE_TO_SET, store.get('signals.limit_reference.base'), '0')}",
        f"InpCandleDaReferenciaDaOrdemLimite={_enum_to_set(REFERENCE_CANDLE_TO_SET, store.get('signals.limit_reference.candle'), '0')}",
        f"InpMoverParaOProximoCandle={_bool_to_set(store.get('signals.limit_reference.move_next_candle'))}",
        f"InpDistanciaDaOrdemLimite={store.get('signals.limit_reference.distance')}",
        f"InpExpiracaoDaOrdemLimite={_enum_to_set(EXPIRATION_TO_SET, store.get('signals.limit_reference.expire'), '0')}",
        f"InpOperarNaCompra={_bool_to_set(str(store.get('risk.allow_buy')) == 'Sim')}",
        f"InpOperarNaVenda={_bool_to_set(str(store.get('risk.allow_sell')) == 'Sim')}",
        f"InpVolumeInicial={store.get('risk.initial_volume')}",
        f"InpSpreadMaximo={store.get('risk.max_spread')}",
        f"InpAtivarFiltro={_bool_to_set(store.get('signals.filter.enabled'))}",
        f"InpMedirEmPercentual={_bool_to_set(str(store.get('signals.filter.measure')) == 'Percentual')}",
        f"InpTempoGraficoDoFiltro={_timeframe_to_set(str(store.get('signals.filter.timeframe')))}",
        f"InpTamanhoMinimoDaVela={store.get('signals.filter.candle_min')}",
        f"InpTamanhoMaximoDaVela={store.get('signals.filter.candle_max')}",
        f"InpTamanhoMinimoDoCorpoDaVela={store.get('signals.filter.body_min')}",
        f"InpTamanhoMaximoDoCorpoDaVela={store.get('signals.filter.body_max')}",
        f"InpTamanhoMinimoPavioSuperior={store.get('signals.filter.upper_wick_min')}",
        f"InpTamanhoMaximoPavioSuperior={store.get('signals.filter.upper_wick_max')}",
        f"InpTamanhoMinimoPavioInferior={store.get('signals.filter.lower_wick_min')}",
        f"InpTamanhoMaximoPavioInferior={store.get('signals.filter.lower_wick_max')}",
        f"InpUsarStopLossFixo={_bool_to_set(effective_stop_loss_mode == 'fixed')}",
        f"InpUsarStopLossPorReferencia={_bool_to_set(effective_stop_loss_mode == 'calc' and calc_method == 'ref')}",
        f"InpUsarStopLossPorMedia={_bool_to_set(effective_stop_loss_mode == 'calc' and calc_method == 'med')}",
        f"InpUsarStopLossPorMaxMin={_bool_to_set(effective_stop_loss_mode == 'calc' and calc_method == 'maxmin')}",
        f"InpTipoDeStopLossPercentual={_bool_to_set(str(store.get('stop_loss.measure')) == 'Percentual')}",
        f"InpDistanciaDoStopLossFixo={store.get('stop_loss.fixed.distance')}",
        f"InpReferenciaDoStopLoss={_enum_to_set(REFERENCE_BASE_TO_SET, store.get('stop_loss.calc.reference.base'), '0')}",
        f"InpCandleDaReferenciaDoStopLoss={_enum_to_set(REFERENCE_CANDLE_TO_SET, store.get('stop_loss.calc.reference.candle'), '0')}",
        f"InpDistanciaDoStopLossPorReferencia={store.get('stop_loss.calc.reference.distance')}",
        f"InpQuantidadeDeCandlesDaMediaStopLoss={store.get('stop_loss.calc.media.candles')}",
        f"InpReferenciaDaMediaStopLoss={_enum_to_set(REFERENCE_BASE_TO_SET, store.get('stop_loss.calc.media.base'), '0')}",
        f"InpDistanciaDoStopLossPorMedia={store.get('stop_loss.calc.media.distance')}",
        f"InpExtremoDoStopLossPorMaxMin={'0' if str(store.get('stop_loss.calc.maxmin.extreme')).strip() != 'Menor' else '1'}",
        f"InpQuantidadeDeCandlesDoStopLossPorMaxMin={store.get('stop_loss.calc.maxmin.count')}",
        f"InpReferenciaDoStopLossPorMaxMin={_enum_to_set(REFERENCE_BASE_TO_SET, store.get('stop_loss.calc.maxmin.base'), '0')}",
        f"InpUsarStopLossMultiplicador={_bool_to_set(effective_stop_loss_mode == 'mult')}",
        f"InpBaseDoStopLossMultiplicador={'0' if str(store.get('stop_loss.mult.base')).strip() != 'Range (pavio a pavio)' else '1'}",
        f"InpCandleDoStopLossMultiplicador={_enum_to_set(REFERENCE_CANDLE_TO_SET, store.get('stop_loss.mult.candle'), '2')}",
        f"InpValorDoStopLossMultiplicador={store.get('stop_loss.mult.value')}",
        f"InpUsarTakeProfitFixo={_bool_to_set(bool(store.get('take_profit.fixed.enabled')) and str(store.get('take_profit.mode')).strip() == 'fixed')}",
        f"InpTipoDeTakeProfitPercentual={_bool_to_set(str(store.get('take_profit.measure')) == 'Percentual')}",
        f"InpModoDoTakeProfitFixo={'1' if str(store.get('take_profit.fixed.method')).strip() == 'stop_mult' else '0'}",
        f"InpDistanciaDoTakeProfitFixo={store.get('take_profit.fixed.distance')}",
        f"InpMultiplicadorDoTakeProfitFixo={store.get('take_profit.fixed.stop_multiple')}",
        f"InpUsarTakeProfitMultiplicador={_bool_to_set(str(store.get('take_profit.mode')).strip() == 'mult')}",
        f"InpBaseDoTakeProfitMultiplicador={'0' if str(store.get('take_profit.mult.base')).strip() != 'Range (pavio a pavio)' else '1'}",
        f"InpCandleDoTakeProfitMultiplicador={_enum_to_set(REFERENCE_CANDLE_TO_SET, store.get('take_profit.mult.candle'), '2')}",
        f"InpValorDoTakeProfitMultiplicador={store.get('take_profit.mult.value')}",
    ]
