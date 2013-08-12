//
//  Created by kaiba on 13/08/07.
//


#import <Foundation/Foundation.h>


@interface TextCell : UITableViewCell
@property(nonatomic, strong) IBOutlet UILabel *multiLineTextView;

+ (CGFloat)heightForCell:(NSString*)text size:(CGFloat)size width:(CGFloat)width;
@end