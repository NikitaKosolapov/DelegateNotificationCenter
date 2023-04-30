//
//  File.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 26.04.2023.
//

import Foundation


protocol FirstViewControllerDelegate: AnyObject {
    func firstViewControllerButtonDidTap()
    func doSomething(with text: String)
}

// Empty default implementation
extension FirstViewControllerDelegate {
    func firstViewControllerButtonDidTap() {}
    func doSomething(with text: String) {}
}
