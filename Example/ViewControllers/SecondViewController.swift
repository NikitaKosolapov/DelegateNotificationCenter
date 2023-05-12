//
//  SecondViewController.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 26.04.2023.
//

import UIKit

class SecondViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        MyAppNotificationCenter.tabBar.delegate(self)
        MyAppNotificationCenter.firstViewController.delegate(self)
        tabBarItem = .init(tabBarSystemItem: .recents, tag: 1)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension SecondViewController: TabBarNotificationDelegate {
    func tabBarDidSelect(with tag: Int) {
        print(type(of: self), #function, tag)
    }
}

extension SecondViewController: FirstViewControllerNotificationDelegate {
    func buttonDidTap() {
        print(type(of: self), #function)
    }
}
