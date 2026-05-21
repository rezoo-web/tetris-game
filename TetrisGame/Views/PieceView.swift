import SwiftUI

struct PieceView: View {
    let piece: Tetromino
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("NEXT")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            VStack(spacing: 1) {
                ForEach(0..<piece.shape.count, id: \.self) { row in
                    HStack(spacing: 1) {
                        ForEach(0..<piece.shape[row].count, id: \.self) { col in
                            ZStack {
                                Rectangle()
                                    .fill(piece.shape[row][col] ? piece.color : Color.gray.opacity(0.2))
                                    .frame(height: 20)
                            }
                        }
                    }
                }
            }
            .padding(4)
            .background(Color.black)
            .border(Color.gray, width: 1)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

#Preview {
    PieceView(piece: Tetromino(type: .t))
}
