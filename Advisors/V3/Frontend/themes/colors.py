from dataclasses import dataclass


@dataclass(frozen=True)
class ColorPalette:
    app_background: str = "#F4F6F7"
    sidebar: str = "#EEF2F3"
    surface: str = "#FFFFFF"
    surface_alt: str = "#F8FBFB"
    card: str = "#FFFFFF"
    card_soft: str = "#EFF6F5"
    border: str = "#D8E2E3"
    border_strong: str = "#BECFD1"
    text: str = "#263234"
    text_muted: str = "#617073"
    text_subtle: str = "#879497"
    accent: str = "#18B4AB"
    accent_soft: str = "#65CAC4"
    accent_hover: str = "#109991"
    sidebar_item_hover: str = "#E4F2F1"
    sidebar_item_active: str = "#D7EFED"
    header_dark: str = "#1F4C51"
    header_text: str = "#F8FCFC"


def modern_legacy_palette() -> ColorPalette:
    return ColorPalette(
        app_background="#F4F6F7",
        sidebar="#EEF2F3",
        surface="#FFFFFF",
        surface_alt="#F8FBFB",
        card="#FFFFFF",
        card_soft="#EFF6F5",
        border="#D8E2E3",
        border_strong="#BECFD1",
        text="#263234",
        text_muted="#617073",
        text_subtle="#879497",
        accent="#18B4AB",
        accent_soft="#65CAC4",
        accent_hover="#109991",
        sidebar_item_hover="#E4F2F1",
        sidebar_item_active="#D7EFED",
        header_dark="#1F4C51",
        header_text="#F8FCFC",
    )


def v2_classic_palette() -> ColorPalette:
    return ColorPalette(
        app_background="#F4F6F7",
        sidebar="#EEF2F3",
        surface="#FFFFFF",
        surface_alt="#F8FBFB",
        card="#FFFFFF",
        card_soft="#EFF6F5",
        border="#D8E2E3",
        border_strong="#BECFD1",
        text="#263234",
        text_muted="#617073",
        text_subtle="#879497",
        accent="#18B4AB",
        accent_soft="#65CAC4",
        accent_hover="#109991",
        sidebar_item_hover="#E4F2F1",
        sidebar_item_active="#D7EFED",
        header_dark="#1F4C51",
        header_text="#F8FCFC",
    )
