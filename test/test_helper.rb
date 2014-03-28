class AssertionFailed < RuntimeError
end

class TestCase
  @@tests = []
  @@passes = []
  @@failures = []
  @@errors = []

  def self.run
    self.new
    puts "\n\n#{@@tests.count} tests"
    puts "#{@@passes.count} passes"
    puts "#{@@failures.count} failures"
    puts "#{@@errors.count} errors"
  end

  def self.test(desc, &blk)
    begin
      @@tests << desc
      yield
      putc "."
      @@passes << desc
    rescue AssertionFailed => ex
      putc "F"
      @@failures << desc 
    rescue => ex
      putc "E"
      @@errors << desc
      puts ex.inspect
    end
  end

  def self.assert(&blk)
    unless yield == true
      raise AssertionFailed
    end
  end

  def self.assert_exception(exception_class = nil, &blk)
    begin
      yield
      raise AssertionFailed
    rescue exception_class
      true
    end
  end

end
