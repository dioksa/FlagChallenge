import SwiftUI

struct FinishView: View {
    let correctAnswers: Int
    let wrongAnswers: Int
    var restartGame: () -> Void

    var body: some View {
        VStack(alignment: .center) {
            Text("You've completed the game!")
                .font(FontStyle.regularLobster.font(size: .h48))
                .multilineTextAlignment(.center)

            Text("Last game results:")
                .font(FontStyle.regular.font(size: .h24))
                .padding(.top, 48)
                .padding(.bottom, 24)
            
            VStack {
                ResultRow(label: "Correct:", value: correctAnswers, backgroundColor: Color.eucalyptus.opacity(0.1), textColor: .black)
                ResultRow(label: "Wrong:", value: wrongAnswers, backgroundColor: Color.orange.opacity(0.1), textColor: .black)
            }

            Button(action: {
                restartGame()
            }) {
                CustomButtonStyle(title: "Play Again")
            }
            .padding(.top, 60)
        }
        .padding()
    }
}

#Preview {
    FinishView(correctAnswers: 2, wrongAnswers: 3, restartGame: { })
}
