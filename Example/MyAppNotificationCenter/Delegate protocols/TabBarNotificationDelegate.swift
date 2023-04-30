//
//  TabBarNotificationDelegate.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 27.04.2023.
//

import Foundation

protocol TabBarNotificationDelegate: AnyObject {
    func tabBarDidSelect(with tag: Int)
    func didBeginCustomizing()
}

// Empty default implementation
extension TabBarNotificationDelegate {
    func didBeginCustomizing() {}
}
