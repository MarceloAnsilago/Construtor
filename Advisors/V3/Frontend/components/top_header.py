import customtkinter as ctk

from themes.theme import UITheme


class TopHeader(ctk.CTkFrame):
    def __init__(self, master, theme: UITheme, on_import_set=None, on_export_set=None) -> None:
        super().__init__(
            master,
            fg_color=theme.colors.surface,
            corner_radius=18,
            height=82,
            border_width=1,
            border_color=theme.colors.border,
        )
        self.grid_columnconfigure(0, weight=1)
        self.grid_columnconfigure(1, weight=0)
        self.grid_columnconfigure(2, weight=0)
        self.grid_columnconfigure(3, weight=0)
        self.grid_propagate(False)
        self._theme = theme

        stripe = ctk.CTkFrame(
            self,
            fg_color=theme.colors.accent,
            corner_radius=8,
            height=5,
            border_width=0,
        )
        stripe.grid(row=2, column=0, columnspan=4, sticky="ew", padx=18, pady=(0, 12))

        ctk.CTkLabel(
            self,
            text="Criando seu robo",
            text_color=theme.colors.text,
            font=theme.font("subtitle", weight="bold"),
            anchor="w",
        ).grid(row=0, column=0, sticky="w", padx=18, pady=(14, 0))

        ctk.CTkLabel(
            self,
            text="Robos > Modo > Estrategia > Ambiente > Configurar",
            text_color=theme.colors.text_subtle,
            font=theme.font("label"),
            anchor="w",
        ).grid(row=1, column=0, sticky="w", padx=18, pady=(4, 10))

        self._status = ctk.CTkLabel(
            self,
            text="Pronto para exportar .set",
            text_color=theme.colors.text_muted,
            font=theme.font("label"),
            anchor="e",
        )
        self._status.grid(row=1, column=1, sticky="e", padx=(0, 10), pady=(4, 10))

        self._import_button = ctk.CTkButton(
            self,
            text="Abrir .set",
            command=on_import_set,
            height=38,
            width=136,
            corner_radius=12,
            fg_color=theme.colors.surface_alt,
            hover_color=theme.colors.sidebar_item_hover,
            text_color=theme.colors.text,
            border_width=1,
            border_color=theme.colors.border,
            font=theme.font("label", weight="bold"),
        )
        self._import_button.grid(row=1, column=2, sticky="e", padx=(0, 10), pady=(4, 10))

        self._export_button = ctk.CTkButton(
            self,
            text="Exportar .set",
            command=on_export_set,
            height=38,
            width=144,
            corner_radius=12,
            fg_color=theme.colors.accent,
            hover_color=theme.colors.accent_hover,
            text_color=theme.colors.header_text,
            font=theme.font("label", weight="bold"),
        )
        self._export_button.grid(row=1, column=3, sticky="e", padx=(0, 18), pady=(4, 10))

    def set_status(self, text: str, success: bool = True) -> None:
        color = self._theme.colors.text if success else self._theme.colors.accent_soft
        self._status.configure(text=text, text_color=color)
