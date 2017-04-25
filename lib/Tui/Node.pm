use v6;
use Tui::Layout;

class Tui::Node does Tui::Layout {
    use PDF::Style::Element;
    use Tui::Content;
    has Str $.tag;
    has Tui::Node @.kids;
    has Tui::Content $.input;
    has PDF::Style::Element $.element handles <box css>;

    subset Root  of Tui::Node where { .element && ! .input }
    subset Input of Tui::Node where { ! .element && .input }
    subset Leaf  of Tui::Node where { ! .kids }

    submethod TWEAK(:$style) {
    }
}

