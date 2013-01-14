@primaryFontName: HelveticaNeue;
@primaryFontNameBold: HelveticaNeue-Bold;
@primaryFontNameLight: HelveticaNeue-Light;
@primaryFontColor: #2A2A2A;
@secondaryFontColor: #999999;
@primaryBackgroundColor: #EEEEEE;
@primaryBackgroundTintColor: #ECECEC;
@primaryBackgroundColorTop: #FFFFFF;
@primaryBackgroundColorBottom: #EFF0F2;
@secondaryBackgroundColorTop: #FCFCFC;
@secondaryBackgroundColorBottom: #F9F9F9;
@primaryBorderColor: #D2D2D2;
@primaryBorderWidth: 1;

BarButton {
    background-color: #147DF1;
    corner-radius: 4;
    font-name: @primaryFontNameBold;
    font-color: #FFFFFF;
    font-size: 13;
    text-shadow-color: clear;
}
BarButtonBack {
    background-color: #FFFFFF;
    border-color: @primaryBorderColor;
    border-width: 1;
    font-color: @primaryFontColor;
}
Button {
    background-color: #DB3134;
    font-color: #FFFFFF;
    font-color-highlighted: #CCCCCC;
    font-name: @primaryFontNameBold;
    font-size: 17;
    height: 37;
    corner-radius: 6;
    padding: 9;
}
LargeButton {
    background-color: #FFFFFF;
    border-color: @primaryBorderColor;
    border-width: @primaryBorderWidth;
    height: 50;
    font-color: @secondaryFontColor;
    font-color-highlighted: #666666;
    font-size: 24;
    corner-radius: 8;
    padding: 10;
}
SmallButton {
    background-color: #00A366;
    border-width: 0;
    height: 24;
    font-size: 13;
    corner-radius: 4;
    padding: 8;
}
Label {
    font-name: @primaryFontNameBold;
    font-size: 18;
    font-color: @primaryFontColor;
    text-auto-fit: false;
}
LargeLabel {
    font-name: @primaryFontNameLight;
    font-size: 26;
    font-color: @primaryFontColor;
}
SmallLabel {
    font-name: @primaryFontName;
    font-size: 14;
    font-color: @secondaryFontColor;
}
NavigationBar {
    background-color: @primaryBackgroundColor;
    font-name: @primaryFontNameLight;
    font-size: 22;
    font-color: @primaryFontColor;
    text-shadow-color: clear;
}
SearchBar {
    background-color-top: @primaryBackgroundColorTop;
    background-color-bottom: @primaryBackgroundColorBottom;
    scope-background-color: #FFFFFF;
}
SegmentedControl {
    background-color: @primaryBackgroundColorTop;
    background-color-selected: #E6E6E6;
    border-width: @primaryBorderWidth;
    border-color: @primaryBorderColor;
    corner-radius: 10;
    font-name: @primaryFontNameBold;
    font-size: 13;
    font-color: #666666;
    text-shadow-color: clear;
}
Switch {
    on-tint-color: @primaryBackgroundColor;
}
TabBar {
    background-color: @primaryBackgroundColor;
}
TabBarItem {
    font-name: @primaryFontNameLight;
    font-color: #666666;
    font-size: 18;
    text-offset: 0,-11;
}
TableCell {
    background-color: #FFFFFF;
    font-color: @primaryFontColor;
    font-name: @primaryFontName;
    font-size: 16;
}
TableCellDetail {
    font-name: @primaryFontNameLight;
    font-size: 14;
    font-color: @secondaryFontColor;
}
TextField {
    height: 37;
    font-color: @primaryFontColor;
    font-name: @primaryFontName;
    font-size: 17;
    background-color: #FFFFFF;
    border-style: none;
    border-color: @primaryBorderColor;
    border-width: 1;
    corner-radius: 6;
    padding: 12;
    vertical-align: center;
}
LargeTextField {
    height: 50;
    font-size: 28;
    corner-radius: 8;
    padding: 13;
}
View {
    background-color: @primaryBackgroundColor;
}