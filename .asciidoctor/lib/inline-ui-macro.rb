require 'asciidoctor/extensions' unless RUBY_ENGINE == 'opal'
include ::Asciidoctor

# An inline macro that wraps names in desired AsciiDoc markup.
class UIInlineMacro < Extensions::InlineMacroProcessor
    use_dsl

    named :ui
    name_positional_attributes 'name'

    def process (parent, target, attrs)
        marker = '``'
        name = attrs['name'] || 'FIXME: Provide a UI label'
        formatted = "[.ui.ui-#{target}]#{marker}#{name}#{marker}"

        create_inline_pass(parent, formatted, attributes: { 'subs' => [:normal] })
    end
end

Extensions.register do
    inline_macro UIInlineMacro
    block_macro :attributes do
        process do |parent, target, attrs|
            entries = parent.document.attributes.sort.map do |name, val|
                (val = val.to_s).empty? ? %(:#{name}:) : %(:#{name}: #{val})
            end
            create_listing_block parent, entries, { 'style' => 'source', 'language' => 'asciidoc', 'nowrap-option' => '' }
        end
    end
end
