module Jekyll
  class MathTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
        super
        @inline = ( tag_name == "m" )
        @formula = text
    end
  
    def render(context)
        if @inline
          #Markdown recursively passes the content of a span we need two backslashes in the ruby string which does four
          #backslashes in the code.
          "<span class=\"math-inline\">\\\\(#{@formula}\\\\)</span>"
        else
          "<div class=\"math-block\"> \\[#{@formula}\\]</div>"
        end
    end
  end
  
  module MathFilter
    def m(formula)
          "<span class=\"math-inline\">\\\\(#{formula}\\\\)</span>"
    end
    def math(formula)
          "<div class=\"math-block\"> \\[#{formula}\\]</div>"
    end
  end
end

Liquid::Template.register_tag('m', Jekyll::MathTag)
Liquid::Template.register_tag('math', Jekyll::MathTag)
Liquid::Template.register_filter(Jekyll::MathFilter)
