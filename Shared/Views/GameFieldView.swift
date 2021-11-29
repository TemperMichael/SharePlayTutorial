//
//  GameFieldView.swift
//  SharePlayTutorial
//
//  Created by Michael Temper on 26.11.21.
//

import SwiftUI

struct GameFieldView: View {
    
    @ObservedObject var viewModel: SharePlayViewModel
    
    var buttonHeight: Double = 100
    
    var body: some View {
        VStack {
            Button(action: {
                guard viewModel.gameState == .none else { return }
                
                withAnimation {
                    viewModel.decreaseBallPosition()
                }
            }) {
                VStack {
                    Text("Player 1")
                        .fontWeight(.black)
                        .padding()
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: buttonHeight)
                .background(.blue)
            }
            .buttonStyle(.plain)
            .frame(height: buttonHeight)
            
            
            Spacer()
            
            Rectangle()
                .frame(height: viewModel.gameHoleSize)
                .foregroundColor(.background)
                .colorInvert()
            
            Spacer()
            
            Button(action: {
                guard viewModel.gameState == .none else { return }
                
                withAnimation {
                    viewModel.increaseBallPosition()
                }
            }) {
                VStack {
                    Spacer()
                    Text("Player 2")
                        .fontWeight(.black)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: buttonHeight)
                .background(.red)
            }
            .buttonStyle(.plain)
        }
        .foregroundColor(.background)
    }
}

struct GameFieldView_Previews: PreviewProvider {
    static var previews: some View {
        GameFieldView(viewModel: SharePlayViewModel(model: SharePlayModel()))
            .previewLayout(.sizeThatFits)
    }
}
