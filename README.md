KKAssert
========

I created `KKAssert` because I was annoyed by the limitations of `NSAssert` and `assert`. Within my implementation I tried to use the best parts from both of these solutions. I'm pretty happy with the results.

What is wrong with `NSAssert`?
------------------------------

* It requires at least two arguments. My assertions are usually very simple and don't require any additional descriptions. The fact that I have to supply an empty second argument every single time is very irritating.
* It doesn't log the stringized condition, which is a pretty handy information.
* It doesn't work in functions. There is the alternative `NSCAssert` macro, but it is more convenient not to have to remember that.

What is wrong with `assert`?
----------------------------

* It doesn't provide stacktraces. When something fails I need a stacktrace to debug the problem. It is the single most useful information an assertion can provide. Since `assert` just logs its message and calls `abort()`, there is nothing except for some information about the last frame.
* It doesn't allow you to specify a custom description. Most of the time a description isn't needed, but it's useful to have that possibility for the rare case when it's needed.
* It logs method calls as functions (e.g. `function -[Xyz xyz]`), which is a bit annoying. It also uses `__FUNCTION__` instead of the more verbose `__PRETTY_FUCTION__`

How does `KKAssert` handle these things?
----------------------------------------

* It allows you to specify only one argument -- the condition. Since most of the time a custom description isn't needed, the tab completion will suggest a single argument as well.
* It logs the stringized condition in its message. The logged part is very similar to the `assert`'s one.
* It works both in methods and in functions.
* It provides a stacktrace by raising an exception. The same way NSAssert does it. When you don't specify a custom description the exception will use the logged message in its place.

How to use `KKAssert`?
----------------------

```
#import "KKAssert.h"

void test(int argument) {
  KKAssert(argument > 10);
  
  (...)  
}

@implementation KKCustomView

- (void)animateWithObject:(id)object {
  KKAssert([NSThread isMainThread]);
  KKAssert([object isPreparedForAnimation], @"Object %@ wasn't ready for animation", object);
  
  (...)
}

@end
```

What does the failure message look like?
---------------------------------------

```
@implementation Test
- (void)test {
	KKAssert(1 == 2);
}
@end
```
```
2014-04-23 02:46:36.148 Untitled 10[41961:507] *** Assertion failed: (1 == 2), -[Test test], file Untitled 10.m, line 36
2014-04-23 02:46:36.151 Untitled 10[41961:507] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Assertion failed: (1 == 2), -[Test test], file Untitled 10.m, line 36'
*** First throw call stack:
(
	0   CoreFoundation                      0x00007fff8353525c __exceptionPreprocess + 172
	1   libobjc.A.dylib                     0x00007fff8cae6e75 objc_exception_throw + 43
	2   CoreFoundation                      0x00007fff8353510c +[NSException raise:format:] + 204
	3   Untitled 10                         0x0000000107682dbf -[Test test] + 175
	4   Untitled 10                         0x0000000107682e90 main + 64
	5   libdyld.dylib                       0x00007fff886d35fd start + 1
	6   ???                                 0x0000000000000001 0x0 + 1
)
libc++abi.dylib: terminating with uncaught exception of type NSException
Run Command: line 1: 41961 Abort trap: 6           ./"$2" "${@:3}"
```
