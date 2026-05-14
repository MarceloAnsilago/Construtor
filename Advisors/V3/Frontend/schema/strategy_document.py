from __future__ import annotations

from dataclasses import dataclass


SCHEMA_VERSION = 1


@dataclass(frozen=True)
class SignalFilterDocument:
    enabled: bool
    measure: str
    timeframe: str
    candle_min: str
    candle_max: str
    wick_min: str
    wick_max: str


@dataclass(frozen=True)
class SignalsDocument:
    order_mode: str
    filter: SignalFilterDocument


@dataclass(frozen=True)
class StrategyDocument:
    schema_version: int
    strategy_name: str
    magic_number: str
    signals: SignalsDocument

    def to_dict(self) -> dict[str, object]:
        return {
            "schema_version": self.schema_version,
            "strategy_name": self.strategy_name,
            "magic_number": self.magic_number,
            "signals": {
                "order_mode": self.signals.order_mode,
                "filter": {
                    "enabled": self.signals.filter.enabled,
                    "measure": self.signals.filter.measure,
                    "timeframe": self.signals.filter.timeframe,
                    "candle_min": self.signals.filter.candle_min,
                    "candle_max": self.signals.filter.candle_max,
                    "wick_min": self.signals.filter.wick_min,
                    "wick_max": self.signals.filter.wick_max,
                },
            },
        }
