# BitEngine - A Simple and Modular 2D Game Engine

BitEngine is a lightweight, modular 2D game engine designed for simplicity and ease of use. Built with C++, it provides essential tools and components to kickstart your 2D game development journey. Perfect for learning and experimentation!

---

## Features

- **2D Rendering**: Basic sprite/texture rendering capabilities.
- **Input Handling**: Keyboard and mouse input support.
- **Modular Architecture**: Separated `Engine` and `Game` codebases for clarity.
- **Cross-Platform Setup**: Premake5 project generation for flexible builds.

---

## Project Structure
```bash
    BitEngine/
    ├── Engine/                 # Core engine source code
    │ ├── include/              # Public headers
    │ └── src/                  # Implementation files
    │               
    ├── Game/                   # Example game/demo project
    │ ├── include/              # Game-specific headers
    │ └── src/                  # Game logic and scripts
    │               
    ├── Scripts/                # Build utilities
    │ ├── buildsin.bat          # Quick build script (Windows)
    │ └── gensln.bat            # Solution generation script
    │               
    ├── Vendor/                 # Third-party dependencies (SDL2, Lua, etc.)
    ├── premake5.lua            # Build configuration
    ├── LICENSE                 # MIT License
    └── README.md               # This file
```
---

## Getting Started

### Prerequisites
- **Compiler**: MSVC (Visual Studio 2022 recommended).

### Installation
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/catalanomircosav/BitEngine.git
   cd BitEngine
   ```
2. **Generate** Project Files:
Run `scripts/gensln.bat` to generate the Visual Studio solution.

3. **Build** the Engine:
- Open `BitEngine.sln` (generated in the root directory).
- Build the `Engine` and `Game` projects.
- Alternatively, use `scripts/buildsin.bat` for a quick build.

4. **Run** the Demo:
The compiled executable will be located in Game/bin/Debug/.
- Launch `Game.exe` to test the example project.

___

## Adding Your Own Game
Modify the Game project:
1. Add your code to `Game/src/` and headers to `Game/include/`.
2. Place assets (textures, sounds) in Game/assets/.
3. Extend the Engine:
    - Add new modules to `Engine/src/` (e.g., physics, UI systems).

___

## Contributing

Contributions are welcome! Please follow these guidelines:
- Code Style:
    1. Use `CamelCase` for classes, `snake_case` for functions/variables.
    2. Keep dependencies minimal.

- Process:
    1. Fork the repository and create a feature branch (`feature/your-feature`).
    2. Test changes thoroughly.
    3. Submit a pull request with a clear description.

___

## License
Distributed under the `MIT` License. See `LICENSE` for details.

___

## Acknowledgements
- Premake5: For painless project setup.
- SDL2 & raylib: Inspiration for modular design.

___

#### A Note from the Author
🚨 Disclaimer: This is a learning project! I'm a CS student exploring game engine architecture. The code may have quirks, but it's built with passion for graphics and systems programming. Feedback and patience are appreciated! 🙏
- For now, the project can only be built for Windows. Other platforms may be supported in the future.