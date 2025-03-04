package win32

import "base:runtime"
import win "core:sys/windows"

main :: proc() {
	instance := win.HINSTANCE(win.GetModuleHandleW(nil))
	assert(instance != nil, "Failed to fetch current instance")

	class_name := win.L("win32")

	cls := win.WNDCLASSW {
		lpfnWndProc   = win_proc,
		lpszClassName = class_name,
		hInstance     = instance,
		hCursor       = win.LoadCursorA(nil, win.IDC_ARROW),
	}

	class := win.RegisterClassW(&cls)
	assert(class != 0, "Class creation failed")

	hwnd := win.CreateWindowW(
		class_name,
		win.L("win32"),
		win.WS_OVERLAPPEDWINDOW | win.WS_VISIBLE,
		win.CW_USEDEFAULT,
		win.CW_USEDEFAULT,
		800,
		600,
		nil,
		nil,
		instance,
		nil,
	)
	assert(hwnd != nil, "Window creation Failed")

	msg: win.MSG
	for win.GetMessageW(&msg, nil, 0, 0) > 0 {
		win.TranslateMessage(&msg)
		win.DispatchMessageW(&msg)
	}
}

win_proc :: proc "stdcall" (
	hwnd: win.HWND,
	msg: win.UINT,
	wparam: win.WPARAM,
	lparam: win.LPARAM,
) -> win.LRESULT {
	context = runtime.default_context()

	switch (msg) {
	case win.WM_DESTROY:
		return WM_DESTROY(hwnd)
	case win.WM_PAINT:
		return WM_PAINT(hwnd)
	}

	return win.DefWindowProcW(hwnd, msg, wparam, lparam)
}

WM_DESTROY :: proc(hwnd: win.HWND) -> win.LRESULT {
	win.PostQuitMessage(0)
	return 0
}

WM_PAINT :: proc(hwnd: win.HWND) -> win.LRESULT {
	ps: win.PAINTSTRUCT
	hdc := win.BeginPaint(hwnd, &ps)
	defer win.EndPaint(hwnd, &ps)

	brush := win.HBRUSH(uintptr(win.COLOR_WINDOW + 1))
	win.FillRect(hdc, &ps.rcPaint, brush)

	return 0
}
