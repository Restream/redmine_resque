class NonRequeueableJob

  def self.scheduled(queue, klass, *args)
    if Resque.peek(queue, 0, -1).any? { |entry| entry['class'] == self.name && entry['args'] == args }
      message = "Blocking duplicate queue entry of #{self.name} with args #{args.inspect}."
      puts message
      Resque.logger.info message
    else
      Resque::Job.create(queue, klass, *args)
    end
  end
end