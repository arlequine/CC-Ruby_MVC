require_relative 'model.rb' 
require_relative 'view.rb'

class ListController
  def initialize(input)
    @view = View.new
    @model = Record.new
    run(input)
    @list = []
  end

  def read_index
    all_tasks = @model.read
    view.show_index(all_tasks)
  end

  def run(input)
      task = input
      task_name = "#{task[1..-1].join(" ")}"
      case task[0]
       when "add" then add_task(task_name)
       when "index" then read_index
       when "delete" then delete_task(task_name)
       when "complete" then update_complete(task_name)
      end
  end

  def read_index
    all_tasks = @model.read
    @view.show_index(all_tasks)
  end

  def delete_task(num)
   keep_tasks = @model.delete(num)
   @model.all_save(keep_tasks)
   @view.message_delete
  end

  def update_complete(num)
    keep_tasks = @model.update(num)
    @model.all_save(keep_tasks)
    read_index
    @view.message_update
  end


  def add_task(task_name)
    task = @model.create(task_name)
    @model.save(task)
    @view.message_save
  end
end

user_input = ARGV
p user_input
ListController.new(user_input)