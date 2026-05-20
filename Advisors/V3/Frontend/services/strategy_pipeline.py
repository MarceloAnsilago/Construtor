from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

from services.set_export import get_current_set_path, write_set_file
from services.validation_service import ValidationResult, validate_initial_settings
from state.strategy_store import StrategyStore


@dataclass(frozen=True)
class PipelineResult:
    is_valid: bool
    status_text: str
    errors: tuple[str, ...]
    set_path: Path | None


def sync_validate_and_write_current_set(
    store: StrategyStore,
    initial_config: dict[str, str],
) -> PipelineResult:
    validation = validate_initial_settings(initial_config)
    if not validation.is_valid:
        return _build_error_result(validation)

    destination = get_current_set_path(str(store.get("strategy.name")))
    written_path = write_set_file(store, destination)
    return PipelineResult(
        is_valid=True,
        status_text=f".set atualizado: {written_path.name}",
        errors=(),
        set_path=written_path,
    )


def _build_error_result(validation: ValidationResult) -> PipelineResult:
    first_error = validation.errors[0] if validation.errors else "Configuracao invalida."
    return PipelineResult(
        is_valid=False,
        status_text=f"Erro: {first_error}",
        errors=validation.errors,
        set_path=None,
    )
