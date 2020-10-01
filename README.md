DSTransparentNavigationBar
==========================

UINavigationBar that allows to set a transparency in colors.


![zero alpha](https://github.com/diegoserranoa/DSTransparentNavigationBar/blob/master/img/alpha0.png)

![0.5 alpha](https://github.com/diegoserranoa/DSTransparentNavigationBar/blob/master/img/alpha05.png)

![gradient alpha](https://github.com/diegoserranoa/DSTransparentNavigationBar/blob/master/img/gradientalpha.png)

## Usage

Interface Builder

Select the NavigationBar from the Navigation Controller in the Interface Builder. Then, in Utilities -> Identity Inspector select DSNavigationBar as the Class.

![IB screenshot](https://github.com/diegoserranoa/DSTransparentNavigationBar/blob/master/img/ib.png)

Programatically

In the AppDelegate import the header file and set the navigationBar class to DSNavigationBar

```objective-c
#import "DSNavigationBar.h"

UINavigationController *navigationController = [[UINavigationController alloc] initWithNavigationBarClass:[DSNavigationBar class] toolbarClass:nil];

// create a color and set it to the DSNavigationBar appearance
UIColor * color = [UIColor colorWithRed:(190/255.0) green:(218/255.0) blue:(218/255) alpha:0.5f];
[[DSNavigationBar appearance] setNavigationBarWithColor:color];

// creating a fade out effect
/*
UIColor *topColor = [UIColor colorWithRed:(190/255.0) green:(218/255.0) blue:(218/255) alpha:1.0f];
UIColor *bottomColor = [UIColor colorWithRed:(190/255.0) green:(218/255.0) blue:(218/255) alpha:0];
[[DSNavigationBar appearance] setNavigationBarWithColors:@[topColor,bottomColor]];
*/

```
---

## License
 Under the MIT license. More info on the LICENSE file.
 
## TODO
- Swift implementation
- iOS 7 support.
