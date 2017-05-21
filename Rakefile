task :default => [:test]

require 'rake/testtask'
Rake::TestTask.new do |i|
 i.test_files = FileList['test/unit/lib/boombox/*_test.rb',
                        'test/integration/smoke_tests/*_test.rb']
  #i.verbose = true
end