import atexit
import ctypes
from ctypes import wintypes

from layouts.main_window import AlphaForgeApp


APP_TITLE = "Construtor | AlphaForge V3"
MUTEX_NAME = "AlphaForgeV3FrontendSingleton"
ERROR_ALREADY_EXISTS = 183
SW_RESTORE = 9

_mutex_handle = None


def _focus_existing_window() -> None:
    user32 = ctypes.windll.user32
    hwnd = user32.FindWindowW(None, APP_TITLE)
    if not hwnd:
        return

    user32.ShowWindow(hwnd, SW_RESTORE)
    user32.SetForegroundWindow(hwnd)


def _release_singleton() -> None:
    global _mutex_handle
    if _mutex_handle:
        ctypes.windll.kernel32.CloseHandle(_mutex_handle)
        _mutex_handle = None


def _acquire_singleton() -> bool:
    global _mutex_handle
    kernel32 = ctypes.windll.kernel32
    kernel32.SetLastError(0)
    kernel32.CreateMutexW.argtypes = [wintypes.LPVOID, wintypes.BOOL, wintypes.LPCWSTR]
    kernel32.CreateMutexW.restype = wintypes.HANDLE
    _mutex_handle = kernel32.CreateMutexW(None, False, MUTEX_NAME)
    if not _mutex_handle:
        return True

    if kernel32.GetLastError() == ERROR_ALREADY_EXISTS:
        _focus_existing_window()
        _release_singleton()
        return False

    atexit.register(_release_singleton)
    return True


def main() -> None:
    if not _acquire_singleton():
        return
    app = AlphaForgeApp()
    app.run()


if __name__ == "__main__":
    main()
