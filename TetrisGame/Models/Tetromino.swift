import SwiftUI

enum TetrominoType: CaseIterable {
    case i, o, t, s, z, j, l
    
    var shape: [[Bool]] {
        switch self {
        case .i:
            return [
                [true, true, true, true]
            ]
        case .o:
            return [
                [true, true],
                [true, true]
            ]
        case .t:
            return [
                [false, true, false],
                [true, true, true]
            ]
        case .s:
            return [
                [false, true, true],
                [true, true, false]
            ]
        case .z:
            return [
                [true, true, false],
                [false, true, true]
            ]
        case .j:
            return [
                [true, false, false],
                [true, true, true]
            ]
        case .l:
            return [
                [false, false, true],
                [true, true, true]
            ]
        }
    }
    
    var color: Color {
        switch self {
        case .i: return .cyan
        case .o: return .yellow
        case .t: return .purple
        case .s: return .green
        case .z: return .red
        case .j: return .blue
        case .l: return .orange
        }
    }
}

struct Tetromino {
    let type: TetrominoType
    var x: Int = 4
    var y: Int = 0
    var rotation: Int = 0
    
    var shape: [[Bool]] {
        var current = type.shape
        for _ in 0..<rotation {
            current = rotateClockwise(current)
        }
        return current
    }
    
    var color: Color {
        type.color
    }
    
    mutating func rotateClockwise() {
        rotation = (rotation + 1) % 4
    }
    
    mutating func moveLeft() {
        x -= 1
    }
    
    mutating func moveRight() {
        x += 1
    }
    
    mutating func moveDown() {
        y += 1
    }
    
    private func rotateClockwise(_ matrix: [[Bool]]) -> [[Bool]] {
        let rows = matrix.count
        let cols = matrix[0].count
        var rotated = Array(repeating: Array(repeating: false, count: rows), count: cols)
        
        for i in 0..<rows {
            for j in 0..<cols {
                rotated[j][rows - 1 - i] = matrix[i][j]
            }
        }
        return rotated
    }
}
