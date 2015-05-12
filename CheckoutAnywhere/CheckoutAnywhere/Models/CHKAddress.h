//
//  CHKAddress.h
//  Checkout
//
//  Created by Shopify.
//  Copyright (c) 2015 Shopify Inc. All rights reserved.
//

#import "CHKObject.h"
#import "CHKSerializable.h"

/**
 *  A CHKAddress represents a shipping or billing address on an order. This will be associated with the customer upon completion.
 */
@interface CHKAddress : CHKObject <CHKSerializable>

@property (nonatomic, copy) NSString *address1;
@property (nonatomic, copy) NSString *address2;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *phone;

@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *countryCode;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *provinceCode;
@property (nonatomic, copy) NSString *zip;

@end