//
//  ThirdViewController.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 26.04.2023.
//

import UIKit

class ThirdViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        MyAppNotificationCenter.tabBar.delegate(self)
        tabBarItem = .init(tabBarSystemItem: .more, tag: 2)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension ThirdViewController: TabBarNotificationDelegate {
    func tabBarDidSelect(with tag: Int) {
        print(type(of: self), #function, tag)
    }
}

