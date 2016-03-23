desc "Run tests"
task :test do
  tests = Dir.glob('./tests/test_*')
  tests.each do |test|
    system "ruby #{test}"
  end
end
