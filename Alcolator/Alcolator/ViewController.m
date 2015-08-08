//
//  ViewController.m
//  Alcolator
//
//  Created by Joshua on 7/24/15.
//  Copyright (c) 2015 Joshua Novak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    if (enteredNumber == 0){
        //clear field if 0 or not a number
        sender.text = nil;
    }
}

- (IBAction)sliderValueDidChange:(UISlider *)sender {
    //NSLog(@"Slider value changed to %f", sender.value);
    [self.beerPrecentTextField resignFirstResponder];
}

- (IBAction)buttonPressed:(id)sender {
    [self.beerPrecentTextField resignFirstResponder];
    //first calculate how much alcohol is in those beers
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;
    float alcoholPercentageOfBeer = [self.beerPrecentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    //calculate equivalent amount of wine
    float ouncesInOneWineGlass = 5;
    float alcoholPercentageOfWine = .13;
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    //decide to use "beer"/"beers" and and "glass"/"glasses"
    NSString *beerText;
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    }else{
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    NSString *wineText;
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
        wineText = NSLocalizedString(@"glass", @"singular glass");
    }else{
        wineText = NSLocalizedString(@"glasses", @"plural glass");
    }
    //generate result text
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of wine.", nil),numberOfBeers, beerText, [self.beerPrecentTextField.text floatValue], numberOfWineGlassesForEquivalentAlcoholAmount, wineText];
    self.resultLabel.text = resultText;
    //NSLog(@"Slider value changed to %@", resultText);
    self.navigationItem.title = [NSString stringWithFormat:NSLocalizedString(@"Wine (%.1f %@)", "Wine Title Bar"),numberOfWineGlassesForEquivalentAlcoholAmount,wineText];


}

- (IBAction)tapGestureDidFire:(UIGestureRecognizer *)sender {
    [self.beerPrecentTextField resignFirstResponder];
}


@end
