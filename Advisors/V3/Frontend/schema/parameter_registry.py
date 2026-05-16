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
        "signals.limit_mode",
        "Modo da ordem limite",
        "string",
        "Referencia",
        "signals.limit",
        ("Referencia", "Media"),
    ),
    ParameterDefinition(
        "signals.limit_reference.base",
        "Base da referencia",
        "string",
        "Maxima",
        "signals.limit.reference",
        ("Maxima", "Minima", "Abertura", "Fechamento"),
    ),
    ParameterDefinition(
        "signals.limit_reference.candle",
        "Candle da referencia",
        "string",
        "Atual",
        "signals.limit.reference",
        ("Atual", "Ultimo", "Penultimo", "Antepenultimo"),
    ),
    ParameterDefinition(
        "signals.limit_reference.move_next_candle",
        "Mover para o proximo candle",
        "bool",
        False,
        "signals.limit.reference",
    ),
    ParameterDefinition(
        "signals.limit_reference.distance",
        "Distancia da referencia",
        "string",
        "0",
        "signals.limit.reference",
    ),
    ParameterDefinition(
        "signals.limit_reference.expire",
        "Expiracao da referencia",
        "string",
        "Nao expirar",
        "signals.limit.reference",
        ("Nao expirar", "1 candle", "2 candles", "3 candles", "4 candles"),
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
        "Vela min. (pavio a pavio)",
        "string",
        "0",
        "signals.filter",
    ),
    ParameterDefinition(
        "signals.filter.candle_max",
        "Vela max. (pavio a pavio)",
        "string",
        "0",
        "signals.filter",
    ),
    ParameterDefinition(
        "signals.filter.body_min",
        "Corpo min. da vela",
        "string",
        "0",
        "signals.filter",
    ),
    ParameterDefinition(
        "signals.filter.body_max",
        "Corpo max. da vela",
        "string",
        "0",
        "signals.filter",
    ),
    ParameterDefinition(
        "signals.filter.upper_wick_min",
        "Pavio sup. min.",
        "string",
        "0",
        "signals.filter",
    ),
    ParameterDefinition(
        "signals.filter.upper_wick_max",
        "Pavio sup. max.",
        "string",
        "0",
        "signals.filter",
    ),
    ParameterDefinition(
        "signals.filter.lower_wick_min",
        "Pavio inf. min.",
        "string",
        "0",
        "signals.filter",
    ),
    ParameterDefinition(
        "signals.filter.lower_wick_max",
        "Pavio inf. max.",
        "string",
        "0",
        "signals.filter",
    ),
    ParameterDefinition("risk.allow_buy", "Operar na compra", "string", "Sim", "risk", ("Sim", "Nao")),
    ParameterDefinition("risk.allow_sell", "Operar na venda", "string", "Sim", "risk", ("Sim", "Nao")),
    ParameterDefinition("risk.initial_volume", "Volume inicial", "string", "100", "risk"),
    ParameterDefinition("risk.max_spread", "Spread maximo", "string", "100", "risk"),
)

PARAMETER_BY_KEY = {parameter.key: parameter for parameter in PARAMETERS}


def default_values() -> dict[str, str | bool]:
    return {parameter.key: parameter.default for parameter in PARAMETERS}
