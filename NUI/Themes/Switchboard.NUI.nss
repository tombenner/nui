@primaryFontName: AvenirNextCondensed-Medium;
@primaryFontNameBold: HelveticaNeue-CondensedBold;
@primaryFontColor: #000000;
@secondaryFontColor: #777777;
@primaryBackgroundColor: #FFFFFF;
@primaryBackgroundTintColor: #ECECEC;
@primaryBackgroundColorTop: #FFFFFF;
@primaryBackgroundColorBottom: #EFF0F2;
@secondaryBackgroundColorTop: #FCFCFC;
@secondaryBackgroundColorBottom: #F9F9F9;
@primaryBorderColor: #DDD7D2;
@primaryBorderWidth: 1;

BarButton {
    background-color-top: @primaryBackgroundColorTop;
    background-color-bottom: @primaryBackgroundColorBottom;
    border-color: #BFC0C3;
    border-width: 1;
    corner-radius: 6;
    font-name: @primaryFontName;
    font-color: @secondaryFontColor;
    font-size: 15;
    text-shadow-color: clear;
}
Button {
    background-color-top: @primaryBackgroundColorTop;
    background-color-bottom: @primaryBackgroundColorBottom;
    border-color: @primaryBorderColor;
    border-width: @primaryBorderWidth;
    font-color: @secondaryFontColor;
    font-color-highlighted: #666666;
    font-name: @primaryFontName;
    font-size: 17;
    height: 37;
    corner-radius: 8;
    padding: 7;
}
LargeButton {
    height: 50;
    font-size: 24;
    corner-radius: 8;
    padding: 11;
}
SmallButton {
    height: 24;
    font-size: 13;
    corner-radius: 5;
    padding: 8;
}
Label {
    font-name: @primaryFontName;
    font-size: 18;
    font-color: @secondaryFontColor;
    text-auto-fit: false;
}
LargeLabel {
    font-name: @primaryFontNameBold;
    font-size: 26;
    font-color: @primaryFontColor;
}
SmallLabel {
    font-name: TimesNewRomanPSMT;
    font-size: 14;
    font-color: @primaryFontColor;
}
NavigationBar {
    background-color: #FFFFFF;
    font-name: @primaryFontNameBold;
    font-size: 22;
    font-color: @primaryFontColor;
    text-shadow-color: clear;
}
SearchBar {
    background-color-top: @primaryBackgroundColorTop;
    background-color-bottom: @primaryBackgroundColorBottom;
    scope-background-color: @primaryBackgroundColorTop;
}
SegmentedControl {
    background-color: @primaryBackgroundColorTop;
    background-color-selected: @primaryBackgroundColorBottom;
    border-width: @primaryBorderWidth;
    border-color: @primaryBorderColor;
    corner-radius: 10;
    font-name: @primaryFontName;
    font-size: 14;
    font-color: @secondaryFontColor;
    text-shadow-color: clear;
}
Switch {
    on-tint-color: @primaryBackgroundColor;
}
TabBar {
    background-color: #000000;
}
TabBarItem {
    font-name: @primaryFontName;
    font-color: @secondaryFontColor;
    font-size: 18;
    text-offset: 0,-11;
}
TableCell {
    background-color-top: @secondaryBackgroundColorTop;
    background-color-bottom: @secondaryBackgroundColorBottom;
    font-color: @primaryFontColor;
    font-name: @primaryFontNameBold;
    font-size: 17;
}
TableCellDetail {
    font-name: @primaryFontName;
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
    corner-radius: 10;
    padding: 12;
    vertical-align: center;
}
LargeTextField {
    height: 50;
    font-size: 28;
    corner-radius: 12;
    padding: 13;
}
View {
    background-color: #FFFFFF;
}