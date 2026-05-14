from __future__ import annotations

from copy import deepcopy

from schema.parameter_registry import PARAMETER_BY_KEY, default_values


class StrategyStore:
    def __init__(self) -> None:
        self._values: dict[str, str | bool] = default_values()

    def get(self, key: str) -> str | bool:
        if key not in PARAMETER_BY_KEY:
            raise KeyError(f"Unknown strategy key: {key}")
        return self._values.get(key, PARAMETER_BY_KEY[key].default)

    def set(self, key: str, value: str | bool) -> None:
        if key not in PARAMETER_BY_KEY:
            raise KeyError(f"Unknown strategy key: {key}")
        self._values[key] = value

    def snapshot(self) -> dict[str, str | bool]:
        return deepcopy(self._values)

    def load_document(self, values: dict[str, str | bool]) -> None:
        for key, value in values.items():
            if key in PARAMETER_BY_KEY:
                self._values[key] = value
