from __future__ import annotations

from pathlib import Path

from schema.serializers import build_tester_set_lines
from state.strategy_store import StrategyStore


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
