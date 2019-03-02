require "bundler/setup"
require "minitest/autorun"
require "open3"

describe "Hashes" do
  it "converts symbol keys away from hash rocket syntax" do
    assert_equal_and_valid(
      "{ :group => 1 }",
      "{ group: 1 }",
    )
  end

  it "does not convert symbol keys ending in equlas from hash rocket syntax" do
    assert_equal_and_valid(
      "{ :group= => 1 }",
      "{ :group= => 1 }",
    )
  end

  def assert_equal_and_valid(input, expected)
    result = apply_prettier(input)
    assert_equal expected, result
    ensure_valid(expected)
  end

  def ensure_valid(string)
    _, stderr_str, status = Open3.capture3("ruby -c", stdin_data: string)
    assert_equal status.success?, true, stderr_str
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
