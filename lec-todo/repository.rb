class Repository
  def initialize
    @tasks = [] #list of task instances
  end
#add tasks
  def add(new_task)
    @tasks << new_task
  end

#delete
  def delete(index)
   @task.delete_at(index)
  end

#get all
  def all
    @task
  end

  def find(index)
    @tasks[index]
  end

  def update(task)
    task.mark_as_done!
  end
end
