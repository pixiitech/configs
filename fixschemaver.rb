schema = File.read('db/schema.rb')
string1 = schema.match(/<<<<<<< HEAD\nActiveRecord::Schema.define\(version: \d+\) do/).to_s
ver1 = string1.match(/\d+/).to_s.to_i
string2 = schema.match(/=======\nActiveRecord::Schema.define\(version: \d+\) do/).to_s
ver2 = string2.match(/\d+/).to_s.to_i
new_string = "ActiveRecord::Schema.define(version: #{[ver1, ver2].max}) do"
schema.gsub!(/<<<<<<< HEAD\nActiveRecord::Schema.define\(version: \d+\) do\n=======\nActiveRecord::Schema.define\(version: \d+\) do\n>>>>>>> .+$/, new_string)
f = File.new('db/schema.rb', 'w')
f << schema
puts "\033[36m Schema version updated!" if ver1.positive?
if schema.match(/<<<<<<</)
  puts "\033[31m There are other conflicts in db/schema.rb"
  puts "\033[0m"
  exit 1
else
  puts "\033[32m db/schema.rb is clean"
  puts "\033[0m"
  exit 0
end
