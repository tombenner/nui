@primaryFontName: ArialRoundedMTBold;
@secondaryFontName: ArialRoundedMTBold;
@secondaryFontNameBold: ArialRoundedMTBold;
@secondaryFontNameStrong: ArialRoundedMTBold;
@inputFontName: ArialRoundedMTBold;
@primaryFontColor: #555555;
@secondaryFontColor: #888888;
@primaryBackgroundColor: #E6E6E6;
@primaryBackgroundTintColor: #ECECEC;
@primaryBackgroundColorTop: #F3F3F3;
@primaryBackgroundColorBottom: #E6E6E6;
@primaryBackgroundColorBottomStrong: #DDDDDD;
@secondaryBackgroundColorTop: #FCFCFC;
@secondaryBackgroundColorBottom: #F9F9F9;
@primaryBorderColor: #A2A2A2;
@primaryBorderWidth: 1;

Button {
    background-color-top: #FFFFFF;
    background-color-bottom: @primaryBackgroundColorBottom;
    border-color: @primaryBorderColor;
    border-width: @primaryBorderWidth;
    font-color: @primaryFontColor;
    font-color-highlighted: @secondaryFontColor;
    font-name: @secondaryFontName;
    font-size: 18;
    height: 37;
    corner-radius: 7;
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
    font-color: @primaryFontColor;
    text-shadow-color: clear;
    background-color-top: @primaryBackgroundColorTop;
    background-color-bottom: @primaryBackgroundColorBottomStrong;
}
SegmentedControl {
    background-tint-color: @primaryBackgroundColorTop;
    font-name: @secondaryFontNameBold;
    font-size: 13;
    font-color: @primaryFontColor;
    text-shadow-color: clear;
}
TabBar {
    background-color-top: @primaryBackgroundColorTop;
    background-color-bottom: @primaryBackgroundColorBottom;
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
    font-name: @inputFontName;
    height: 37;
    font-size: 18;
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
UIBarButtonItem {
    background-tint-color: @primaryBackgroundTintColor;
    font-name: @secondaryFontNameBold;
    font-color: @primaryFontColor;
    text-shadow-color: clear;
    font-size: 13;
}