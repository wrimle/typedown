
module Typedown
  class Section < String
    def initialize title, body
      @title = (title || "").strip
      @body = ""
      @sections = []
      if body
        @body, @sections = sectionize(body) 
      end
    end

    def dummy?
      (title.strip.empty?) && (!@body || @body.strip.empty?) && subsections.length == 1
    end

    def title
      @title || ""
    end

    def body
      b = Document.new(@body || "")
      b << "\n\n"
      subsections.each do |s|
        b << s.doc
      end
      b
    end

    def doc
      d = Document.new "! #{title}\n\n"
      d << body.gsub(/^(!+ )/, '!\0')
      d
    end

    def subsections
      @sections || []
    end

    def self.sectionize body, title = nil
      s = nil
      s = Section.new title || "", body || ""
      s.dummy? ? s.subsections[0] : s
    end

    private

    def sectionize v
      return if v == nil || v.strip.empty?

      body, rest = v.split(/^! /, 2)
      sections = []

      if rest
        rest.strip.split(/^! /).each do |s|
          title, rest = s.split(/$/, 2)
          rest.gsub!(/^!(!+ )/, "\\1") if rest

          sections << Section.new(title || "", rest || "")
        end
      end

      [ body, sections ]
    end
  end
end
