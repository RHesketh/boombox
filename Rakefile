task :default => [:test]

require 'rake/testtask'
Rake::TestTask.new do |i|
 i.test_files = FileList[ 'test/unit/lib/boombox/*_test.rb',
                          'test/unit/lib/boombox/server/*_test.rb',
                          'test/unit/lib/boombox/mp3/*_test.rb',
                          'test/unit/lib/boombox/mp3/parser/*_test.rb',
                          'test/integration/smoke_tests/*_test.rb' ]
  #i.verbose = true
end