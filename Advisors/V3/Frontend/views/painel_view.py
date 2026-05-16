from __future__ import annotations

import customtkinter as ctk

from themes.theme import UITheme


class PainelView(ctk.CTkFrame):
    def __init__(self, master, theme: UITheme) -> None:
        super().__init__(master, fg_color="transparent")
        self._theme = theme
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(1, weight=1)

        self._build_header()
        self._build_body()
        self.refresh_sections([])

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
            text="Painel Ativo",
            anchor="w",
            text_color=self._theme.colors.text,
            font=self._theme.font("subtitle"),
        ).grid(row=0, column=0, sticky="ew", padx=16, pady=(16, 6))

        ctk.CTkLabel(
            header,
            text="Somente os grupos em uso sao exibidos aqui, cada um em seu proprio bloco.",
            justify="left",
            anchor="w",
            wraplength=920,
            text_color=self._theme.colors.text_muted,
            font=self._theme.font("body"),
        ).grid(row=1, column=0, sticky="ew", padx=16, pady=(0, 16))

    def _build_body(self) -> None:
        self._body = ctk.CTkScrollableFrame(
            self,
            fg_color="transparent",
            corner_radius=0,
            border_width=0,
            scrollbar_button_color=self._theme.colors.accent,
            scrollbar_button_hover_color=self._theme.colors.accent_hover,
        )
        self._body.grid(row=1, column=0, sticky="nsew", padx=6, pady=(0, 6))
        self._body.grid_columnconfigure((0, 1), weight=1, uniform="painel-grid")

    def refresh_sections(self, sections: list[dict[str, object]]) -> None:
        for child in self._body.winfo_children():
            child.destroy()

        visible_sections = [section for section in sections if section.get("items")]
        if not visible_sections:
            self._build_empty_state()
            return

        for index, section in enumerate(visible_sections):
            self._create_section_card(index, section)

    def _build_empty_state(self) -> None:
        card = ctk.CTkFrame(
            self._body,
            fg_color=self._theme.colors.card,
            corner_radius=0,
            border_width=1,
            border_color=self._theme.colors.border,
        )
        card.grid(row=0, column=0, columnspan=2, sticky="ew", padx=6, pady=6)
        card.grid_columnconfigure(0, weight=1)

        ctk.CTkLabel(
            card,
            text="Nenhum grupo ativo para exibir.",
            anchor="w",
            text_color=self._theme.colors.text,
            font=self._theme.font("subtitle"),
        ).grid(row=0, column=0, sticky="ew", padx=16, pady=(16, 6))

        ctk.CTkLabel(
            card,
            text="Ative um ou mais grupos na tela de Sinais para montar o painel consolidado.",
            justify="left",
            anchor="w",
            wraplength=920,
            text_color=self._theme.colors.text_muted,
            font=self._theme.font("body"),
        ).grid(row=1, column=0, sticky="ew", padx=16, pady=(0, 16))

    def _create_section_card(self, index: int, section: dict[str, object]) -> None:
        row = index // 2
        column = index % 2
        card = ctk.CTkFrame(
            self._body,
            fg_color=self._theme.colors.card,
            corner_radius=0,
            border_width=1,
            border_color=self._theme.colors.border,
        )
        card.grid(row=row, column=column, sticky="nsew", padx=6, pady=6)
        card.grid_columnconfigure(0, weight=1)

        title = str(section.get("title", "")).strip() or "Grupo"
        items = list(section.get("items", []))

        ctk.CTkLabel(
            card,
            text=title,
            anchor="w",
            text_color=self._theme.colors.text,
            font=self._theme.font("subtitle"),
        ).grid(row=0, column=0, sticky="ew", padx=16, pady=(16, 10))

        current_row = 1
        for item in items:
            label = str(item.get("label", "")).strip()
            value = str(item.get("value", "")).strip()
            if not label or not value:
                continue

            line = ctk.CTkFrame(
                card,
                fg_color=self._theme.colors.surface_alt,
                corner_radius=0,
                border_width=1,
                border_color=self._theme.colors.border,
            )
            line.grid(row=current_row, column=0, sticky="ew", padx=16, pady=(0, 10))
            line.grid_columnconfigure(0, weight=1)

            ctk.CTkLabel(
                line,
                text=label,
                anchor="w",
                text_color=self._theme.colors.text_muted,
                font=self._theme.font("label"),
            ).grid(row=0, column=0, sticky="ew", padx=12, pady=(10, 2))

            ctk.CTkLabel(
                line,
                text=value,
                anchor="w",
                text_color=self._theme.colors.text,
                font=self._theme.font("body"),
                justify="left",
                wraplength=360,
            ).grid(row=1, column=0, sticky="ew", padx=12, pady=(0, 10))

            current_row += 1
