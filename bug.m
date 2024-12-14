In Objective-C, a common yet subtle error arises when dealing with memory management using ARC (Automatic Reference Counting).  Consider the scenario where a class retains a strong reference to an object, but that object also has a strong reference back to the original class (creating a retain cycle). This leads to neither object being deallocated even when they are no longer needed, resulting in a memory leak.

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) AnotherClass *anotherObject;
@end

@interface AnotherClass : NSObject
@property (strong, nonatomic) MyClass *myObject;
@end

@implementation MyClass
// ...
@end

@implementation AnotherClass
// ...
@end
```

This code demonstrates a retain cycle.  `MyClass` strongly retains `AnotherClass`, and `AnotherClass` strongly retains `MyClass`.  Breaking this cycle requires using `weak` references where appropriate.