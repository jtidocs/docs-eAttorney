class ExtendedPDFConverter < (Asciidoctor::Converter.for 'pdf')
  register_for 'pdf'

  # overrides go here
#  def convert_thematic_break node
#    theme_margin :thematic_break, :top
#    stroke_horizontal_rule 'FF0000', line_width: 0.5, line_style: :solid
#    move_down 1
#    stroke_horizontal_rule 'FF0000', line_width: 1, line_style: :solid
#    move_down 1
#    stroke_horizontal_rule 'FF0000', line_width: 0.5, line_style: :solid
#    theme_margin :thematic_break, ((block_next = next_enclosed_block node) ? :bottom : :top), block_next || true
#  end

  def ink_chapter_title node, title, opts = {}
    ink_heading title, (
      opts.merge align: :center,
      text_transform: :uppercase
    )
    stroke_horizontal_rule '168cbf', line_width: 1, left_projection: -72, right_projection: 72
    move_down 1
    stroke_horizontal_rule '168cbf', line_width: 1, line_style: :solid
    move_down 1
    stroke_horizontal_rule '168cbf', line_width: 1, left_projection: -72, right_projection: 72
    move_down theme.block_margin_bottom * 3
    # theme_font :base do
    #   layout_prose 'Custom text here, maybe a chapter preamble.'
    # end
  end
end
