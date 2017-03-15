use v6;
use Test;
use Tui::HTML;
my $style = Tui::HTML.new;
is ~$style.elem-style('body'), "display:block; margin:8px; unicode-bidi:embed;",'<body> default style';
is ~$style.elem-style('h5'), 'display:block; font-size:0.83em; font-weight:bolder; margin-bottom:1.5em; margin-top:1.5em; unicode-bidi:embed;', '<h5> default style';
done-testing;
