from __future__ import annotations

from state.strategy_store import StrategyStore
from schema.parameter_registry import PARAMETER_BY_KEY
from schema.strategy_document import SCHEMA_VERSION, SignalFilterDocument, SignalsDocument, StrategyDocument


def build_strategy_document(store: StrategyStore) -> StrategyDocument:
    return StrategyDocument(
        schema_version=SCHEMA_VERSION,
        strategy_name=str(store.get("strategy.name")),
        magic_number=str(store.get("strategy.magic_number")),
        signals=SignalsDocument(
            order_mode=str(store.get("signals.order_mode")),
            filter=SignalFilterDocument(
                enabled=bool(store.get("signals.filter.enabled")),
                measure=str(store.get("signals.filter.measure")),
                timeframe=str(store.get("signals.filter.timeframe")),
                candle_min=str(store.get("signals.filter.candle_min")),
                candle_max=str(store.get("signals.filter.candle_max")),
                wick_min=str(store.get("signals.filter.wick_min")),
                wick_max=str(store.get("signals.filter.wick_max")),
            ),
        ),
    )


def build_bridge_payload(store: StrategyStore) -> dict[str, str]:
    document = build_strategy_document(store)
    payload = {
        "schema_version": str(document.schema_version),
    }
    for key, value in store.snapshot().items():
        bridge_key = PARAMETER_BY_KEY[key].bridge_key
        if isinstance(value, bool):
            payload[bridge_key] = "Sim" if value else "Nao"
        else:
            payload[bridge_key] = str(value)
    return payload


def build_runtime_snapshot(store: StrategyStore) -> dict[str, str]:
    payload = build_bridge_payload(store)
    return {
        "signal_order_mode": payload["signal_order_mode"],
        "signal_filter_enabled": payload["signal_filter_enabled"],
        "signal_filter_measure": payload["signal_filter_measure"],
        "signal_filter_timeframe": payload["signal_filter_timeframe"],
        "signal_filter_candle_min": payload["signal_filter_candle_min"],
        "signal_filter_candle_max": payload["signal_filter_candle_max"],
        "signal_filter_wick_min": payload["signal_filter_wick_min"],
        "signal_filter_wick_max": payload["signal_filter_wick_max"],
    }
