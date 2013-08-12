//
//  Created by kaiba on 13/08/07.
//


#import "TextCell.h"


@implementation TextCell {

}

+ (CGFloat)heightForCell:(NSString*)text size:(CGFloat)size width:(CGFloat)width {

    return [text sizeWithFont:[UIFont systemFontOfSize:size] constrainedToSize:CGSizeMake(width, 200000) lineBreakMode:NSLineBreakByTruncatingTail].height;
}

@end