from __future__ import annotations

from state.strategy_store import StrategyStore
from schema.strategy_document import (
    SCHEMA_VERSION,
    SignalFilterDocument,
    SignalLimitDocument,
    SignalLimitReferenceDocument,
    SignalsDocument,
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


def build_tester_set_lines(store: StrategyStore) -> list[str]:
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
    ]
