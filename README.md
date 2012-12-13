NUI
===
Style iOS apps with a style sheet, similar to CSS

Description
-----------
NUI is a drop-in UI kit for iOS that lets you style UI elements using a style sheet, similar to CSS. It lets you style an entire app in minutes.

Out of the box, the styling looks like this:

[![](https://raw.github.com/tombenner/nui/master/Screenshots/UIScreenshot.png)](https://raw.github.com/tombenner/nui/master/Screenshots/UIScreenshot.png)

It's easily modified, though. The styling above, for example, is declared [like this](https://raw.github.com/tombenner/nui/master/NUI/NUIStyle.nss). There are a couple other screenshots [here](https://raw.github.com/tombenner/nui/master/Screenshots/UIScreenshot.Blue.png) and [here](https://raw.github.com/tombenner/nui/master/Screenshots/UIScreenshot.Round.png).

The styling is declared using a CSS-like syntax that supports variables:

    @primaryFontName: HelveticaNeue;
    @secondaryFontName: HelveticaNeue-Light;
    @primaryFontColor: #333333;
    @primaryBackgroundColor: #E6E6E6;

    Button {
        background-color: @primaryBackgroundColor;
        border-color: #A2A2A2;
        border-width: @primaryBorderWidth;
        font-color: @primaryFontColor;
        font-color-highlighted: #999999;
        font-name: @primaryFontName;
        font-size: 18;
        corner-radius: 7;
    }
    NavigationBar {
        background-tint-color: @primaryBackgroundColor;
        font-name: @secondaryFontName;
        font-size: 20;
        font-color: @primaryFontColor;
        text-shadow-color: #666666;
        text-shadow-offset: 1,1;
    }

NUI lets you:

* Update the visual appearance of an entire application in minutes
* Save themes for use in multiple applications
* Set the styles of UI elements using simple rules, like setting `Button { border-color: #CCCCCC; }`
* Define variables like `@primaryFontName` or `@myBackgroundColor` (a la Sass/LESS)
* Avoid digging through documentation to find how to change specific UI elements' styling
* Quickly create custom style classes

Installation
------------
1. Copy the NUI directory into your application
1. Add the CoreImage and QuartzCore frameworks to your application if you haven't already (like [this](http://stackoverflow.com/a/3377682))
1. Add `[NUIAppearance init];` to `application:didFinishLaunchingWithOptions` in AppDelegate.m (like [this](https://github.com/tombenner/nui/blob/master/Demo/NUIDemo/AppDelegate.m))
1. Add `[NUISettings init];` to `@autoreleasepool` in `main()` in `main.m` (like [this](https://github.com/tombenner/nui/blob/master/Demo/NUIDemo/main.m))

Usage
-----

After dropping in NUI, you can modify your app's styling by simply editing NUIStyle.nss.

Due to the nature of UIKit's usage of simple UI components within more complex UI components, NUI doesn't style some UIKit components in some rare cases. If you need to apply styling for these cases, you can simply use NUIRenderer:

    [NUIRenderer renderButton:myButton];

If you want to specify a style class in this call, you can do this like so:

    [NUIRenderer renderButton:myButton withClass:@"LargeButton"]

To make `LargeButton` inherit from `Button`, use `@"Button:LargeButton"`.

*N.B. NUI used to require that you make your elements inherit from a NUI class, but this is no longer the case. See "Migrating From Subclasses To Categories" below for details.*

### Editing The Style Rules

NUIStyle.nss contains all of the style rules. A rule like `Button { font-name: Helvetica; }` modifies the font name of every UIButton, for example.

The format should be self-explanatory, but here are some notes:

* Styling variables are defined at the top, but they can be added/modified/removed as you see fit.
* You can make an element inherit from multiple style classes (see Creating Custom Style Classes below).
* Rules beginning with "UI" are applied via UIAppearance, and thus are applied to all elements of that class in the application, regardless of whether they inherit from a NUI class.

To see all of the available properties and values, see the Style Classes and Style Value Types lists below.

### Creating Custom Style Classes

To give an element a custom style class (e.g. `LargeButton`), set a runtime attribute for it in Interface Builder (in Identity Inspector > User Defined Runtime Attributes, click `+`). Set the Key Path to `nuiClass`, Type to `String`, and Value to `LargeButton`:

[![](https://raw.github.com/tombenner/nui/master/Screenshots/SettingARuntimeAttribute.png)](https://raw.github.com/tombenner/nui/master/Screenshots/SettingARuntimeAttribute.png)

If you want it to inherit styling rules from another style class, like `Button`, set the value to `Button:LargeButton`.

To bypass NUI's styling for a particular element, simply set the value to `none`.

*N.B. A style class can inherit from an indefinite number of style rules, so if you want to create groups of style rules, you can set `nuiClass` to something like `@"MyStyleGroup1:MyStyleGroup2:MyButton"`.*

### Creating Custom Themes

Because all of the style rules are contained in NUIStyle.nss, it's easy to create an NUI theme that can be reused in other projects. If you make one you like, let me know, and I'll likely be very happy to include it in this repo.

### Migrating From Subclasses To Categories

Version 0.1 of NUI required that you manually make your app's UI components inherit from NUI classes (e.g. `NUIButton`). NUI no longer requires this, as it uses UIKit categories instead subclasses. If you were previously using NUI 0.1, and update to a newer version of NUI, you'll want to simply unset those custom classes, so that, for example, a UIButton is simply a UIButton, instead of being a NUIButton (this would be done either in Identity Inspector > Custom Class or in the application code).

Style Classes
-------------

Below are all of the currently available style classes, their corresponding UI component classes, and the properties they support.

#### BarButton

*UIBarButtonItem*

* background-color
* background-image
* background-tint-color
* font-color
* font-name
* font-size
* text-shadow-color
* text-shadow-offset

#### Button

*UIButton*

* background-color
* background-color-top/background-color-bottom
* background-image
* background-image-highlighted
* border-color
* border-width
* corner-radius
* font-color
* font-color-highlighted
* font-name
* font-size
* height
* padding
* text-alpha
* text-auto-fit
* text-shadow-color
* text-shadow-offset

#### Label

*UILabel*

* font-color
* font-color-highlighted
* font-name
* font-size
* text-alpha
* text-auto-fit
* text-shadow-color
* text-shadow-offset

#### NavigationBar

*UINavigationBar*

* background-color
* background-color-top/background-color-bottom
* background-image
* background-tint-color
* font-color
* font-name
* font-size
* text-shadow-color
* text-shadow-offset

#### SegmentedControl

*UISegmentedControl*

* background-tint-color
* background-color
* font-color
* font-name
* font-size
* text-shadow-color
* text-shadow-offset

#### TabBar

*UITabBar*

* background-color
* background-color-top/background-color-bottom
* background-image
* background-tint-color
* font-color
* font-name
* font-size
* text-offset
* text-shadow-color
* text-shadow-offset

#### TableCell

*UITableViewCell*

* background-color
* background-color-top/background-color-bottom
* font-color
* font-color-highlighted
* font-name
* font-size
* text-alpha
* text-auto-fit
* text-shadow-color
* text-shadow-offset

#### TableCellDetail

The detail label of a *UITableViewCell*

* font-color
* font-color-highlighted
* font-name
* font-size
* text-alpha
* text-auto-fit
* text-shadow-color
* text-shadow-offset

#### TextField

*UITextField*

* border-style
* font-name
* font-size
* height

#### View

*UIView*

* background-color
* background-image

### UIAppearance Classes

These classes are applied via UIAppearance, so they are applied to all elements of that class in the application, regardless of whether they inherit from a NUI class.

#### UIBarButtonItem

* background-color
* background-image
* background-tint-color
* font-color
* font-name
* font-size
* text-offset
* text-shadow-color
* text-shadow-offset

#### UIBackBarButtonItem

*A back button, inherits from UIBarButtonItem*

* background-color
* background-image
* background-tint-color

#### UINavigationBar

* background-color
* background-image
* background-tint-color

Style Properties
----------------

* **background-color** - Color
* **background-color-top**/**background-color-bottom** - Gradient
* **background-image** - Image
* **background-image-highlighted** - Image
* **background-tint-color** - Color
* **border-color** - Color
* **border-style** - BorderStyle
* **border-width** - Number
* **corner-radius** - Number
* **font-color** - Color
* **font-color-highlighted** - Color
* **font-name** - FontName
* **font-size** - Number
* **height** - Number
* **padding** - Box
* **text-alpha** - Number
* **text-auto-fit** - Boolean
* **text-offset** - Offset
* **text-shadow-color** - Color
* **text-shadow-offset** - Offset

Style Value Types
-----------------

* **Boolean** - A boolean (`true` or `false`)
* **BorderStyle** - A border style, as rendered by a UITextBorderStyle. Accepted values are `none`, `line`, `bezel`, and `rounded`.
* **Box** - A series of 1 to 4 integers that specify the widths of a box's edges. Interpreted like CSS's `padding` and `margin` properties (top, right, bottom, left). Examples: `15` (a box with a width of 15 for each edge), `10 15` (a box with a width of 10 for the top and bottom edges and 15 for the right and left edges)
* **Color** - A hex color (e.g. `#FF0000`) or `clear` for a `[UIColor clearColor]`
* **FontName** - A font name (see available values [here](http://iosfonts.com/))
* **Gradient** - Two Colors that will create a vertical gradient. background-color-top and background-color-bottom need to be defined in separate .nss properties.
* **Image** - A name of an image, as used in `[UIImage imageNamed:name]` (e.g. `MyImage.png`).
* **Number** - A number (e.g. `-1`, `4.5`)
* **Offset** - Two numbers comprising the horizontal and vertical values of an offset (e.g. `-1,1`)

FAQ
---

#### Can I contribute new UI elements, style properties, themes, etc?

Absolutely! NUI covers a lot of ground, but there's still a large number of elements and properties that are still unsupported. If you've made a NUIStyle.nss theme that you really like, it'd be excellent to add it to this repo.

#### What versions of iOS are supported?

NUI has been tested on both iOS 5.1 and iOS 6.0.

#### What advantages does this have over UIAppearance?

UIAppearance is alright, but it's not intuitive, time-consuming, and it doesn't support either the granularity or number of style modifications that NUI does. Styling should be abstracted in a simple style sheet with simple property definitions; you shouldn't have to stare at long, nested method calls and have to dig through Apple's documentation every time you want to make a small styling modification.

#### Do you know about Pixate?

Yep! It's unclear when it will be launched, it won't be free (in either meaning of the word, likely), and the jury is still out on how good of a product it'll be. I prefer free, lightweight solutions.

#### How is "NUI" pronounced?

"New-ee". (It rhymes with "GUI", of course.)

License
-------

NUI is released under the MIT License. Please see the LICENSE file for details.