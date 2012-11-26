NUI
===
Style iOS apps with a style sheet

Description
-----------
NUI is a drop-in UI kit for iOS that lets you style UI elements using a style sheet, similar to CSS. It lets you style an entire app in minutes.

Out of the box, the styling looks like this:

[![](https://raw.github.com/tombenner/nui/master/Screenshots/UIScreenshot.png)](https://raw.github.com/tombenner/nui/master/Screenshots/UIScreenshot.png)

The styling is easily modified in a .plist that supports variables, like this:

[![](https://raw.github.com/tombenner/nui/master/Screenshots/SettingsScreenshot.png)](https://raw.github.com/tombenner/nui/master/Screenshots/SettingsScreenshot.png)

NUI lets you:

* Update the visual appearance of an entire application in minutes
* Save themes for use in multiple applications
* Set the styles of UI elements using simple rules, like setting `ButtonBorderColor` to `#CCCCCC`
* Define variables like `@primaryFontName` or `@myBackgroundColor` (a la Sass/LESS)
* Avoid digging through documentation to find how to change specific UI elements' styling
* Quickly create new, custom UI elements and define custom style classes for them

Installation
------------
1. Copy the NUI directory into your application
1. Add the CoreImage and QuartzCore frameworks to your application if you haven't already (like [this](http://stackoverflow.com/a/3377682))
1. Add `[NUIAppearance init];` to `application:didFinishLaunchingWithOptions` in AppDelegate.m (like [this](https://github.com/tombenner/nui/blob/master/Demo/NUIDemo/AppDelegate.m))

Usage
-----

To make an element styled, make it an instance of or inherit from the relevant NUI class, which simply adds styling support to existing UIKit classes. If your button is a UIButton, for example, you'll want to set its class to NUIButton (in Identity Inspector > Custom Class). Please refer to Style Classes below to see the available classes.

If it isn't possible to change the inheritence of the element's class, you can also apply styling with NUIRenderer:

    [NUIRenderer renderButton:myButton];

### Editing The Style Rules

NUISettings.plist contains all of the style rules. A rule for ButtonFontName modifies the font name of every NUIButton, for example. *(Please note that "NUI" is omitted in the style class for the simplicity's sake.)*

The format should be self-explanatory, but here are some notes:

* Styling variables are defined at the top, but they can be added/modified/removed as you see fit.
* NUI subclasses inherit rules from their ancestors (e.g. LargeButton inherits from Button).
* Rules beginning with "UI" are applied via UIAppearance, and thus are applied to all elements of that class in the application, regardless of whether they inherit from a NUI class.

To see all of the available properties and values, see the Style Classes and Style Value Types
 lists below.

Extending NUI
-------------

### Creating Custom Elements

To create, for example, a new UIButton named MyButton, we would do this:

1. File > New > File...
1. Cocoa Touch > Objective-C class > Next
1. Set `Class` to `MyButton` and `Subclass of` to `NUIButton` > Next > Create
1. In MyButton.m, add the following in the @implementation

    - (void)initNUI {
        [super initNUI];
        self.nuiClass = @"Button:MyButton";
    }

You can now define style rules in NUISettings.plist for MyButton (see the available properties for Button in Style Classes below). If you don't want MyButton to inherit style rules from NUIButton, set `nuiClass` to `@"MyButton"` instead of `@"Button:MyButton"`.

If you've made an element that could be widely reusable, definitely let me know, and I'll likely be very happy to include it in this repo. 

*N.B. A style class can inherit from an indefinite number of style rules, so if you want to create groups of style rules, you can set `nuiClass` to something like `@"MyStyleGroup1:MyStyleGroup2:MyButton"`.*

### Creating Custom Themes

Because all of the style rules are contained in NUISettings.plist, it's easy to create an NUI theme that can be reused in other projects. If you make one you like, let me know, and I'll likely be very happy to include it in this repo.

Style Classes
-------------

Below are all of the currently available style classes, their corresponding UI element classes, and the properties they support.

#### BarButton

*NUIBarButtonItem*

* BackgroundColor
* BackgroundImage
* BackgroundTintColor
* FontColor
* FontName
* FontSize
* TextShadowColor
* TextShadowOffset

#### Button

*NUIButton*

* BackgroundColor
* BackgroundColorTop/BackgroundColorBottom
* BackgroundImage
* BackgroundImageHighlighted
* BorderColor
* BorderWidth
* CornerRadius
* FontColor
* FontColorHighlighted
* FontName
* FontSize
* Height
* TextAlpha
* TextAutoFit
* TextShadowColor
* TextShadowOffset

#### Label

*NUILabel*

* FontColor
* FontColorHighlighted
* FontName
* FontSize
* TextAlpha
* TextAutoFit
* TextShadowColor
* TextShadowOffset

#### NavigationBar

*NUINavigationBar*

* BackgroundColor
* BackgroundColorTop/BackgroundColorBottom
* BackgroundImage
* BackgroundTintColor
* FontColor
* FontName
* FontSize
* TextShadowColor
* TextShadowOffset

#### SegmentedControl

*NUISegmentedControl*

* BackgroundTintColor
* BackgroundColor
* FontColor
* FontName
* FontSize
* TextShadowColor
* TextShadowOffset

#### TabBar

*NUITabBar*

* BackgroundColor
* BackgroundColorTop/BackgroundColorBottom
* BackgroundImage
* BackgroundTintColor
* FontColor
* FontName
* FontSize
* TextOffset
* TextShadowColor
* TextShadowOffset

#### TableCell

*NUITableViewCell*

* BackgroundColor
* BackgroundColorTop/BackgroundColorBottom
* DetailFontColor
* DetailFontColorHighlighted
* DetailFontName
* DetailFontSize
* DetailTextAlpha
* DetailTextAutoFit
* DetailTextShadowColor
* DetailTextShadowOffset
* FontColor
* FontColorHighlighted
* FontName
* FontSize
* TextAlpha
* TextAutoFit
* TextShadowColor
* TextShadowOffset

#### TextField

*NUITextField*

* BorderStyle
* FontName
* FontSize
* Height

#### View

*NUIView*

* BackgroundColor
* BackgroundImage

### Extended Classes

#### LargeButton

* See Button

#### SmallButton

* See Button

#### LargeLabel

* See Label

#### SmallLabel

* See Label

#### LargeTextField

* See TextField

### UIAppearance Classes

These classes are applied via UIAppearance, so they are applied to all elements of that class in the application, regardless of whether they inherit from a NUI class.

#### UIBarButtonItem

* BackgroundColor
* BackgroundImage
* BackgroundTintColor
* BackBackgroundColor *(for Back buttons)*
* BackBackgroundImage *(for Back buttons)*
* BackBackgroundTintColor *(for Back buttons)*
* FontColor
* FontName
* FontSize
* TextOffset
* TextShadowColor
* TextShadowOffset

#### UINavigationBar

* BackgroundColor
* BackgroundImage
* BackgroundTintColor

Style Properties
----------------

* **BackgroundColor** - Color
* **BackgroundColorTop**/**BackgroundColorBottom** - Gradient
* **BackgroundImage** - Image
* **BackgroundImageHighlighted** - Image
* **BackgroundTintColor** - Color
* **BorderColor** - Color
* **BorderStyle** - BorderStyle
* **BorderWidth** - Number
* **CornerRadius** - Number
* **FontColor** - Color
* **FontColorHighlighted** - Color
* **FontName** - FontName
* **FontSize** - Number
* **Height** - Number
* **TextAlpha** - Number
* **TextAutoFit** - Boolean
* **TextOffset** - Offset
* **TextShadowColor** - Color
* **TextShadowOffset** - Offset

Style Value Types
-----------------

* **Boolean** - A boolean (set Type to Boolean in the plist)
* **BorderStyle** - A border style, as rendered by a UITextBorderStyle. Accepted values are `none`, `line`, `bezel`, and `rounded`.
* **Color** - A hex color (e.g. `#FF0000`) or `clear` for a `[UIColor clearColor]`
* **FontName** - A font name (see available values [here](http://iosfonts.com/))
* **Gradient** - Two Colors that will create a vertical gradient. BackgroundColorTop and BackgroundColorBottom need to be defined in separate plist entries.
* **Image** - A name of an image, as used in `[UIImage imageNamed:name]` (e.g. `MyImage.png`).
* **Number** - A number (e.g. `-1`, `4.5`)
* **Offset** - Two numbers comprising the horizontal and vertical values of an offset (e.g. `-1,1`)

FAQ
---

#### Can I contribute new UI elements, style properties, themes, etc?

Absolutely! NUI covers a lot of ground, but there's still a large number of elements and properties that are still unsupported. If you've made a NUISettings.plist theme that you really like, it'd be excellent to add it to this repo.

#### What verions of iOS are supported?

NUI is tested on iOS 5.1. If you find bugs in iOS 6+, definitely feel free to let me know and/or contribute fixes!

#### What advantages does this have over UIAppearance?

UIAppearance is great, but it doesn't allow for the granularity that NUI does, and it doesn't support as many styling modifications as NUI.  For example, NUI lets you create multiple classes for a single UI element (e.g. NUIButton, NUILargeButton, NUISmallButton), and it lets you easily add gradients to many elements.

#### Do you know about Pixate?

Yep! It's unclear when it will be launched, it won't be free (in either meaning of the word, likely), and the jury is still out on how good of a product it'll be. I prefer free, lightweight solutions.

#### How is "NUI" pronounced?

"New-ee". (It rhymes with "GUI", of course.)