# frozen_string_literal: true

# rubocop:disable Lint/UnusedBlockArgument

loop { 1 }

loop do
  1
end

loop do
  # foobar
end

port ENV.fetch('PORT') { 3000 }

test 'foobar' do
end

te.st 'foobar' do
end

test 'foobar' do
  foobar
end

te.st 'foobar' do
  foobar
end

test 'foobar' do |bar|
  bar.to_s
end

te.st 'foobar' do |bar|
  bar.to_s
end

loop { super_super_super_super_super_super_super_super_super_super_super_super_long }

loop do
  super_super_super_super_super_super_super_super_super_super_super_long
end

loop { |i| 1 }

loop do |i|
  i
end

loop { |*| i }

loop { |(a, b)| i }

loop { |a, (b, c), d, *e| i }

loop { |i| super_super_super_super_super_super_super_super_super_super_super_super_long }

loop do |i|
  super_super_super_super_super_super_super_super_super_super_long
end

loop { |i| i.to_s }

loop do |i|
  i.to_s
end

loop do |i|
  i.to_s
  i.next
end

loop do |i|
  i.to_s :db
end

loop { |i, j| i.to_s }

for i in [1, 2, 3] do
  p i
end

def change
  change_table :foo do
    column :bar
  end
end

foo 'foo' do |bar|
  bar.to_s
end

target.method object.map do |arg|
  arg * 2
end

# from ruby test/ruby/test_call.rb
assert_nil(("a".sub! "b" do end&.foo {}))

list_of_things_that_is_long_and_will_cause_a_line_break.select(:foo).reject(&:blank?)

# rubocop:enable Lint/UnusedBlockArgument
