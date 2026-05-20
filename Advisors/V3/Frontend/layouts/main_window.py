from pathlib import Path
from tkinter import filedialog

import customtkinter as ctk

from components.sidebar import Sidebar
from components.top_header import TopHeader
from models.navigation import NavigationItem, build_navigation_items
from services.set_export import get_default_set_dir, read_set_file, write_set_file
from themes.theme import UITheme, configure_ctk
from views.dashboard_view import DashboardView


class AlphaForgeApp(ctk.CTk):
    def __init__(self) -> None:
        self._theme = UITheme()
        configure_ctk(self._theme)
        super().__init__()

        self._navigation_items = build_navigation_items()
        self._active_item = self._navigation_items[0]

        self.title("AlphaForge V3")
        self.geometry("1440x900")
        self.minsize(1180, 760)
        self.configure(fg_color=self._theme.colors.app_background)

        self.grid_columnconfigure(1, weight=1)
        self.grid_rowconfigure(0, weight=1)

        self._build_shell()
        self._select_item(self._active_item)

    def run(self) -> None:
        self.mainloop()

    def _build_shell(self) -> None:
        self._sidebar = Sidebar(
            self,
            items=self._navigation_items,
            theme=self._theme,
            on_select=self._select_item,
        )
        self._sidebar.grid(row=0, column=0, sticky="nsw")

        main_shell = ctk.CTkFrame(
            self,
            fg_color=self._theme.colors.app_background,
            corner_radius=0,
        )
        main_shell.grid(row=0, column=1, sticky="nsew")
        main_shell.grid_rowconfigure(1, weight=1)
        main_shell.grid_columnconfigure(0, weight=1)

        header = TopHeader(
            main_shell,
            self._theme,
            on_refresh=self._refresh_strategy,
            on_import_set=self._import_set,
            on_export_set=self._export_set,
        )
        header.grid(row=0, column=0, sticky="ew")
        self._header = header

        self._content = DashboardView(main_shell, self._theme)
        self._content.grid(row=1, column=0, sticky="nsew", padx=20, pady=(10, 16))

    def _select_item(self, item: NavigationItem) -> None:
        self._active_item = item
        self._sidebar.set_active(item.item_id)
        self._content.set_section(item)

    def _import_set(self) -> None:
        source = filedialog.askopenfilename(
            title="Abrir arquivo .set",
            initialdir=str(get_default_set_dir()),
            filetypes=[("MetaTrader set", "*.set"), ("Todos os arquivos", "*.*")],
        )
        if not source:
            return

        imported_values = read_set_file(Path(source))
        self._content.load_strategy_values(imported_values)
        self._header.set_status(f".set carregado: {Path(source).name}")

    def _refresh_strategy(self) -> None:
        result = self._content.refresh_and_prepare_current_set()
        self._header.set_status(result.status_text, success=result.is_valid)

    def _export_set(self) -> None:
        strategy_name = self._content.current_strategy_name().strip() or "alpha_strategy"
        safe_name = "".join(char if char.isalnum() or char in ("-", "_") else "_" for char in strategy_name).strip("_")
        if not safe_name:
            safe_name = "alpha_strategy"

        destination = filedialog.asksaveasfilename(
            title="Salvar arquivo .set",
            defaultextension=".set",
            initialdir=str(get_default_set_dir()),
            initialfile=f"{safe_name}.set",
            filetypes=[("MetaTrader set", "*.set"), ("Todos os arquivos", "*.*")],
        )
        if not destination:
            return

        exported = write_set_file(self._content.strategy_store(), Path(destination))
        self._header.set_status(f".set OK: {exported.name}")
