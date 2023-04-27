//
//  MulticastDelegate.swift
//  NotificationCenterDelegate
//
//  Created by Nikita on 26.04.2023.
//

import Foundation

public class MulticastDelegate<T> {
    private let delegates: NSHashTable<AnyObject> = NSHashTable.weakObjects()
    
    public func delegate(_ delegate: T) {
        delegates.add(delegate as AnyObject)
    }
    
    public func remove(_ delegateToRemove: T) {
        for delegate in delegates.allObjects.reversed() where delegate === delegateToRemove as AnyObject {
            delegates.remove(delegate)
        }
    }
    
    public func call(_ block: (T) -> Void) {
        for delegate in delegates.allObjects.reversed() {
            block(delegate as! T)
        }
    }
    
    /// For unit tests
    public func delegateCount() -> Int {
        return delegates.allObjects.count
    }
}