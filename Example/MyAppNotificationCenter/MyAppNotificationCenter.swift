//
//  MyAppNotificationCenter.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 26.04.2023.
//

import Foundation

class MyAppNotificationCenter {
    /// One-to-one
    static var firstViewController = MulticastDelegate<FirstViewControllerDelegate>()
    /// One-to-many
    static var tabBar = MulticastDelegate<TabBarNotificationDelegate>()
}
