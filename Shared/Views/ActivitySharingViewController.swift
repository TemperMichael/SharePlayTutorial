//
//  ActivitySharingViewController.swift
//  SharePlayTutorial
//
//  Created by Michael Temper on 11.06.23.
//

import GroupActivities
import SwiftUI
import UIKit

struct ActivitySharingViewController: UIViewControllerRepresentable {

    let activity: GroupActivity

    func makeUIViewController(context: Context) -> GroupActivitySharingController {
        return try! GroupActivitySharingController(activity)
    }

    func updateUIViewController(_ uiViewController: GroupActivitySharingController, context: Context) { }
}
