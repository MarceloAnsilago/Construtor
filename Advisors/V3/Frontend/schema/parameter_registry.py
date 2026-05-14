from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class ParameterDefinition:
    key: str
    label: str
    value_type: str
    default: str | bool
    group: str
    allowed_values: tuple[str, ...] = ()


PARAMETERS: tuple[ParameterDefinition, ...] = (
    ParameterDefinition("strategy.name", "Nome da estrategia", "string", "Minha estrategia", "strategy"),
    ParameterDefinition("strategy.magic_number", "Magic number", "string", "100000", "strategy"),
    ParameterDefinition(
        "signals.order_mode",
        "Modo de ordem",
        "string",
        "Mercado",
        "signals",
        ("Mercado", "Limite"),
    ),
    ParameterDefinition(
        "signals.filter.enabled",
        "Ativar filtro",
        "bool",
        False,
        "signals.filter",
    ),
    ParameterDefinition(
        "signals.filter.measure",
        "Medir em",
        "string",
        "Pontos",
        "signals.filter",
        ("Pontos", "Percentual"),
    ),
    ParameterDefinition(
        "signals.filter.timeframe",
        "Tempo grafico",
        "string",
        "Corrente",
        "signals.filter",
    ),
    ParameterDefinition(
        "signals.filter.candle_min",
        "Tam. min da vela",
        "string",
        "0",
        "signals.filter",
    ),
    ParameterDefinition(
        "signals.filter.candle_max",
        "Tam. max",
        "string",
        "0",
        "signals.filter",
    ),
    ParameterDefinition(
        "signals.filter.wick_min",
        "Min. pavios",
        "string",
        "0",
        "signals.filter",
    ),
    ParameterDefinition(
        "signals.filter.wick_max",
        "Max. pavios",
        "string",
        "0",
        "signals.filter",
    ),
    ParameterDefinition("risk.allow_buy", "Operar na compra", "string", "Sim", "risk", ("Sim", "Nao")),
    ParameterDefinition("risk.allow_sell", "Operar na venda", "string", "Sim", "risk", ("Sim", "Nao")),
    ParameterDefinition("risk.initial_volume", "Volume inicial", "string", "1.00", "risk"),
    ParameterDefinition("risk.max_spread", "Spread maximo", "string", "10", "risk"),
)

PARAMETER_BY_KEY = {parameter.key: parameter for parameter in PARAMETERS}


def default_values() -> dict[str, str | bool]:
    return {parameter.key: parameter.default for parameter in PARAMETERS}
