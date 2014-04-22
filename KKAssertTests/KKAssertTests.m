//
//  KKAssertTests.m
//  KKAssertTests
//
//  Created by Karol Kozub on 22/04/14.
//  Copyright (c) 2014 Karol Kozub. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KKAssert.h"

@interface KKAssertTests : XCTestCase

@end

@implementation KKAssertTests

- (void)testAssertInMethodWithCondition {
  XCTAssertNoThrow([self runAssertWithCondition:YES]);
  XCTAssertThrows([self runAssertWithCondition:NO]);
}

- (void)testAssertInMethodWithConditionAndDescription {
  XCTAssertNoThrow([self runAssertWithCondition:YES description:@"test"]);
  XCTAssertThrows([self runAssertWithCondition:NO description:@"test"]);
}

- (void)testAssertInMethodWithConditionAndDescriptionAndArgument {
  XCTAssertNoThrow([self runAssertWithCondition:YES description:@"test %@" argument:[NSObject new]]);
  XCTAssertThrows([self runAssertWithCondition:NO description:@"test %@" argument:[NSObject new]]);
}

- (void)testAssertInMethodWithConditionAndDescriptionAndThirtyTwoArguments {
  NSString *description = @"test %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@";
  NSArray *arguments = @[@"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten", @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen", @"nineteen", @"twenty", @"twenty one", @"twenty two", @"twenty three", @"twenty four", @"twenty five", @"twenty six", @"twenty seven", @"twenty eight", @"twenty nine", @"thirty", @"thirty one", @"thirty two"];
  
  XCTAssertNoThrow([self runAssertWithCondition:YES description:description thirtyTwoArguments:arguments]);
  XCTAssertThrows([self runAssertWithCondition:NO description:description thirtyTwoArguments:arguments]);
}

- (void)testAssertInFunctionWithCondition {
  XCTAssertNoThrow(RunAssertWithCondition(YES));
  XCTAssertThrows(RunAssertWithCondition(NO));
}

- (void)testAssertInFunctionWithConditionAndDescription {
  XCTAssertNoThrow(RunAssertWithConditionAndDescription(YES, @"test"));
  XCTAssertThrows(RunAssertWithConditionAndDescription(NO, @"test"));
}

- (void)testAssertInFunctionWithConditionAndDescriptionAndArgument {
  XCTAssertNoThrow(RunAssertWithConditionAndDescriptionAndArgument(YES, @"test %@", [NSObject new]));
  XCTAssertThrows(RunAssertWithConditionAndDescriptionAndArgument(NO, @"test %@", [NSObject new]));
}

#pragma mark - Helper methods and functions

- (void)runAssertWithCondition:(BOOL)condition {
  KKAssert(condition);
}

- (void)runAssertWithCondition:(BOOL)condition description:(NSString *)description {
  KKAssert(condition, description);
}

- (void)runAssertWithCondition:(BOOL)condition description:(NSString *)description argument:(id)argument {
  KKAssert(condition, description, argument);
}

- (void)runAssertWithCondition:(BOOL)condition description:(NSString *)description thirtyTwoArguments:(NSArray *)arguments {
  if (32 != [arguments count]) {
    XCTFail(@"Invalid number of arguments");
  
  } else {
    KKAssert(condition, description, arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6], arguments[7], arguments[8], arguments[9], arguments[10], arguments[11], arguments[12], arguments[13], arguments[14], arguments[15], arguments[16], arguments[17], arguments[18], arguments[19], arguments[20], arguments[21], arguments[22], arguments[23], arguments[24], arguments[25], arguments[26], arguments[27], arguments[28], arguments[29], arguments[30], arguments[31]);
  }
}

void RunAssertWithCondition(BOOL condition) {
  KKAssert(condition);
}

void RunAssertWithConditionAndDescription(BOOL condition, NSString *description) {
  KKAssert(condition, description);
}

void RunAssertWithConditionAndDescriptionAndArgument(BOOL condition, NSString *description, id argument) {
  KKAssert(condition, description, argument);
}

@end
