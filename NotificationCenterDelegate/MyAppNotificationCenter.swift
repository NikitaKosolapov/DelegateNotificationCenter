//
//  MyAppNotificationCenter.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 26.04.2023.
//

import Foundation

class MyAppNotificationCenter {
    static var firstViewController = MulticastDelegate<FirstViewControllerDelegate>()
}
