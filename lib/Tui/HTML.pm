use v6;

class Tui::HTML {
    use CSS::Module;
    use CSS::Module::CSS3;
    use CSS::Declarations:ver(v0.1.2..*);

    has CSS::Module $module = CSS::Module::CSS3.module;
    has Array %!declarations;
    has CSS::Declarations %!css;

    submethod TWEAK {
        # rough cut. just loads simple selections on elements
        my $default-css = %?RESOURCES<xhtml.css>.absolute;
        my $actions = $module.actions.new;
        my $p = $module.grammar.parsefile($default-css, :$actions);
        my %ast = $p.ast;
        for %ast<stylesheet>.list {
            with .<ruleset> {
                my $declarations = .<declarations>;
                for .<selectors>.list {
                    for .<selector>.list {
                        for .<simple-selector>.list {
                            with .<qname><element-name> -> $elem-name {
                                %!declarations{$elem-name}.append: $declarations.list;
                            }
                        }
                    }
                }
            }
        }
    }

    method elem-style(Str $_) {
        my $declarations =  %!declarations{.lc} // [];
        %!css{.lc} //= CSS::Declarations.new: :$declarations;
    }
}
