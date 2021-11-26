//
//  HUDView.swift
//  SharePlayTutorial (iOS)
//
//  Created by Michael Temper on 26.11.21.
//

import SwiftUI

struct HUDView: View {

    @ObservedObject var viewModel: SharePlayViewModel

    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    viewModel.resetGame()
                }
            }) {
                Image(systemName: "arrow.counterclockwise")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.background)
                    .background(.gray)
                    .cornerRadius(10)
            }
            .buttonStyle(.plain)

            Text(viewModel.gameState?.title ?? "")
                .padding()
                .background(.green)
                .foregroundColor(.background)
                .cornerRadius(10)
                .opacity(viewModel.gameState != .none ? 1 : 0)
                .frame(maxWidth: .infinity)

            Button(action: {
                viewModel.startSharing()
            }) {
                Image(systemName: "shareplay")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(10)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.background)
                    .background(.gray)
                    .cornerRadius(10)
            }
            .buttonStyle(.plain)
        }
        .padding(10)
    }
}

struct HUDView_Previews: PreviewProvider {
    static var previews: some View {
        HUDView(viewModel: SharePlayViewModel(model: SharePlayModel()))
            .previewLayout(.sizeThatFits)
    }
}
