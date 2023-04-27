//
//  SecondViewController.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 26.04.2023.
//

import UIKit

class SecondViewController: UIViewController {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        MyAppNotificationCenter.firstViewController.delegate(self)
    }
}

extension SecondViewController: FirstViewControllerDelegate {
    func buttonDidTap() {
        print(#function, "at the SecondViewController")
    }
}
