//
//  TrackerAnalytics.swift
//  SaveLink
//
//  Created by Ruben on 5/6/24.
//

import Foundation
import FirebaseAnalytics

final class TrackerAnalytics {
    
    static func trackCreateLinkEvent(url: String) {
        Analytics.logEvent("CreateLinkEvent", parameters: ["url": url])
    }
    
}
