require 'helper'

class TestDocument < Test::Unit::TestCase
  def setup
    @doc = File.read("test/data/example.tpd")
  end

  def teardown
  end

  should "parse with no exceptions" do
    assert_nothing_raised do
      td = Typedown::Document.new @doc
      puts td.to_html
    end
  end
end
