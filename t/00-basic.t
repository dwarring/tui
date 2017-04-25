use Test;
use Tui::Node;
use Tui::HTML::TagSet;
use CSS::Declarations;
use PDF::Lite;
use PDF::Style::Viewport;

my $bg-image = PDF::Content::Image.open("t/images/semitransparent.gif");
my $style = "size: a5; margin-left:3pt; background-image: url($bg-image); background-color: blue; opacity: .3; border: 1pt solid red";

my $tagset = Tui::HTML::TagSet.new;
my $declarations = $tagset.declarations<body>;
my $css = CSS::Declarations.new: :$declarations, :$style;
my $vp = PDF::Style::Viewport.new: :$css;
my Tui::Node::Root $root = Tui::Node.new: :element($vp);

is $root.css.display, 'block', "css.display";
is $root.css.unicode-bidi, 'embed', "css.unicode-bidi";
is $root.css.margin, [8, 8, 8, 3], "css.margin";
is $root.box.content, [588, 413, 7, 4], "content box";
is $root.box.margin, [595, 420, 0, 0], "margin box";

done-testing;

