# Objective-C ARC Retain Cycle Memory Leak

This repository demonstrates a common memory leak in Objective-C caused by a retain cycle when using Automatic Reference Counting (ARC). The `bug.m` file shows the problematic code, while `bugSolution.m` provides a corrected version.

## Problem

When two objects have strong references to each other, they prevent each other from being deallocated, leading to a memory leak. This example illustrates this scenario with two classes, `MyClass` and `AnotherClass`, that create a circular dependency.