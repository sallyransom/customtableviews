//
//  SRMotorcycleLookup.h
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/19/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRMotorcycleLookup : NSObject {
    NSDictionary *_lookupDictionary;
}

- (NSArray *)categories;
- (NSArray *)motorcyclesForCategory:(NSString *)category;

@end
