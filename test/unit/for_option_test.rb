require File.dirname(__FILE__) + '/../test_helper'

class ForOptionTest < Test::Unit::TestCase
  fixtures :for_options

  def setup
    @for_option = ForOption.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of ForOption,  @for_option
  end
end
