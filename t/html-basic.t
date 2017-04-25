use v6;
use Test;
use PDF::Style::Viewport;
use PDF::Lite;
use XML;
use HTML::Parser::XML;
use CSS::Declarations;
use Tui::HTML::TagSet;

my Tui::HTML::TagSet $tag-style .= new;

plan 12;

my $page-width;
my $page-height;

diag "loading html";
my $html = 't/html/basic-p-tag.html'.IO.slurp;
my $parser = HTML::Parser::XML.new;
my $vp = PDF::Style::Viewport.new;
my $pdf = PDF::Lite.new;
my $page = $pdf.add-page;
diag "loaded html";
diag :$html.perl;
diag "parsing...";
$parser.parse($html);
warn "parsed...";
my $xmldoc = $parser.xmldoc; # XML::Document
warn "progressing...";

my $root = $xmldoc.root;
my $body;

if $root.name eq 'html' {
    my @bodies = $root.nodes.grep({.can('name') && .name eq 'body' });
    die "unable to find html body"
        unless @bodies;
    die "html has multiple body elements"
        if @bodies > 1;
    $body = @bodies[0];
}
else {
    die "bad root element: $root";
}

for $body.nodes.list {

    when XML::Text {
        todo "XML::Text elems";
        flunk "plain text tests";
    }

    when XML::Element {
        my CSS::Declarations $css = $tag-style.elem-style(.name).clone;

        if my $style = .<style> {
            diag "style: $style";
            lives-ok { $css.inherit($style) }, 'style processing';
            note ~$css;
            todo "style attribute processing";
            flunk "style tests";
        }

        given .name {
            when 'div' { todo "div tests"; flunk "div tests" }
            when 'p' { todo "paragraph tests"; flunk "paragraph tests" }
            when 'span' { todo "span tests"; flunk "span tests" }
            default { diag "unhandled {.name} tag"; }
        }
    }

    when XML::Comment {}

    default { diag "unandled node: {.gist}" }
}

$pdf.save-as: "t/html-basic.pdf";

ok 'skeleton';
