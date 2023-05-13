//
//  MyAppNotificationCenter.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 26.04.2023.
//

import Foundation

class MyAppNotificationCenter {
    /// One-to-one relationships
    static var firstViewController = MulticastDelegate<FirstViewControllerNotificationDelegate>()
    /// One-to-many relationships
    static var tabBar = MulticastDelegate<TabBarNotificationDelegate>()
}
