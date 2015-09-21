//
//  BUYClientTestBase.m
//  Mobile Buy SDK
//
//  Created by David Muzi on 2015-09-15.
//  Copyright © 2015 Shopify Inc. All rights reserved.
//

#import "BUYClientTestBase.h"
#import "BUYTestConstants.h"

@implementation BUYClientTestBase

- (void)setUp
{
	[super setUp];
	
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];
	NSString *jsonPath = [bundle pathForResource:@"test_shop_data" ofType:@"json"];
	NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
	NSDictionary *jsonConfig = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
	jsonConfig = nil;
	
	NSDictionary *environment = [[NSProcessInfo processInfo] environment];
	self.shopDomain = environment[kBUYTestDomain] ?: jsonConfig[kBUYTestDomain];
	self.apiKey = environment[kBUYTestAPIKey] ?: jsonConfig[kBUYTestAPIKey];
	self.channelId = environment[kBUYTestChannelId] ?: jsonConfig[kBUYTestChannelId];
	self.merchantId = environment[kBUYTestMerchantId] ?: jsonConfig[kBUYTestMerchantId];
	
	NSDictionary *giftCards = jsonConfig[@"gift_cards"];
	
	self.giftCardCode = environment[kBUYTestGiftCardCode10] ?: giftCards[@"valid10"][@"code"];
	self.giftCardCode2 = environment[kBUYTestGiftCardCode25] ?: giftCards[@"valid25"][@"code"];
	self.giftCardCode3 = environment[kBUYTestGiftCardCode50] ?: giftCards[@"valid50"][@"code"];
	self.giftCardCodeInvalid = environment[kBUYTestInvalidGiftCardCode] ?: giftCards[@"invalid"][@"code"];
	self.giftCardCodeExpired = environment[kBUYTestExpiredGiftCardCode] ?: giftCards[@"expired"][@"code"];
	self.giftCardIdExpired = environment[kBUYTestExpiredGiftCardID] ?: giftCards[@"expired"][@"id"];
	self.discountCodeValid = environment[kBUYTestDiscountCodeValid] ?: jsonConfig[@"discounts"][@"valid"][@"code"];
	self.discountCodeExpired = environment[kBUYTestDiscountCodeExpired] ?: jsonConfig[@"discounts"][@"expired"][@"code"];
	if (environment[kBUYTestProductIdsCommaSeparated]) {
		NSString *productIdsString = [environment[kBUYTestProductIdsCommaSeparated] stringByReplacingOccurrencesOfString:@" " withString:@""];
		self.productIds = [productIdsString componentsSeparatedByString:@","];
	} else {
		self.productIds = jsonConfig[@"product_ids"];
	}
	
	XCTAssert([self.shopDomain length] > 0, @"You must provide a valid shop domain. This is your 'shopname.myshopify.com' address.");
	XCTAssertEqualObjects([self.shopDomain substringFromIndex:self.shopDomain.length - 14], @".myshopify.com", @"You must provide a valid shop domain. This is your 'shopname.myshopify.com' address.");
	XCTAssert([self.apiKey length] > 0, @"You must provide a valid API Key.");
	XCTAssert([self.channelId length], @"You must provide a valid Channel ID");
	
	self.client = [[BUYClient alloc] initWithShopDomain:self.shopDomain apiKey:self.apiKey channelId:self.channelId];
}

@end
