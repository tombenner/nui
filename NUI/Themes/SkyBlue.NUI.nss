@primaryFontName: Helvetica;
@primaryFontNameBold: Helvetica-Bold;
@primaryFontColor: #3E3D43;
@secondaryFontColor: #838385;
@primaryBackgroundColor: #F5F5F5;
@primaryBackgroundTintColor: #ECECEC;
@primaryBackgroundColorTop: #FFFFFF;
@primaryBackgroundColorBottom: #EFF0F2;
@secondaryBackgroundColorTop: #FCFCFC;
@secondaryBackgroundColorBottom: #F9F9F9;
@primaryBorderColor: #DDDDDD;
@primaryBorderWidth: 1;

BarButton {
    background-color-top: #11ABE1;
    background-color-bottom: #01A0DA;
    border-color: #0099D5;
    border-width: 1;
    corner-radius: 7;
    font-name: @primaryFontNameBold;
    font-color: #FFFFFF;
    font-size: 13;
    text-shadow-color: clear;
}
Button {
    background-color: #37383D;
    font-color: #FFFFFF;
    font-color-highlighted: #CCCCCC;
    font-name: @primaryFontNameBold;
    font-size: 17;
    height: 37;
    corner-radius: 18;
    padding: 12;
}
LargeButton {
    background-color: #00ADEF;
    height: 50;
    font-size: 24;
    corner-radius: 25;
    padding: 19;
}
SmallButton {
    background-color: #49C100;
    height: 24;
    font-size: 12;
    corner-radius: 12;
    padding: 8;
}
Label {
    font-name: @primaryFontName;
    font-size: 18;
    font-color: @primaryFontColor;
    text-auto-fit: false;
}
LargeLabel {
    font-name: @primaryFontNameBold;
    font-size: 26;
    font-color: @primaryFontColor;
}
SmallLabel {
    font-name: @primaryFontName;
    font-size: 14;
    font-color: #8F8F91;
}
NavigationBar {
    background-color: #00ADEF;
    font-name: @primaryFontNameBold;
    font-size: 22;
    font-color: #FFFFFF;
    text-shadow-color: clear;
}
SearchBar {
    background-color-top: @primaryBackgroundColorTop;
    background-color-bottom: @primaryBackgroundColorBottom;
    scope-background-color: @primaryBackgroundColorTop;
}
SegmentedControl {
    background-color: #BBBBBB;
    background-color-selected: #00ADEF;
    border-width: 1;
    border-color: @primaryBorderColor;
    corner-radius: 10;
    font-name: @primaryFontNameBold;
    font-size: 12;
    font-color: #FFFFFF;
    text-shadow-color: clear;
}
Switch {
    on-tint-color: @primaryBackgroundColor;
}
TabBar {
    background-color: @primaryBackgroundColor;
}
TabBarItem {
    font-name: @primaryFontNameBold;
    font-color: #777777;
    font-size: 18;
    text-offset: 0,-11;
}
TableCell {
    background-color: #F7F7F7;
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
    corner-radius: 7;
    padding: 12;
    vertical-align: center;
}
LargeTextField {
    height: 50;
    font-size: 28;
    corner-radius: 9;
    padding: 13;
}
View {
    background-color: @primaryBackgroundColor;
}