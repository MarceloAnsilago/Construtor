from __future__ import annotations

from pathlib import Path

from schema.serializers import build_tester_set_lines
from state.strategy_store import StrategyStore


INPUT_TO_STORE_KEYS = {
    "InpNomeDaEstrategia": ("strategy.name",),
    "InpMagicNumber": ("strategy.magic_number",),
    "InpOperarNaCompra": ("risk.allow_buy",),
    "InpOperarNaVenda": ("risk.allow_sell",),
    "InpVolumeInicial": ("risk.initial_volume",),
    "InpSpreadMaximo": ("risk.max_spread",),
    "InpAtivarFiltro": ("signals.filter.enabled",),
    "InpMedirEmPercentual": ("signals.filter.measure",),
    "InpTempoGraficoDoFiltro": ("signals.filter.timeframe",),
    "InpTamanhoMinimoDaVela": ("signals.filter.candle_min",),
    "InpTamanhoMaximoDaVela": ("signals.filter.candle_max",),
    "InpTamanhoMinimoDoCorpoDaVela": ("signals.filter.body_min",),
    "InpTamanhoMaximoDoCorpoDaVela": ("signals.filter.body_max",),
    "InpTamanhoMinimoPavioSuperior": ("signals.filter.upper_wick_min",),
    "InpTamanhoMaximoPavioSuperior": ("signals.filter.upper_wick_max",),
    "InpTamanhoMinimoPavioInferior": ("signals.filter.lower_wick_min",),
    "InpTamanhoMaximoPavioInferior": ("signals.filter.lower_wick_max",),
    "InpMinimoDePavios": ("signals.filter.upper_wick_min", "signals.filter.lower_wick_min"),
    "InpMaximoDePavios": ("signals.filter.upper_wick_max", "signals.filter.lower_wick_max"),
}


def get_default_set_dir() -> Path:
    root = Path(__file__).resolve().parents[2]
    target = root / "CONFIG" / "tester"
    target.mkdir(parents=True, exist_ok=True)
    return target


def write_set_file(store: StrategyStore, destination: Path) -> Path:
    lines = build_tester_set_lines(store)
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_text("\n".join(lines) + "\n", encoding="cp1252")
    return destination


def _parse_bool(value: str) -> bool:
    return value.strip().lower() in {"true", "1", "sim", "yes"}


def _map_input_value(input_name: str, raw_value: str) -> str | bool:
    value = raw_value.strip()
    if input_name in {"InpOperarNaCompra", "InpOperarNaVenda"}:
        return "Sim" if _parse_bool(value) else "Nao"
    if input_name == "InpAtivarFiltro":
        return _parse_bool(value)
    if input_name == "InpMedirEmPercentual":
        return "Percentual" if _parse_bool(value) else "Pontos"
    if input_name == "InpTempoGraficoDoFiltro":
        return "Corrente" if value.lower() == "current" else value
    return value


def read_set_file(source: Path) -> dict[str, str | bool]:
    values: dict[str, str | bool] = {}
    for line in source.read_text(encoding="cp1252").splitlines():
        normalized = line.strip()
        if not normalized or "=" not in normalized:
            continue

        input_name, raw_value = normalized.split("=", 1)
        store_keys = INPUT_TO_STORE_KEYS.get(input_name.strip())
        if not store_keys:
            continue

        mapped_value = _map_input_value(input_name.strip(), raw_value)
        for store_key in store_keys:
            values[store_key] = mapped_value

    return values
