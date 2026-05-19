from __future__ import annotations

from pathlib import Path

from schema.serializers import build_tester_set_lines
from state.strategy_store import StrategyStore


INPUT_TO_STORE_KEYS = {
    "InpNomeDaEstrategia": ("strategy.name",),
    "InpMagicNumber": ("strategy.magic_number",),
    "InpModoDeOrdem": ("signals.order_mode",),
    "InpModoDaOrdemLimite": ("signals.limit_mode",),
    "InpReferenciaDaOrdemLimite": ("signals.limit_reference.base",),
    "InpCandleDaReferenciaDaOrdemLimite": ("signals.limit_reference.candle",),
    "InpMoverParaOProximoCandle": ("signals.limit_reference.move_next_candle",),
    "InpDistanciaDaOrdemLimite": ("signals.limit_reference.distance",),
    "InpExpiracaoDaOrdemLimite": ("signals.limit_reference.expire",),
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
    "InpUsarStopLossFixo": ("stop_loss.fixed.enabled",),
    "InpUsarStopLossPorReferencia": ("stop_loss.mode", "stop_loss.calc_method"),
    "InpUsarStopLossPorMedia": ("stop_loss.mode", "stop_loss.calc_method"),
    "InpTipoDeStopLossPercentual": ("stop_loss.measure",),
    "InpDistanciaDoStopLossFixo": ("stop_loss.fixed.distance",),
    "InpReferenciaDoStopLoss": ("stop_loss.calc.reference.base",),
    "InpCandleDaReferenciaDoStopLoss": ("stop_loss.calc.reference.candle",),
    "InpDistanciaDoStopLossPorReferencia": ("stop_loss.calc.reference.distance",),
    "InpQuantidadeDeCandlesDaMediaStopLoss": ("stop_loss.calc.media.candles",),
    "InpReferenciaDaMediaStopLoss": ("stop_loss.calc.media.base",),
    "InpDistanciaDoStopLossPorMedia": ("stop_loss.calc.media.distance",),
}

ORDER_MODE_FROM_SET = {
    "0": "Mercado",
    "1": "Limite",
    "Mercado": "Mercado",
    "Limite": "Limite",
}

LIMIT_MODE_FROM_SET = {
    "0": "Referencia",
    "1": "Media",
    "Referencia": "Referencia",
    "Media": "Media",
}

REFERENCE_BASE_FROM_SET = {
    "0": "Maxima",
    "1": "Minima",
    "2": "Abertura",
    "3": "Fechamento",
    "Maxima": "Maxima",
    "Minima": "Minima",
    "Abertura": "Abertura",
    "Fechamento": "Fechamento",
}

REFERENCE_CANDLE_FROM_SET = {
    "0": "Atual",
    "1": "Ultimo",
    "2": "Penultimo",
    "3": "Antepenultimo",
    "Atual": "Atual",
    "Ultimo": "Ultimo",
    "Penultimo": "Penultimo",
    "Antepenultimo": "Antepenultimo",
}

EXPIRATION_FROM_SET = {
    "0": "Nao expirar",
    "1": "1 candle",
    "2": "2 candles",
    "3": "3 candles",
    "4": "4 candles",
    "Nao expirar": "Nao expirar",
    "1 candle": "1 candle",
    "2 candles": "2 candles",
    "3 candles": "3 candles",
    "4 candles": "4 candles",
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
    if input_name == "InpModoDeOrdem":
        return ORDER_MODE_FROM_SET.get(value, "Mercado")
    if input_name == "InpModoDaOrdemLimite":
        return LIMIT_MODE_FROM_SET.get(value, "Referencia")
    if input_name == "InpReferenciaDaOrdemLimite":
        return REFERENCE_BASE_FROM_SET.get(value, "Maxima")
    if input_name == "InpCandleDaReferenciaDaOrdemLimite":
        return REFERENCE_CANDLE_FROM_SET.get(value, "Atual")
    if input_name == "InpExpiracaoDaOrdemLimite":
        return EXPIRATION_FROM_SET.get(value, "Nao expirar")
    if input_name in {"InpOperarNaCompra", "InpOperarNaVenda"}:
        return "Sim" if _parse_bool(value) else "Nao"
    if input_name == "InpMoverParaOProximoCandle":
        return _parse_bool(value)
    if input_name == "InpAtivarFiltro":
        return _parse_bool(value)
    if input_name == "InpMedirEmPercentual":
        return "Percentual" if _parse_bool(value) else "Pontos"
    if input_name == "InpUsarStopLossFixo":
        return _parse_bool(value)
    if input_name == "InpUsarStopLossPorReferencia":
        return "calc" if _parse_bool(value) else "ref"
    if input_name == "InpUsarStopLossPorMedia":
        return "calc" if _parse_bool(value) else "med"
    if input_name == "InpTipoDeStopLossPercentual":
        return "Percentual" if _parse_bool(value) else "Pontos"
    if input_name == "InpReferenciaDoStopLoss":
        return REFERENCE_BASE_FROM_SET.get(value, "Maxima")
    if input_name == "InpCandleDaReferenciaDoStopLoss":
        return REFERENCE_CANDLE_FROM_SET.get(value, "Atual")
    if input_name == "InpTempoGraficoDoFiltro":
        return "Corrente" if value.lower() == "current" else value
    return value


def _infer_stop_loss_mode(values: dict[str, str | bool]) -> None:
    if bool(values.get("stop_loss.fixed.enabled")):
        values["stop_loss.mode"] = "fixed"
        return

    mode = str(values.get("stop_loss.mode", "")).strip()
    calc_method = str(values.get("stop_loss.calc_method", "")).strip()
    if mode == "calc" and calc_method in {"ref", "med", "maxmin"}:
        return

    ref_distance = str(values.get("stop_loss.calc.reference.distance", "")).strip()
    ref_base = str(values.get("stop_loss.calc.reference.base", "")).strip()
    ref_candle = str(values.get("stop_loss.calc.reference.candle", "")).strip()
    if ref_distance not in {"", "0", "0.0"} or ref_base not in {"", "Maxima"} or ref_candle not in {"", "Atual"}:
        values["stop_loss.mode"] = "calc"
        values["stop_loss.calc_method"] = "ref"
        return

    media_distance = str(values.get("stop_loss.calc.media.distance", "")).strip()
    media_candles = str(values.get("stop_loss.calc.media.candles", "")).strip()
    media_base = str(values.get("stop_loss.calc.media.base", "")).strip()
    if media_distance not in {"", "0", "0.0"} or media_candles not in {"", "3"} or media_base not in {"", "Maxima"}:
        values["stop_loss.mode"] = "calc"
        values["stop_loss.calc_method"] = "med"
        return

    values["stop_loss.mode"] = "none"


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
        if input_name.strip() == "InpUsarStopLossPorReferencia":
            if _parse_bool(raw_value):
                values["stop_loss.mode"] = "calc"
                values["stop_loss.calc_method"] = "ref"
                values["stop_loss.fixed.enabled"] = False
            continue
        if input_name.strip() == "InpUsarStopLossPorMedia":
            if _parse_bool(raw_value):
                values["stop_loss.mode"] = "calc"
                values["stop_loss.calc_method"] = "med"
                values["stop_loss.fixed.enabled"] = False
            continue

        for store_key in store_keys:
            values[store_key] = mapped_value

    _infer_stop_loss_mode(values)
    return values
