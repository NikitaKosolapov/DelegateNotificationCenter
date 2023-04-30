//
//  ViewController.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 26.04.2023.
//

import UIKit

class FirstViewController: UIViewController {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        MyAppNotificationCenter.tabBar.delegate(self)
    }
    
    @IBAction func buttonDidTap(_ sender: Any) {
        MyAppNotificationCenter.firstViewController.call {
            $0.buttonDidTap()
        }
    }
}

extension FirstViewController: TabBarNotificationDelegate {
    func tabBarDidSelect(with tag: Int) {
        print(type(of: self), #function, tag)
    }
    
    func didBeginCustomizing() {
        print(type(of: self), #function)
    }
}
