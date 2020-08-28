//
//  OnfidoSEGGzipData.h
//  Onfido
//
//  Created by Anurag Ajwani on 02/01/2019.
//

#import <Foundation/Foundation.h>

@interface OnfidoSEGGzipData: NSObject

+ (nullable NSData *) seg_gzippedData: (NSData * _Nullable) data;

@end
