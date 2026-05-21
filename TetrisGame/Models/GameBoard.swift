import SwiftUI

class GameBoard: ObservableObject {
    let width = 10
    let height = 20
    @Published var grid: [[Bool]]
    
    init() {
        self.grid = Array(repeating: Array(repeating: false, count: width), count: height)
    }
    
    func canPlace(_ tetromino: Tetromino) -> Bool {
        let shape = tetromino.shape
        for (row, shapeRow) in shape.enumerated() {
            for (col, isBlock) in shapeRow.enumerated() {
                if isBlock {
                    let gridX = tetromino.x + col
                    let gridY = tetromino.y + row
                    
                    if gridX < 0 || gridX >= width || gridY >= height {
                        return false
                    }
                    if gridY >= 0 && grid[gridY][gridX] {
                        return false
                    }
                }
            }
        }
        return true
    }
    
    func place(_ tetromino: Tetromino) {
        let shape = tetromino.shape
        for (row, shapeRow) in shape.enumerated() {
            for (col, isBlock) in shapeRow.enumerated() {
                if isBlock {
                    let gridX = tetromino.x + col
                    let gridY = tetromino.y + row
                    if gridY >= 0 && gridY < height && gridX >= 0 && gridX < width {
                        grid[gridY][gridX] = true
                    }
                }
            }
        }
    }
    
    func clearLines() -> Int {
        var clearedCount = 0
        var rowsToRemove: [Int] = []
        
        for (index, row) in grid.enumerated() {
            if row.allSatisfy({ $0 }) {
                rowsToRemove.append(index)
                clearedCount += 1
            }
        }
        
        for index in rowsToRemove.reversed() {
            grid.remove(at: index)
            grid.insert(Array(repeating: false, count: width), at: 0)
        }
        
        return clearedCount
    }
    
    func reset() {
        grid = Array(repeating: Array(repeating: false, count: width), count: height)
    }
}
