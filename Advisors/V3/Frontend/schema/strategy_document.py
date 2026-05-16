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
    body_min: str
    body_max: str
    upper_wick_min: str
    upper_wick_max: str
    lower_wick_min: str
    lower_wick_max: str


@dataclass(frozen=True)
class SignalLimitReferenceDocument:
    base: str
    candle: str
    move_next_candle: bool
    distance: str
    expire: str


@dataclass(frozen=True)
class SignalLimitDocument:
    mode: str
    reference: SignalLimitReferenceDocument


@dataclass(frozen=True)
class SignalsDocument:
    order_mode: str
    limit: SignalLimitDocument
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
                "limit": {
                    "mode": self.signals.limit.mode,
                    "reference": {
                        "base": self.signals.limit.reference.base,
                        "candle": self.signals.limit.reference.candle,
                        "move_next_candle": self.signals.limit.reference.move_next_candle,
                        "distance": self.signals.limit.reference.distance,
                        "expire": self.signals.limit.reference.expire,
                    },
                },
                "filter": {
                    "enabled": self.signals.filter.enabled,
                    "measure": self.signals.filter.measure,
                    "timeframe": self.signals.filter.timeframe,
                    "candle_min": self.signals.filter.candle_min,
                    "candle_max": self.signals.filter.candle_max,
                    "body_min": self.signals.filter.body_min,
                    "body_max": self.signals.filter.body_max,
                    "upper_wick_min": self.signals.filter.upper_wick_min,
                    "upper_wick_max": self.signals.filter.upper_wick_max,
                    "lower_wick_min": self.signals.filter.lower_wick_min,
                    "lower_wick_max": self.signals.filter.lower_wick_max,
                },
            },
        }
