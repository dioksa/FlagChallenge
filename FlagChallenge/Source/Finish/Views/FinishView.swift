import SwiftUI

struct FinishView: View {
    let correctAnswers: Int
    let wrongAnswers: Int
    var restartGame: () -> Void

    var body: some View {
        VStack(alignment: .center) {
            Text("You've completed the game!")
                .font(.largeTitle)
                .padding()
                .multilineTextAlignment(.center)

            Text("Last game results:")
                .font(.title2)
                .padding()

            VStack {
                HStack {
                    Text("Correct:")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(correctAnswers)")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding()
                .background(Color.green.opacity(0.2))
                .cornerRadius(8)

                HStack {
                    Text("Wrong:")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(wrongAnswers)")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding()
                .background(Color.red.opacity(0.2))
                .cornerRadius(8)
            }

            Button(action: {
                restartGame()
            }) {
                Text("Play Again")
                    .font(.headline)
                    .frame(width: 180, height: 52)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 30)
        }
        .padding()
    }
}

#Preview {
    FinishView(correctAnswers: 2, wrongAnswers: 3, restartGame: { })
}
