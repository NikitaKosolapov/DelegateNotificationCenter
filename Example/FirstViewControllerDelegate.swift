//
//  File.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 26.04.2023.
//

import Foundation


protocol FirstViewControllerDelegate: AnyObject {
    func buttonDidTap()
    func doSomething(with text: String)
}

// Empty default implementation
extension FirstViewControllerDelegate {
    func buttonDidTap() {}
    func doSomething(with text: String) {}
}
