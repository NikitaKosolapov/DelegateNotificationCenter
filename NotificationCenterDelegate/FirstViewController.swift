//
//  ViewController.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 26.04.2023.
//

import UIKit

class FirstViewController: UIViewController {
    @IBAction func buttonDidTap(_ sender: Any) {
        MyAppNotificationCenter.firstViewController.call {
            $0.buttonDidTap()
        }
    }
}

