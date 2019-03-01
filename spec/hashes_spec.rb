require "bundler/setup"
require "minitest/autorun"

describe "Hashes" do
  it "converts symbol keys away from hash rocket syntax" do
    result = apply_prettier("{ :group => 1 }")

    assert_equal "{ group: 1 }", result
  end

  it "does not convert symbol keys ending in equlas from hash rocket syntax" do
    result = apply_prettier("{ :group= => 1 }")

    assert_equal "{ :group= => 1 }", result
  end

  def apply_prettier(string)
    file = write_string_to_tempfile(string)
    run_prettier_on_file(file.path)
  end

  def write_string_to_tempfile(string)
    Tempfile.new('prettier-ruby-test.rb').tap do |file|
      file.write(string)
      file.close
    end
  end

  def run_prettier_on_file(path)
    `bin/print #{path}`.rstrip
  end
end
