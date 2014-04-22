//
//  KKAssert.h
//  KKAssert
//
//  Created by Karol Kozub on 22/04/14.
//  Copyright (c) 2014 Karol Kozub. All rights reserved.
//

#import <Foundation/Foundation.h>

#if !defined(NS_BLOCK_ASSERTIONS)

#  define KKAssertRaiseException_(_, description...)                            \
     do {                                                                       \
       _Pragma("clang diagnostic push")                                         \
       _Pragma("clang diagnostic ignored \"-Wformat-extra-args\"")              \
       [NSException raise:NSInternalInconsistencyException format:description]; \
       _Pragma("clang diagnostic pop")                                          \
     } while (0)

#  define KKAssert_(condition, conditionString, description...)    \
     do {                                                          \
       if (!(condition)) {                                         \
         NSString *message = [NSString stringWithFormat:@"Assertion failed: (%s), %s, file %s, line %d", conditionString, __PRETTY_FUNCTION__, __FILE__, __LINE__]; \
         NSLog(@"*** %@", message);                                \
         KKAssertRaiseException_(, ##description, @"%@", message); \
       }                                                           \
     } while (0)

#  define KKAssert(condition, ...) KKAssert_(condition, #condition, ##__VA_ARGS__)

#else /* !defined(NS_BLOCK_ASSERTIONS) */

#  define KKAssert(condition, ...) do {} while (0)

#endif /* !defined(NS_BLOCK_ASSERTIONS) */
