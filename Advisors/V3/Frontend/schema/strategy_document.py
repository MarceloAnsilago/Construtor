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
class StopLossFixedDocument:
    enabled: bool
    distance: str


@dataclass(frozen=True)
class StopLossCalcReferenceDocument:
    base: str
    candle: str
    distance: str


@dataclass(frozen=True)
class StopLossCalcMediaDocument:
    candles: str
    base: str
    distance: str


@dataclass(frozen=True)
class StopLossCalcMaxMinDocument:
    extreme: str
    base: str
    count: str


@dataclass(frozen=True)
class StopLossCalcDocument:
    method: str
    reference: StopLossCalcReferenceDocument
    media: StopLossCalcMediaDocument
    maxmin: StopLossCalcMaxMinDocument


@dataclass(frozen=True)
class StopLossMultiplierDocument:
    base: str
    candle: str
    value: str


@dataclass(frozen=True)
class StopLossDocument:
    mode: str
    measure: str
    fixed: StopLossFixedDocument
    calc: StopLossCalcDocument
    mult: StopLossMultiplierDocument


@dataclass(frozen=True)
class TakeProfitFixedDocument:
    enabled: bool
    method: str
    distance: str
    stop_multiple: str


@dataclass(frozen=True)
class TakeProfitMultiplierDocument:
    base: str
    candle: str
    value: str


@dataclass(frozen=True)
class TakeProfitDocument:
    mode: str
    measure: str
    fixed: TakeProfitFixedDocument
    mult: TakeProfitMultiplierDocument


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
    stop_loss: StopLossDocument
    take_profit: TakeProfitDocument

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
            "stop_loss": {
                "mode": self.stop_loss.mode,
                "measure": self.stop_loss.measure,
                "fixed": {
                    "enabled": self.stop_loss.fixed.enabled,
                    "distance": self.stop_loss.fixed.distance,
                },
                "calc": {
                    "method": self.stop_loss.calc.method,
                    "reference": {
                        "base": self.stop_loss.calc.reference.base,
                        "candle": self.stop_loss.calc.reference.candle,
                        "distance": self.stop_loss.calc.reference.distance,
                    },
                    "media": {
                        "candles": self.stop_loss.calc.media.candles,
                        "base": self.stop_loss.calc.media.base,
                        "distance": self.stop_loss.calc.media.distance,
                    },
                    "maxmin": {
                        "extreme": self.stop_loss.calc.maxmin.extreme,
                        "base": self.stop_loss.calc.maxmin.base,
                        "count": self.stop_loss.calc.maxmin.count,
                    },
                },
                "mult": {
                    "base": self.stop_loss.mult.base,
                    "candle": self.stop_loss.mult.candle,
                    "value": self.stop_loss.mult.value,
                },
            },
            "take_profit": {
                "mode": self.take_profit.mode,
                "measure": self.take_profit.measure,
                "fixed": {
                    "enabled": self.take_profit.fixed.enabled,
                    "method": self.take_profit.fixed.method,
                    "distance": self.take_profit.fixed.distance,
                    "stop_multiple": self.take_profit.fixed.stop_multiple,
                },
                "mult": {
                    "base": self.take_profit.mult.base,
                    "candle": self.take_profit.mult.candle,
                    "value": self.take_profit.mult.value,
                },
            },
        }
