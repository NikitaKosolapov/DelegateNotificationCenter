//
//  NotificationCenterDelegateTests.swift
//  NotificationCenterDelegateTests
//
//  Created by Nikita on 26.04.2023.
//

import XCTest
@testable import NotificationCenterDelegate

final class NotificationCenterDelegateTests: XCTestCase {
    var multicastDelegate: MulticastDelegate<FirstViewControllerDelegate>!
    
    override func setUp() {
        super.setUp()
        multicastDelegate = MulticastDelegate<FirstViewControllerDelegate>()
    }
    
    override func tearDown() {
        multicastDelegate = nil
        super.tearDown()
    }
    
    func testDelegate() {
        let delegate = MockFirstViewControllerDelegate()
        multicastDelegate.delegate(delegate)
        XCTAssertEqual(multicastDelegate.delegateCount(), 1)
    }

    func testRemove() {
        let delegate1 = MockFirstViewControllerDelegate()
        let delegate2 = MockFirstViewControllerDelegate()
        multicastDelegate.delegate(delegate1)
        multicastDelegate.delegate(delegate2)
        XCTAssertEqual(multicastDelegate.delegateCount(), 2)
        
        multicastDelegate.remove(delegate1)
        XCTAssertEqual(multicastDelegate.delegateCount(), 1)
        
        multicastDelegate.remove(delegate2)
        XCTAssertEqual(multicastDelegate.delegateCount(), 0)
    }
    
    func testCall() {
        let delegate1 = MockFirstViewControllerDelegate()
        let delegate2 = MockFirstViewControllerDelegate()
        
        multicastDelegate.delegate(delegate1)
        multicastDelegate.delegate(delegate2)
        
        multicastDelegate.call {
            $0.buttonDidTap()
        }
        
        XCTAssertTrue(delegate1.buttonDidTapCalled)
        XCTAssertTrue(delegate2.buttonDidTapCalled)
    }
}

class MockFirstViewControllerDelegate: FirstViewControllerDelegate {
    var buttonDidTapCalled = false
    
    func buttonDidTap() {
        buttonDidTapCalled = true
    }
}
