//
//  NSString+MRTHash.m
//  MRTInfusionsoftSDK
//
//  Created by Haldun Bayhantopcu on 3/21/13.
//  Copyright (c) 2013 Martsys Software. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSString+MRTHash.h"

@implementation NSString (MRTHash)

- (NSString *)md5
{
    const char *ptr = [self UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(ptr, (CC_LONG)strlen(ptr), md5Buffer);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; ++i) {
        [output appendFormat:@"%02x", md5Buffer[i]];
    }
    
    return [output copy];
}

@end
