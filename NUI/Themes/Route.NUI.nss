@primaryFontName: Helvetica;
@primaryFontNameBold: Helvetica-Bold;
@primaryFontColor: #555555;
@secondaryFontColor: #948F8A;
@primaryBackgroundColor: #E6E6E6;
@primaryBackgroundTintColor: #ECECEC;
@primaryBackgroundColorTop: #F4EFEB;
@primaryBackgroundColorBottom: #EAE6E2;
@secondaryBackgroundColorTop: #FCFCFC;
@secondaryBackgroundColorBottom: #F9F9F9;
@primaryBorderColor: #DDD7D2;
@primaryBorderWidth: 1;

BarButton {
    background-color-top: #9D3024;
    background-color-bottom: #872A1F;
    border-color: #681C13;
    border-width: 1;
    corner-radius: 7;
    font-name: @primaryFontNameBold;
    font-color: #FFFFFF;
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
    font-name: @primaryFontNameBold;
    font-size: 17;
    height: 37;
    corner-radius: 18;
    padding: 10;
    exclude-views: UIAlertButton;
    exclude-subviews: UITableViewCell,UITextField;
}
LargeButton {
    height: 50;
    font-size: 24;
    corner-radius: 25;
    padding: 15;
}
SmallButton {
    height: 24;
    font-size: 13;
    corner-radius: 12;
    padding: 8;
}
Label {
    font-name: @primaryFontNameBold;
    font-size: 18;
    font-color: @primaryFontColor;
    text-auto-fit: false;
}
LargeLabel {
    font-size: 26;
}
SmallLabel {
    font-size: 14;
}
NavigationBar {
    background-color-top: #B43B2E;
    background-color-bottom: #9E3126;
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
    background-color: @primaryBackgroundColorBottom;
    background-color-selected: #E1DFDA;
    border-width: @primaryBorderWidth;
    border-color: @primaryBorderColor;
    corner-radius: 10;
    font-name: @primaryFontNameBold;
    font-size: 13;
    font-color: @secondaryFontColor;
    text-shadow-color: clear;
}
Switch {
    on-tint-color: @primaryBackgroundColor;
}
TabBar {
    background-color-top: #363636;
    background-color-bottom: #181818;
}
TabBarItem {
    font-name: @primaryFontNameBold;
    font-color: @secondaryFontColor;
    font-size: 18;
    text-offset: 0,-11;
}
TableCell {
    background-color: @primaryBackgroundColorTop;
    font-color: @primaryFontColor;
    font-name: @primaryFontNameBold;
    font-size: 15;
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
    background-color: #ECE7E4;
}