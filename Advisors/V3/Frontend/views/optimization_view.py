import customtkinter as ctk

from themes.theme import UITheme


class OptimizationView(ctk.CTkFrame):
    def __init__(self, master, theme: UITheme) -> None:
        super().__init__(master, fg_color="transparent")
        self._theme = theme
        self._value_refs: dict[str, ctk.CTkLabel] = {}
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(1, weight=1)

        self._build_header()
        self._build_body()
        self.refresh_from_configs({}, {})

    def _build_header(self) -> None:
        header = ctk.CTkFrame(
            self,
            fg_color=self._theme.colors.card,
            corner_radius=0,
            border_width=1,
            border_color=self._theme.colors.border,
        )
        header.grid(row=0, column=0, sticky="ew", padx=6, pady=(4, 10))
        header.grid_columnconfigure(0, weight=1)

        ctk.CTkLabel(
            header,
            text="Parametros Ja Selecionados",
            anchor="w",
            text_color=self._theme.colors.text,
            font=self._theme.font("subtitle"),
        ).grid(row=0, column=0, sticky="ew", padx=16, pady=(16, 6))

        ctk.CTkLabel(
            header,
            text="Esta tela consolida o que ja foi configurado nas etapas anteriores para preparar a otimizacao e a execucao.",
            justify="left",
            anchor="w",
            wraplength=920,
            text_color=self._theme.colors.text_muted,
            font=self._theme.font("body"),
        ).grid(row=1, column=0, sticky="ew", padx=16, pady=(0, 16))

    def _build_body(self) -> None:
        body = ctk.CTkFrame(self, fg_color="transparent")
        body.grid(row=1, column=0, sticky="nsew")
        body.grid_columnconfigure((0, 1), weight=1, uniform="opt-cards")
        body.grid_rowconfigure(0, weight=1)

        basics = self._create_card(body, 0, "Obrigatorios")
        self._add_summary_row(basics, 0, "Nome do EA", "strategy_name", "Minha estrategia")
        self._add_summary_row(basics, 1, "Magic Number", "magic_number", "100000")
        self._add_summary_row(basics, 2, "Volume inicial", "initial_volume", "100")
        self._add_summary_row(basics, 3, "Spread maximo", "max_spread", "100")

        signals = self._create_card(body, 1, "Sinais e Filtro")
        self._add_summary_row(signals, 0, "Modo de ordem", "signal_order_mode", "Mercado")
        self._add_summary_row(signals, 1, "Limite", "signal_limit_summary", "Referencia | Maxima | Atual | Nao | 0 | Nao expirar")
        self._add_summary_row(signals, 2, "Filtro ativo", "signal_filter_enabled", "Nao")
        self._add_summary_row(signals, 3, "Medir em", "signal_filter_measure", "Pontos")
        self._add_summary_row(signals, 4, "Tempo grafico", "signal_filter_timeframe", "Corrente")
        self._add_summary_row(signals, 5, "Vela p-a-p min / max", "signal_filter_candle_range", "0 / 0")
        self._add_summary_row(signals, 6, "Corpo min / max", "signal_filter_body_range", "0 / 0")
        self._add_summary_row(signals, 7, "Pavio sup. min / max", "signal_filter_upper_wick_range", "0 / 0")
        self._add_summary_row(signals, 8, "Pavio inf. min / max", "signal_filter_lower_wick_range", "0 / 0")

    def _create_card(self, master, column: int, title: str) -> ctk.CTkFrame:
        card = ctk.CTkFrame(
            master,
            fg_color=self._theme.colors.card,
            corner_radius=0,
            border_width=1,
            border_color=self._theme.colors.border,
        )
        card.grid(row=0, column=column, sticky="nsew", padx=6, pady=4)
        card.grid_columnconfigure(0, weight=1)

        ctk.CTkLabel(
            card,
            text=title,
            anchor="w",
            text_color=self._theme.colors.text,
            font=self._theme.font("subtitle"),
        ).grid(row=0, column=0, sticky="ew", padx=16, pady=(16, 12))
        return card

    def _add_summary_row(
        self,
        card: ctk.CTkFrame,
        row: int,
        title: str,
        key: str,
        default_value: str,
    ) -> None:
        container = ctk.CTkFrame(
            card,
            fg_color=self._theme.colors.surface_alt,
            corner_radius=0,
            border_width=1,
            border_color=self._theme.colors.border,
        )
        container.grid(row=row + 1, column=0, sticky="ew", padx=16, pady=(0, 12))
        container.grid_columnconfigure(0, weight=1)

        ctk.CTkLabel(
            container,
            text=title,
            anchor="w",
            text_color=self._theme.colors.text_muted,
            font=self._theme.font("label"),
        ).grid(row=0, column=0, sticky="ew", padx=12, pady=(10, 2))

        value_label = ctk.CTkLabel(
            container,
            text=default_value,
            anchor="w",
            text_color=self._theme.colors.text,
            font=self._theme.font("body"),
        )
        value_label.grid(row=1, column=0, sticky="ew", padx=12, pady=(0, 10))
        self._value_refs[key] = value_label

    def refresh_from_configs(self, initial_config: dict[str, str], signals_config: dict[str, str]) -> None:
        self._set_value("strategy_name", initial_config.get("strategy_name", "").strip() or "Minha estrategia")
        self._set_value("magic_number", initial_config.get("magic_number", "").strip() or "100000")
        self._set_value("initial_volume", initial_config.get("initial_volume", "").strip() or "100")
        self._set_value("max_spread", initial_config.get("max_spread", "").strip() or "100")

        self._set_value("signal_order_mode", signals_config.get("signal_order_mode", "").strip() or "Mercado")
        limit_mode = signals_config.get("signal_limit_mode", "").strip() or "Referencia"
        limit_base = signals_config.get("signal_limit_reference_base", "").strip() or "Maxima"
        limit_candle = signals_config.get("signal_limit_reference_candle", "").strip() or "Atual"
        limit_move = signals_config.get("signal_limit_reference_move_next_candle", "").strip() or "Nao"
        limit_distance = signals_config.get("signal_limit_reference_distance", "").strip() or "0"
        limit_expire = signals_config.get("signal_limit_reference_expire", "").strip() or "Nao expirar"
        self._set_value("signal_limit_summary", f"{limit_mode} | {limit_base} | {limit_candle} | {limit_move} | {limit_distance} | {limit_expire}")
        self._set_value("signal_filter_enabled", signals_config.get("signal_filter_enabled", "").strip() or "Nao")
        self._set_value("signal_filter_measure", signals_config.get("signal_filter_measure", "").strip() or "Pontos")
        self._set_value("signal_filter_timeframe", signals_config.get("signal_filter_timeframe", "").strip() or "Corrente")

        candle_min = signals_config.get("signal_filter_candle_min", "").strip() or "0"
        candle_max = signals_config.get("signal_filter_candle_max", "").strip() or "0"
        body_min = signals_config.get("signal_filter_body_min", "").strip() or "0"
        body_max = signals_config.get("signal_filter_body_max", "").strip() or "0"
        upper_wick_min = signals_config.get("signal_filter_upper_wick_min", "").strip() or "0"
        upper_wick_max = signals_config.get("signal_filter_upper_wick_max", "").strip() or "0"
        lower_wick_min = signals_config.get("signal_filter_lower_wick_min", "").strip() or "0"
        lower_wick_max = signals_config.get("signal_filter_lower_wick_max", "").strip() or "0"

        self._set_value("signal_filter_candle_range", f"{candle_min} / {candle_max}")
        self._set_value("signal_filter_body_range", f"{body_min} / {body_max}")
        self._set_value("signal_filter_upper_wick_range", f"{upper_wick_min} / {upper_wick_max}")
        self._set_value("signal_filter_lower_wick_range", f"{lower_wick_min} / {lower_wick_max}")

    def _set_value(self, key: str, value: str) -> None:
        label = self._value_refs.get(key)
        if label is not None:
            label.configure(text=value)
