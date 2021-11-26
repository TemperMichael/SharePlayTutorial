//
//  SharePlayViewModel.swift
//  SharePlayTutorial (iOS)
//
//  Created by Michael Temper on 26.11.21.
//

import GroupActivities
import SwiftUI

@MainActor
class SharePlayViewModel: ObservableObject {

    @Published private var model: SharePlayModel

    var playersYOffset: Double { model.playersYOffset }
    var playersMovementAmount: Double = 10
    var playerSize: Double { playerRadius * 2 }
    var playerRadius: Double = 25

    var gameHoleSize: Double = 120

    var gameState: GameState? {
        switch model.playersYOffset {
        case let offset where offset < -gameHoleSize - playerRadius:
            return .playerOneWon
        case let offset where offset > gameHoleSize + playerRadius:
            return .playerTwoWon
        default:
            return .none
        }
    }

    init(model: SharePlayModel) {
        self.model = model
    }

    func increaseBallPosition() {
        model.playersYOffset += playersMovementAmount
        send(model)
    }

    func decreaseBallPosition() {
        model.playersYOffset -= playersMovementAmount
        send(model)
    }

    func resetGame() {
        model.playersYOffset = 0
        send(model)
    }

    var tasks = Set<Task<Void, Never>>()
    var messenger: GroupSessionMessenger?

    func startSharing() {
        Task {
            do {
                _ = try await SharePlayActivity().activate()
            } catch {
                print("Failed to activate SharePlay activity: \(error)")
            }
        }
    }

    func configureGroupSession(_ session: GroupSession<SharePlayActivity>) {
        let messenger = GroupSessionMessenger(session: session)
        self.messenger = messenger

        let task = Task {
            for await (sharePlayModel, _) in messenger.messages(of: SharePlayModel.self) {
                handle(sharePlayModel)
            }
        }
        tasks.insert(task)

        session.join()
    }

    func handle(_ model: SharePlayModel) {
        withAnimation {
            self.model = model
        }
    }

    func send(_ model: SharePlayModel) {
        Task {
            do {
                try await messenger?.send(model)
            } catch {
                print("Send cards failed: \(error)")
            }
        }
    }
}
