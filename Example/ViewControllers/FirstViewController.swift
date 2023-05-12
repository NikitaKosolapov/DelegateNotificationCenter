//
//  ViewController.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 26.04.2023.
//

import UIKit

class FirstViewController: UIViewController {
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        return button
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        MyAppNotificationCenter.tabBar.delegate(self)
        tabBarItem = .init(tabBarSystemItem: .bookmarks, tag: 0)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func buttonDidTap() {
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
