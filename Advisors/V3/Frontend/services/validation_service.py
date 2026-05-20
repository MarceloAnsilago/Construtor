from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class ValidationResult:
    is_valid: bool
    errors: tuple[str, ...]


def validate_initial_settings(config: dict[str, str]) -> ValidationResult:
    errors: list[str] = []

    strategy_name = config.get("strategy_name", "").strip()
    if not strategy_name:
        errors.append("Informe o nome da estrategia.")

    magic_number_text = config.get("magic_number", "").strip()
    if not magic_number_text:
        errors.append("Informe o magic number.")
    else:
        try:
            magic_number = int(magic_number_text)
            if magic_number <= 0:
                errors.append("O magic number deve ser maior que zero.")
        except ValueError:
            errors.append("O magic number deve ser inteiro.")

    initial_volume_text = config.get("initial_volume", "").strip()
    try:
        initial_volume = float(initial_volume_text)
        if initial_volume < 0:
            errors.append("O volume inicial nao pode ser negativo.")
    except ValueError:
        errors.append("O volume inicial deve ser numerico.")

    max_spread_text = config.get("max_spread", "").strip()
    try:
        max_spread = float(max_spread_text)
        if max_spread < 0:
            errors.append("O spread maximo nao pode ser negativo.")
    except ValueError:
        errors.append("O spread maximo deve ser numerico.")

    allow_buy = config.get("allow_buy", "").strip()
    allow_sell = config.get("allow_sell", "").strip()
    if allow_buy != "Sim" and allow_sell != "Sim":
        errors.append("Ative compra ou venda para gerar o .set.")

    return ValidationResult(
        is_valid=not errors,
        errors=tuple(errors),
    )
