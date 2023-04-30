//
//  ThirdViewController.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 26.04.2023.
//

import UIKit

class ThirdViewController: UIViewController {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        MyAppNotificationCenter.tabBar.delegate(self)
        MyAppNotificationCenter.firstViewController.delegate(self)
    }
}

extension ThirdViewController: TabBarNotificationDelegate {
    func tabBarDidSelect(with tag: Int) {
        print(type(of: self), #function, tag)
    }
}

extension ThirdViewController: FirstViewControllerDelegate {
    func firstViewControllerButtonDidTap() {
        print(type(of: self), #function)
    }
}

