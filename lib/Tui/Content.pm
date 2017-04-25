class Tui::Content {
    use PDF::Content::Text::Block;
    use PDF::Content::Image;
    use HTML::Canvas;
    use CSS::Declarations;
    use CSS::Declarations::Box;
    subset Content where PDF::Content::Text::Block | PDF::Image | HTML::Canvas;
    has Content $.input;
    has CSS::Declarations $.css;
    has CSS::Declarations::Box $.box;
}
