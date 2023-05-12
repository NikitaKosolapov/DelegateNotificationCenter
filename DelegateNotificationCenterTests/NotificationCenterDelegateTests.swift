//
//  NotificationCenterDelegateTests.swift
//  NotificationCenterDelegateTests
//
//  Created by Nikita on 26.04.2023.
//

import XCTest
@testable import NotificationCenterDelegate

protocol NotificationDelegate: AnyObject {
    func buttonDidTap()
    func doSomething(with text: String)
}

class MockFirstViewControllerDelegate: NotificationDelegate {
    var buttonDidTapCalled = false
    var text: String = ""
    
    func buttonDidTap() {
        buttonDidTapCalled.toggle()
    }
    
    func doSomething(with text: String) {
        self.text = text
    }
}

final class NotificationCenterDelegateTests: XCTestCase {
    var multicastDelegate: MulticastDelegate<NotificationDelegate>!
    
    override func setUp() {
        super.setUp()
        multicastDelegate = MulticastDelegate<NotificationDelegate>()
    }
    
    func testDelegate() {
        let delegate = MockFirstViewControllerDelegate()
        multicastDelegate.delegate(delegate)
        XCTAssertEqual(multicastDelegate.delegatesCount, 1)
    }

    func testRemove() {
        let delegate1 = MockFirstViewControllerDelegate()
        let delegate2 = MockFirstViewControllerDelegate()
        
        multicastDelegate.delegate(delegate1)
        multicastDelegate.delegate(delegate2)
        XCTAssertEqual(multicastDelegate.delegatesCount, 2)
        
        multicastDelegate.remove(delegate1)
        XCTAssertEqual(multicastDelegate.delegatesCount, 1)
        
        multicastDelegate.remove(delegate2)
        XCTAssertEqual(multicastDelegate.delegatesCount, 0)
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
    
    func testMulticastMultipleDelegate() {
        let delegate1 = MockFirstViewControllerDelegate()
        let delegate2 = MockFirstViewControllerDelegate()

        multicastDelegate.delegate(delegate1)
        multicastDelegate.delegate(delegate2)
 
        multicastDelegate.call {
            $0.buttonDidTap()
        }

        XCTAssertTrue(delegate1.buttonDidTapCalled)
        XCTAssertTrue(delegate2.buttonDidTapCalled)
    
        multicastDelegate.remove(delegate1)

        multicastDelegate.call {
            $0.buttonDidTap()
        }
        
        XCTAssertTrue(delegate1.buttonDidTapCalled)
        XCTAssertFalse(delegate2.buttonDidTapCalled)
    }
    
    func testMemorySafety() {
        autoreleasepool {
            let delegate = MockFirstViewControllerDelegate()
            multicastDelegate.delegate(delegate)
        }
        
        XCTAssertEqual(multicastDelegate.delegatesCount, 0)
    }
    
    func testThreadSafety() {
        let delegate = MockFirstViewControllerDelegate()
        
        DispatchQueue.global().async {
            self.multicastDelegate.delegate(delegate)
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: {
            self.multicastDelegate.call {
                $0.buttonDidTap()
            }
        })
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0, execute: {
            XCTAssertTrue(delegate.buttonDidTapCalled)
        })
    }
    
    func testTypeSafety() {
        let delegate = MockFirstViewControllerDelegate()
        
        multicastDelegate.delegate(delegate)
        
        multicastDelegate.call {
            $0.doSomething(with: "text")
        }
        
        XCTAssertEqual("text", delegate.text)
    }
}
