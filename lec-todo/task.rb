class Task
  attr_reader :title

  def initialize(title)
    @title = title
    @done = false
  end

  def done?
    return @done
  end

  def mark_as_done!
    @done = true
  end
end

# task = Task.new("Have breakfast")
# task.mark_as_done!
# p task.done?
