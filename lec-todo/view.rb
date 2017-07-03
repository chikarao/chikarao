class View
  def display(tasks)
tasks.each_with_index do |task, index|
  puts "#{index}. #{task.title}"
  stutus = task.done? ? "[x]" : "[]"
  puts "#{index + 1}. #{status} #{task.title}"
  end

  def ask_user_for_description
    puts "What do you want to do"
    response = gets.chomp
    return title
each_with_index
end

def ask_for_index
  puts "Which numer?"
  prints ">"
  index = gets.chomp.to_i - 1
end

def mark_as_done

  end
end
