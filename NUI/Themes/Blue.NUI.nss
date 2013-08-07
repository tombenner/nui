@primaryFontName: ArialRoundedMTBold;
@secondaryFontName: ArialRoundedMTBold;
@secondaryFontNameBold: ArialRoundedMTBold;
@secondaryFontNameStrong: ArialRoundedMTBold;
@inputFontName: ArialRoundedMTBold;
@primaryFontColor: #666666;
@secondaryFontColor: #888888;
@navFontColor: #FFFFFF;
@primaryBackgroundColor: #E6E6E6;
@primaryBackgroundTintColor: #ECECEC;
@primaryBackgroundColorTop: #FFFFFF;
@primaryBackgroundColorBottom: #ECECEC;
@primaryBackgroundColorBottomStrong: #DDDDDD;
@secondaryBackgroundColorTop: #FFFFFF;
@secondaryBackgroundColorBottom: #F9F9F9;
@primaryBorderColor: #EEEEEE;
@primaryBorderWidth: 1;

BarButton {
    background-color: #9ED5F5;
    corner-radius: 7;
    font-name: @secondaryFontNameBold;
    font-color: @navFontColor;
    font-size: 13;
    text-shadow-color: clear;
}
Button {
    background-color: #FFFFFF;
    border-color: @primaryBorderColor;
    border-width: @primaryBorderWidth;
    font-color: @primaryFontColor;
    font-color-highlighted: @secondaryFontColor;
    font-name: @secondaryFontName;
    font-size: 18;
    height: 37;
    corner-radius: 7;
    exclude-views: UIAlertButton;
    exclude-subviews: UITableViewCell,UITextField;
}
LargeButton {
    height: 50;
    font-size: 24;
    corner-radius: 10;
}
SmallButton {
    height: 24;
    font-size: 14;
    corner-radius: 5;
}
Label {
    font-name: @secondaryFontName;
    font-size: 20;
    font-color: @primaryFontColor;
    text-auto-fit: false;
}
LargeLabel {
    font-size: 28;
}
SmallLabel {
    font-size: 15;
}
NavigationBar {
    font-name: @secondaryFontName;
    font-size: 20;
    font-color: @navFontColor;
    text-shadow-color: clear;
    background-color-top: #54B4EB;
    background-color-bottom: #2FA4E7;
}
SearchBar {
    background-color-top: @primaryBackgroundColorTop;
    background-color-bottom: @primaryBackgroundColorBottom;
    scope-background-color: #FFFFFF;
}
SegmentedControl {
    background-color: @primaryBackgroundColorTop;
    background-color-selected: #EEEEEE;
    border-color: #999999;
    border-width: @primaryBorderWidth;
    corner-radius: 7;
    font-name: @secondaryFontNameBold;
    font-size: 13;
    font-color: @primaryFontColor;
    text-shadow-color: clear;
}
Switch {
    on-tint-color: @primaryBackgroundTintColor;
}
TabBar {
    background-color: #FFFFFF;
}
TabBarItem {
    font-name: @secondaryFontName;
    font-color: @primaryFontColor;
    font-size: 18;
    text-offset: 0,-11;
}
TableCell {
    background-color-top: @secondaryBackgroundColorTop;
    background-color-bottom: @secondaryBackgroundColorBottom;
    font-color: @primaryFontColor;
    font-name: @secondaryFontNameBold;
    font-size: 17;
}
TableCellDetail {
    font-name: @secondaryFontName;
    font-size: 14;
    font-color: @secondaryFontColor;
}
TextField {
    height: 37;
    font-name: @inputFontName;
    font-size: 18;
    border-style: rounded;
    vertical-align: center;
}
LargeTextField {
    height: 50;
}
LargeTextField {
    font-size: 28;
}
View {
    background-image: NUIViewBackground.png;
}