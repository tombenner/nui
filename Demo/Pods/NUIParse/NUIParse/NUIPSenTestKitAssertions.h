//
//  NUIPSenTestKitAssertions.h
//  NUIParse
//
//  Created by Christopher Miller on 5/18/12.
//  Copyright (c) 2012 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SenTestingKit/SenTestingKit.h>

#pragma mark General Assertions

/*
 * Note that you can have this fail under CocoaPods. All you need to do is remove the "libpods.a" item from the unit testing target's linked libraries. This removes duplicate symbols which kludge the test.
 */
#define NUIPSTAssertKindOfClass(obj, cls) \
    do { \
        id _obj = obj; \
        STAssertTrue([_obj isKindOfClass:[cls class]], @"Expecting a kind of class %@; got class %@ from object %@.", NSStringFromClass([_obj class]), NSStringFromClass([cls class]), _obj); \
    } while (0)
#define _NUIPSTAssertKindOfClass_Unsafe(obj, cls) STAssertTrue([obj isKindOfClass:[cls class]], @"Expecting a kind of class %@; got class %@ from object %@.", NSStringFromClass([obj class]), NSStringFromClass([cls class]), obj);

#pragma mark Token Assertions

#define NUIPSTAssertKeywordEquals(token, expectation) \
    do { \
        NUIPKeywordToken * t = (NUIPKeywordToken *)token; /* this escapes the potential multiple invocations of popToken */ \
        _NUIPSTAssertKindOfClass_Unsafe(t, NUIPKeywordToken); \
        STAssertEqualObjects([t keyword], expectation, @"Keyword doesn't match expectation."); \
    } while (0)
#define NUIPSTAssertIdentifierEquals(token, expectation) \
    do { \
        NUIPIdentifierToken * _t = (NUIPIdentifierToken *)token; \
        _NUIPSTAssertKindOfClass_Unsafe(_t, NUIPIdentifierToken); \
        STAssertEqualObjects([_t identifier], expectation, @"Identifier doesn't match expectation."); \
    } while (0)
#define NUIPSTAssertIntegerNumberEquals(token, expectation) \
    do { \
        NUIPNumberToken * t = (NUIPNumberToken *)token; /* this escapes the potential multiple invocations of popToken */ \
        _NUIPSTAssertKindOfClass_Unsafe(t, NUIPNumberToken); \
        NSNumber * n = [t number]; \
        STAssertTrue(0==strcmp([n objCType], @encode(NSInteger)), @"Type expectation failure. Wanted %s, got %s.", @encode(NSInteger), [n objCType]); \
        STAssertEquals([n integerValue], ((NSInteger)expectation), @"Number fails expectation."); \
    } while (0)
#define NUIPSTAssertIntegerNumberEqualsWithAccuracy(token, expectation, accuracy) \
    do { \
        NUIPNumberToken * t = (NUIPNumberToken *)token; \
        _NUIPSTAssertKindOfClass_Unsafe(t, NUIPNumberToken); \
        NSNumber * n = [t number]; \
        STAssertTrue(0==strcmp([n objCType], @encode(NSInteger)), @"Type expectation failure. Wanted %s, got %s.", @encode(NSInteger), [n objCType]); \
        STAssertEqualsWithAccuracy([n integerValue], ((NSInteger)expectation), ((NSInteger)accuracy), @"Number fails expectation."); \
    } while (0)
#define NUIPSTAssertFloatingNumberEquals(token, expectation) \
    do { \
        NUIPNumberToken * t = (NUIPNumberToken *)token; \
        _NUIPSTAssertKindOfClass_Unsafe(t, NUIPNumberToken); \
        NSNumber * n = [t number]; \
        STAssertTrue(0==strcmp([n objCType], @encode(double)), @"Type expectation failure. Wanted %s, got %s.", @encode(double), [n objCType]); \
        STAssertEquals([n doubleValue], ((double)expectation), @"Number fails expectation."); \
    } while (0)
#define NUIPSTAssertFloatingNumberEqualsWithAccuracy(token, expectation, accuracy) \
    do { \
        NUIPNumberToken * t = (NUIPNumberToken *)token; \
        _NUIPSTAssertKindOfClass_Unsafe(t, NUIPNumberToken); \
        NSNumber * n = [t number]; \
        STAssertTrue(0==strcmp([n objCType], @encode(double)), @"Type expectation failure. Wanted %s, got %s.", @encode(double), [n objCType]); \
        STAssertEqualsWithAccuracy([n doubleValue], ((double)expectation), ((double)accuracy), @"Number fails expectation."); \
    } while (0)
