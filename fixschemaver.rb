schema = File.read('db/schema.rb')
string1 = schema.match(/<<<<<<< HEAD\nActiveRecord::Schema(\[\d\.\d\])?\.define\(version: [\d_]+\) do/).to_s
ver1 = string1.match(/20[\d_]+/).to_s.gsub(/_/, '').to_i
string2 = schema.match(/=======\nActiveRecord::Schema(\[\d\.\d\])?\.define\(version: [\d_]+\) do/).to_s
ver2 = string2.match(/20[\d_]+/).to_s.gsub(/_/, '').to_i
latest_version = ver1 > ver2 ? string1.match(/20[\d_]+/).to_s : string2.match(/20[\d_]+/).to_s
rails_ver_string = string1.match(/\[\d\.\d\]/) || string2.match(/\[\d\.\d\]/)
rails_ver_matcher = rails_ver_string.to_s.gsub(/\[/, "\\[").gsub(/\]/, "\\]")
puts "\033[36m Rails version = #{rails_ver_string}"
new_string = "ActiveRecord::Schema#{rails_ver_string}.define(version: #{latest_version}) do"
schema.gsub!(/<<<<<<< HEAD\nActiveRecord::Schema#{rails_ver_matcher}.define\(version: [\d_]+\) do\n=======\nActiveRecord::Schema#{rails_ver_matcher}.define\(version: [\d_]+\) do\n>>>>>>> .+$/, new_string)
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
