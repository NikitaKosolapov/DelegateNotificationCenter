//
//  TabBarViewController.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 27.04.2023.
//

import UIKit

class TabBarController: UITabBarController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        viewControllers = [FirstViewController(),
                           SecondViewController(),
                           ThirdViewController()]
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        MyAppNotificationCenter.tabBar.call {
            $0.tabBarDidSelect(with: item.tag)
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didBeginCustomizing items: [UITabBarItem]) {
        MyAppNotificationCenter.tabBar.call {
            $0.didBeginCustomizing()
        }
    }
}
