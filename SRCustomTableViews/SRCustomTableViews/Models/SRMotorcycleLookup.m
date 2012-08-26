//
//  SRMotorcycleLookup.m
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/19/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import "SRMotorcycleLookup.h"
#import "SRMotorcycle.h"

@interface SRMotorcycleLookup ()
- (NSString *)pathToPlist;
- (void)loadLookupDictionary;
@end

@implementation SRMotorcycleLookup

- (id)init {
    self = [super init];
    if (self) {
        [self loadLookupDictionary];
    }
    return self;
}

- (NSArray *)alphabeticallySortedStringArray:(NSArray *)stringArray {
    return [stringArray sortedArrayUsingComparator:^(NSString *a, NSString *b) {
        return [a caseInsensitiveCompare:b];
    }];
}

#pragma mark - Setup

- (void)loadLookupDictionary {
    NSString *filePath = [self pathToPlist];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [NSException raise:@"File not found" format:@"Couldn't find the file at path: %@", filePath];
    }
    
    _lookupDictionary = [NSDictionary dictionaryWithContentsOfFile:filePath];
}

- (NSString *)pathToPlist {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    return [bundle pathForResource:@"Motorcycles" ofType:@"plist"];
}

#pragma mark - Queries

- (NSArray *)categories {
    NSArray *categories = [_lookupDictionary allKeys];
    return [self alphabeticallySortedStringArray:categories];
}

- (NSArray *)motorcycleNamesForCategory:(NSString *)category {
    NSArray *motorcycleNames = [[_lookupDictionary objectForKey:category] allKeys];
    
    return [self alphabeticallySortedStringArray:motorcycleNames];
}

- (NSArray *)motorcyclesForCategory:(NSString *)category {
    NSMutableArray *motorcycles = [[NSMutableArray alloc] init];
    
    for (NSString *name in [self motorcycleNamesForCategory:category]) {
        SRMotorcycle *motorcycle = [self motorCycle:name ofCategory:category];
        [motorcycles addObject:motorcycle];
    }
    
    return [NSArray arrayWithArray:motorcycles];
}

- (SRMotorcycle *)motorCycle:(NSString *)motorcycleName ofCategory:(NSString *)category {
    NSDictionary *motorcycleDictionary = [[_lookupDictionary objectForKey:category] objectForKey:motorcycleName];
    
    SRMotorcycle *motorcycle = [[SRMotorcycle alloc] initWithName:motorcycleName dictionary:motorcycleDictionary];
    
    return motorcycle;
}

@end
