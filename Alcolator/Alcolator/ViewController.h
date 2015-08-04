//
//  ViewController.h
//  Alcolator
//
//  Created by Joshua on 7/24/15.
//  Copyright (c) 2015 Joshua Novak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *beerPrecentTextField;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

-(void)buttonPressed:(UIButton *)sender;
@end

