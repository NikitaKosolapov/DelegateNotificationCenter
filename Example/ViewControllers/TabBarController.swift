//
//  TabBarViewController.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 27.04.2023.
//

import UIKit

class TabBarController: UITabBarController {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        MyAppNotificationCenter.tabBar.call {
            $0.tabBarDidSelect(with: item.tag)
        }
    }
}
