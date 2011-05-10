#require 'rubygems'
#require 'kramdown'
require 'bluecloth'
#require 'redcloth'

module Typedown
  class Document < String
    def initialize text = nil
      super ""
      self << text if text
    end

    def to_markdown
      text = self

      # Translate '! headings' to '# headings'
      text.gsub!(/^! /, "# ")
      text.gsub!(/^!! /, "## ")
      text.gsub!(/^!!! /, "### ")
      text.gsub!(/^!!!! /, "#### ")
      text.gsub!(/^!!!!! /, "##### ")
      text.gsub!(/^!!!!!! /, "###### ")

      # Dialogue dashes
      text.gsub!(/^-\.? /, "&#8213; ")
      text.gsub!(/\s-\.? /, " &#8213; ")

      # Insert placeholders around lead in
      text.gsub!(/^\. (( *[^\n].+\n)*)/, "! x!\\1!x-!\n")
      # Remove placeholders while using them to remove whitespace
      text.gsub!(/^! x!\s*/, "**")
      text.gsub!(/\s*!x-!$/, "**")


      # Insert placeholders around lead in
      text.gsub!(/^\/\/\. (( *[^\n].+\n)*)/, "! x!\\1!x-!\n")
      # Remove placeholders while using them to remove whitespace
      text.gsub!(/^! x!\s*/, "**")
      text.gsub!(/\s*!x-!$/, "**")

      # Textile links to markdown links
      text.gsub!(/\"([^\"]+)"\:(\S+[\w\d\/])/, "[\\1](\\2)")

      # Typedown image tag
      text.gsub!(/!\[(.+)\]\((.+)\)/, "<div class='image'><img src='\\2' /><div class='caption'>\\1</div></div>")

      # Insert placeholders around lead in
      text.gsub!(/^\/\. (( *[^\n].+\n)*)/, "! x!\\1!x-!\n")
      # Remove placeholders while using them to remove whitespace
      text.gsub!(/^! x!\s*/, "*")
      text.gsub!(/\s*!x-!$/, "*")

      # Slash for _
      text.gsub!(/(\s)\/(\S+)\/(\s)[\.\,\?\!]?/, "\\1_\\2_\\3")
      text.gsub!(/(\s)\/\/(\S+)\/\/[\.\,\?\!]?(\s)/, "\\1__\\2__\\3")
      text.gsub!(/(\s)\/\/\/(\S+)\/\/\/[\.\,\?\!]?(\s)/, "\\1___\\2___\\3")
      text
    end


    def to_textile
      text = self

      # Translate '! headings' to '# headings'
      text.gsub!(/^! /, "h1. ")
      text.gsub!(/^!! /, "h2. ")
      text.gsub!(/^!!! /, "h3. ")
      text.gsub!(/^!!!! /, "h4. ")
      text.gsub!(/^!!!!! /, "h5. ")
      text.gsub!(/^!!!!!! /, "h6. ")

      # Dialogue dashes
      text.gsub!(/^-\.? /, "&#8213; ")
      text.gsub!(/\s-\.? /, " &#8213; ")

      # Insert placeholders around lead in
      text.gsub!(/^\. (( *[^\n].+\n)*)/, "! x!\\1!x-!\n")
      # Remove placeholders while using them to remove whitespace
      text.gsub!(/^! x!\s*/, "*")
      text.gsub!(/\s*!x-!$/, "*")


      # Insert placeholders around lead in / bold paragraph
      text.gsub!(/^\/\/\. (( *[^\n].*\n)*)/, "! x!\\1!x-!\n")
      # Remove placeholders while using them to remove whitespace
      text.gsub!(/^! x!\s*/, "*")
      text.gsub!(/\s*!x-!$/, "*")


      # Insert placeholders around italicized paragraph
      text.gsub!(/^\/\. (( *[^\n].*\n)*)/, "! x!\\1!x-!\n")
      # Remove placeholders while using them to remove whitespace
      text.gsub!(/^! x!\s*/, "_")
      text.gsub!(/\s*!x-!$/, "_")

      # Slash for _
      text.gsub!(/(\s)\/(\S+)\/(\s)[\.\,\?\!]?/, "\\1_\\2_\\3")
      text.gsub!(/(\s)\/\/(\S+)\/\/[\.\,\?\!]?(\s)/, "\\1*\\2*\\3")
      text.gsub!(/(\s)\/\/\/(\S+)\/\/\/[\.\,\?\!]?(\s)/, "\\1*_\\2_*\\3")
      text
    end

    
    def to_html
      #kramdown = Kramdown::Document.new to_markdown
      #kramdown.to_html
      bluecloth = BlueCloth::new( to_markdown )
      bluecloth.to_html
      #redcloth = RedCloth.new( to_textile )
      #redcloth.to_html
    end
  end
end
