# Tetris Game for iPhone

A fully functional Tetris-like game built with Swift and SwiftUI for iOS devices.

## Features

- 🎮 Classic Tetris gameplay
- 📱 Optimized for iPhone
- 🎯 Score tracking with progressive multipliers
- 🏆 Game over detection
- 🎨 Colorful tetromino pieces (I, O, T, S, Z, J, L)
- ⬇️ Gravity system with smooth falling
- 🔄 Piece rotation with collision detection
- 🗑️ Line clearing with points
- ⏸️ Pause/Resume functionality
- 👀 Next piece preview

## Requirements

- iOS 16.0 or later
- Xcode 14.0 or later
- Swift 5.7+

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/rezoo-web/tetris-game.git
   cd tetris-game
   ```

2. Open the project in Xcode:
   ```bash
   open TetrisGame.xcodeproj
   ```

3. Select your target device (iPhone simulator or physical device)
4. Press Cmd+R to build and run

## How to Play

- **Tap to Start:** Begin the game from the start screen
- **Swipe Left/Right:** Move piece left or right
- **Rotate Button:** Rotate the falling piece
- **Left/Right Arrows:** Alternative move controls
- **Drop Button:** Instantly drop the piece
- **Pause Button:** Pause and resume the game

## Game Rules

- The board is 10 columns × 20 rows
- Pieces spawn at the top of the board
- Complete horizontal rows to clear them and score points
- Gravity automatically pulls pieces down
- Game ends when pieces reach the top
- Score increases with each line cleared (100 × number of lines × number of lines)

## Scoring System

- 1 Line: 100 points
- 2 Lines: 400 points
- 3 Lines: 900 points
- 4 Lines: 1600 points

## Project Structure

```
TetrisGame/
├── TetrisGameApp.swift          # App entry point
├── Models/
│   ├── Tetromino.swift          # Piece types and rotation logic
│   ├── GameBoard.swift          # Grid management and collision
│   └── GameState.swift          # Game engine and state management
└── Views/
    ├── GameView.swift           # Main game screen
    ├── BoardView.swift          # Game board rendering
    └── PieceView.swift          # Next piece preview
```

## Architecture

### Tetromino.swift
Defines all 7 piece types with:
- Shape matrices for each piece
- Rotation logic (90° increments)
- Color assignment
- Movement methods (left, right, down)

### GameBoard.swift
Manages the 10×20 game grid:
- Collision detection for pieces
- Line clearing and score calculation
- Grid state management

### GameState.swift
Observable game engine:
- Game loop with gravity timer
- Score tracking
- Piece spawning and management
- Game state (running, paused, over)

### Views
SwiftUI components for rendering and interaction:
- BoardView: Renders the game grid and falling piece
- GameView: Main UI with controls and status
- PieceView: Displays the next piece preview

## Customization

You can customize:
- **Gravity Speed:** Change `gravityInterval` in `GameState.swift`
- **Board Size:** Modify `width` and `height` in `GameBoard.swift`
- **Piece Colors:** Edit color values in `Tetromino.swift`
- **Scoring:** Adjust multipliers in `spawnNewPiece()` method

## License

MIT License - feel free to use this for learning and development!

## Future Enhancements

Potential features to add:
- Sound effects
- Difficulty levels
- High score persistence
- Animations and particle effects
- Multiplayer mode
- Leaderboards
