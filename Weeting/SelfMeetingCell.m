//
//  SelfMeetingCell.m
//  Weeting
//
//  Created by 공완식 on 12. 8. 14..
//
//

#import "SelfMeetingCell.h"

@implementation SelfMeetingCell
@synthesize webView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
