require 'helper'

class TestSection < Test::Unit::TestCase
  def setup
    @doc = File.read("test/data/example.tpd")
  end

  def teardown
  end

  should "parse with no exceptions" do
    assert_nothing_raised do
      s = Typedown::Section.new "Mail subject", @doc
    end
  end

  should "reassemble doc with no exceptions" do
    assert_nothing_raised do
      s = Typedown::Section.new "Mail subject", @doc
    end
  end

  should "reassemble doc with no exceptions" do
    assert_nothing_raised do
      s = Typedown::Section.sectionize @doc, "Mail subject"
      puts "\n\n", s.doc
    end
  end
end
