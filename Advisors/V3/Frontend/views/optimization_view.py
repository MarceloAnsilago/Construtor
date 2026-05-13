import customtkinter as ctk

from themes.theme import UITheme


class OptimizationView(ctk.CTkFrame):
    def __init__(self, master, theme: UITheme) -> None:
        super().__init__(master, fg_color="transparent")
        self._theme = theme
        self._value_refs: dict[str, ctk.CTkLabel] = {}
        self._status_refs: dict[str, ctk.CTkLabel] = {}

        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(1, weight=1)

        self._build_header()
        self._build_body()
        self.refresh_from_initial_config({})

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
            text="A tela de otimizacao agora mostra os inputs obrigatorios que ja vieram da etapa Inf. Iniciais. O proximo passo sera expandir isso para faixas de inicio, fim e passo.",
            justify="left",
            anchor="w",
            wraplength=920,
            text_color=self._theme.colors.text_muted,
            font=self._theme.font("body"),
        ).grid(row=1, column=0, sticky="ew", padx=16, pady=(0, 16))

    def _build_body(self) -> None:
        body = ctk.CTkFrame(self, fg_color="transparent")
        body.grid(row=1, column=0, sticky="nsew")
        body.grid_columnconfigure(0, weight=1)
        body.grid_columnconfigure(1, weight=1)

        summary = self._create_card(body, 0, "Resumo da Configuracao")
        self._add_summary_row(
            summary,
            row=0,
            title="Nome do EA",
            key="strategy_name",
            status="Fixo",
            note="Texto herdado da etapa inicial.",
        )
        self._add_summary_row(
            summary,
            row=1,
            title="Magic Number",
            key="magic_number",
            status="Selecionado",
            note="Valor base pronto para entrar no fluxo de otimizacao.",
        )

        next_steps = self._create_card(body, 1, "Proximas Etapas")
        self._add_step(next_steps, 0, "Adicionar faixas de inicio, fim e passo para inputs numericos.")
        self._add_step(next_steps, 1, "Gerar configuracao consumivel pelo Strategy Tester do MT5.")
        self._add_step(next_steps, 2, "Permitir iniciar a otimizacao direto da interface.")

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
        status: str,
        note: str,
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
        container.grid_columnconfigure(1, weight=0)

        ctk.CTkLabel(
            container,
            text=title,
            anchor="w",
            text_color=self._theme.colors.text,
            font=self._theme.font("label", weight="bold"),
        ).grid(row=0, column=0, sticky="w", padx=12, pady=(12, 2))

        status_label = ctk.CTkLabel(
            container,
            text=status,
            anchor="e",
            text_color=self._theme.colors.accent,
            font=self._theme.font("label"),
        )
        status_label.grid(row=0, column=1, sticky="e", padx=12, pady=(12, 2))

        value_label = ctk.CTkLabel(
            container,
            text="-",
            anchor="w",
            text_color=self._theme.colors.text,
            font=self._theme.font("body"),
        )
        value_label.grid(row=1, column=0, columnspan=2, sticky="ew", padx=12, pady=(0, 4))

        ctk.CTkLabel(
            container,
            text=note,
            anchor="w",
            justify="left",
            wraplength=400,
            text_color=self._theme.colors.text_subtle,
            font=self._theme.font("label"),
        ).grid(row=2, column=0, columnspan=2, sticky="ew", padx=12, pady=(0, 12))

        self._value_refs[key] = value_label
        self._status_refs[key] = status_label

    def _add_step(self, card: ctk.CTkFrame, row: int, text: str) -> None:
        ctk.CTkLabel(
            card,
            text=f"{row + 1:02d}. {text}",
            anchor="w",
            justify="left",
            wraplength=400,
            text_color=self._theme.colors.text_muted,
            font=self._theme.font("body"),
        ).grid(row=row + 1, column=0, sticky="ew", padx=16, pady=(0, 12))

    def refresh_from_initial_config(self, config: dict[str, str]) -> None:
        strategy_name = config.get("strategy_name", "").strip() or "Minha estrategia"
        magic_number = config.get("magic_number", "").strip() or "100000"

        self._value_refs["strategy_name"].configure(text=strategy_name)
        self._value_refs["magic_number"].configure(text=magic_number)

        self._status_refs["strategy_name"].configure(text="Fixo")
        self._status_refs["magic_number"].configure(text="Selecionado")
