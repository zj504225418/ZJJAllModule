//
//  ZJJICarouselViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/7.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import "ZJJICarouselViewController.h"
#import "iCarousel.h"

@interface ZJJICarouselViewController ()
<iCarouselDelegate,
iCarouselDataSource>

@property (nonatomic, strong) iCarousel *carousel;

@end

@implementation ZJJICarouselViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.carousel = [[iCarousel alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 600)];
    self.carousel.type = iCarouselTypeCylinder;
    self.carousel.delegate = self;
    self.carousel.dataSource = self;
    self.carousel.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.carousel];
    //configure carousel
//    self.carousel.type = iCarouselTypeCoverFlow;

    //scroll to fixed offset
    [self.carousel scrollToItemAtIndex:5 animated:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carousel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 3;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    //create a numbered view
    view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width , 600.0f)];
    view.backgroundColor = [UIColor clearColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, view.frame.size.width-100, 600)];
    label.text = [NSString stringWithFormat:@"%i", index];
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = UITextAlignmentCenter;
    label.font = [label.font fontWithSize:50];

    [view addSubview:label];
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            return YES;
        }
        default:
        {
            return value;
        }
    }
}

- (void)carouselWillBeginDragging:(iCarousel *)carousel
{
    NSLog(@"Carousel will begin dragging");
}

- (void)carouselDidEndDragging:(iCarousel *)carousel willDecelerate:(BOOL)decelerate
{
    NSLog(@"Carousel did end dragging and %@ decelerate", decelerate? @"will": @"won't");
}

- (void)carouselWillBeginDecelerating:(iCarousel *)carousel
{
    NSLog(@"Carousel will begin decelerating");
}

- (void)carouselDidEndDecelerating:(iCarousel *)carousel
{
    NSLog(@"Carousel did end decelerating");
}

- (void)carouselWillBeginScrollingAnimation:(iCarousel *)carousel
{
    NSLog(@"Carousel will begin scrolling");
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
    NSLog(@"Carousel did end scrolling");
}

@end
