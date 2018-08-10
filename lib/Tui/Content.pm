class Tui::Content {
    use PDF::Content::Text::Block;
    use PDF::Content::XObject;
    use HTML::Canvas;
    use CSS::Properties;
    use CSS::Properties::Box;
    subset Content where PDF::Content::Text::Block | PDF::Content::XObject | HTML::Canvas;
    has Content $.input;
    has CSS::Properties $.css;
    has CSS::Properties::Box $.box;
}
