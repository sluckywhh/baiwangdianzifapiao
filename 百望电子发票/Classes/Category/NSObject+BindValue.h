//
//  NSObject+BindValue.h
//  tradeshiftHome
//
//  Created by taq on 1/28/15.
//  Copyright (c) 2015 Tradeshift. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BindValue)

- (void) bindValue:(id)val;
- (id) fetchValue;
- (id)valueForXPath:(NSString*)fullPath;

@end
