require_relative "repository.rb"
require_relative "view.rb"
require_relative "task.rb"

class Controller

  def initialize(repository)
@repository = repository
  end
#display/read
  def list
    tasks = @repository.all #array of tasks
    #pring all tasks to the user
    @view.display(tasks)
  end
#add
  def add
    title = @view.ask_for_title
    task = Task.new(title)
    @repository.add(task)
    end
#delete
  def delete
    list
    index = @view.ask_for_index
    @tasks.delete(index)
    list
  end
#mark done
def mark_as_done
  list
  index = @view.ask_for_index
  task = @repository.find(index)
  task.update(taxk)
  end
#crud
end
