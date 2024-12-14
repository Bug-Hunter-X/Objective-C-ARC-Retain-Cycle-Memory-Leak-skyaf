To solve the retain cycle, use a `weak` reference in one of the properties to break the cycle.  For example, modifying `AnotherClass` to use a weak reference to `MyClass` will prevent the retain cycle:

```objectivec
@interface AnotherClass : NSObject
@property (weak, nonatomic) MyClass *myObject;
@end
```

By making the `myObject` property in `AnotherClass` weak, it does not increment the retain count of `MyClass`. Thus when `MyClass` is no longer referenced elsewhere, it and `AnotherClass` will be deallocated appropriately.

Using Instruments' Leaks tool can help identify these issues in your application.