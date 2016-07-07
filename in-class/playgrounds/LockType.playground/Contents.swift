//: Playground - noun: a place where people can play

protocol LockType {
    
    var locked: Bool { get }
        
    func lock();
    func unlock();
    
}

class Master: LockType {
    var locked: Bool

    
    init() {
        locked = true;
    }
    
    func lock() {
        locked = true;
        print("locked")
    }
    func unlock() {
        locked = false;
        print("unlocked")
    }
    
    func getLocked() -> Bool {
        return locked;
    
    }
    
    
}



var myLock: LockType = Master();


print(myLock.locked);
myLock.lock();
print(myLock.locked);
myLock.unlock();
print(myLock.locked);
