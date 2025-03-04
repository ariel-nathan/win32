# Odin Win32 Window Template

A minimal template for creating Windows applications using the Odin programming language and the Win32 API.

## Overview

This repository provides a starting point for developing Windows desktop applications with Odin. It includes the basic setup required to create and display a window using the Windows API (Win32).

## Prerequisites

- [Odin Compiler](https://odin-lang.org/docs/install/) - Make sure you have Odin installed and properly set up
- [Odin Language Server](https://github.com/DanielGavin/ols) (Optional)
- Windows operating system
- Basic understanding of the Odin programming language

## Getting Started

1. Clone this repository:

2. Build and run the application:
   ```
   odin build .
   win32.exe
   ```

## Project Structure

```
win32/
├── main.odin       # Main entry point with WinMain and window creation
├── ols.json        # Odin Language Server config (optional)
└── README.md       # This file
```

## Customization

You can customize your window by modifying:

- Window class name and title
- Window styles
- Window dimensions
- Message handling in the window procedure

## Resources

- [Odin Documentation](https://odin-lang.org/docs/)
- [Win32 API Documentation](https://docs.microsoft.com/en-us/windows/win32/)

## License

This project is available under the MIT License. See LICENSE file for details.
