module Typedown

  class Shorthand

    def self.process body
      # Find all occurences mathcing the shorthand syntax
      # 'action/param1[/param2]
      offset = 0
      while(match = body[offset..-1].match(/\'\w+[\/\w+]+/)) do
        m = match[0]
        res = self.resolve m
        body.gsub!(m, res) if res
        offset += match.begin(0) + (res || m).length
      end
      body
    end


    private

    def self.resolve m
      begin
        params = m.tr("'", "").split("/")
        action = params.shift

        if self.shorthands[ action.downcase ]
          self.shorthands[ action.downcase ].resolve action, params
        else
          nil
        end
      rescue
        # Something wrong with parameters
        nil
      end
    end

    def self.shorthands
      @shorthands = {} unless @shorthands
      @shorthands
    end


    def self.add_shorthand name, obj
      self.shorthands[ name.downcase ] = obj
    end

    def initialize name
      Shorthand.add_shorthand(name, self)
    end

    def resolve action, params
      raise "Please subclass and override this method."
      nil
    end
  end

end
