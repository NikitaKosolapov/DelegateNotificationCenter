# NotificationCenterDelegate

Super simple and most reliable solution to replace NotificationCenter.

✅ Type Safe

✅ Thread Safe

✅ Memory Safety

This is a one-to-one delegation to multiple receivers based on Composite design pattern

# Usage

### General

1. Implement delegate protocol
```
protocol FirstViewControllerDelegate: AnyObject {
    func buttonDidTap()
}
```

2. Declare a notification group name and initialize the MulticastDelegate with the delegate protocol
```
class MyAppNotificationCenter {
    static var firstViewController = MulticastDelegate<FirstViewControllerDelegate>()
}
```

4. Assign the delegate
```
class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        MyAppNotificationCenter.firstViewController.delegate(self)
    }
}
```

5. Conform to the delegate protocol
```
extension SecondViewController: FirstViewControllerDelegate {
    func buttonDidTap() {
        // do something
    }
}
```

6. Call a delegate method
```
class FirstViewController: UIViewController {
@IBAction func buttonDidTap(sender: UIButton) {
        MyAppNotificationCenter.firstViewController.call {
            $0.buttonDidTap()
        }
    }
}
```

### Additional

If you no longer need a delegate, then remove it

```
MyAppNotificationCenter.firstViewController.remove(self)
```

It is not necessary to implement all delegate functions
```
// Empty default implementation
extension FirstViewControllerDelegate {
    func buttonDidTap() {}
    func doSomething(with text: String) {}
}
```

# Installation

Just copy this class and paste to a new file.

```
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
    
    public func delegateCount() -> Int {
        return delegates.allObjects.count
    }
}
```

# License

NotificationCenterDelegate is under the MIT license.

# Resources
https://www.vadimbulavin.com/multicast-delegate/
