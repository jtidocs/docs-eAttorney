require 'asciidoctor/extensions' unless RUBY_ENGINE == 'opal'
include ::Asciidoctor

# An inline macro the wraps names in desired AsciiDoc markup.
class UIInlineMacro < Extensions::InlineMacroProcessor
    use_dsl

    named :ui
    name_positional_attributes 'name'

    def process (parent, target, attrs)
        marker = '``'
        name = attrs['name'] || 'FIXME: Provide a UI label'
        formatted = "[.ui.ui-#{target}]#{marker}#{name}#{marker}"

        create_inline_pass(parent, formatted, attributes: { 'subs' => :normal })
    end
end

Extensions.register do
    inline_macro UIInlineMacro
end
