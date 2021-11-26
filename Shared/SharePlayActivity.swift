//
//  SharePlayActivity.swift
//  SharePlayTutorial (iOS)
//
//  Created by Michael Temper on 26.11.21.
//

import Foundation
import GroupActivities

struct SharePlayActivity: GroupActivity {

    var metadata: GroupActivityMetadata {
        var meta = GroupActivityMetadata()
        meta.title = NSLocalizedString("SharePlay Example", comment: "")
        meta.type = .generic
        return meta
    }
}
