
class View

	def initialize
	
	end

	def message_save
		puts "Your task has been saved"
	end

	def message_delete
		puts "Deleted the task"
	end
   
    def show_index(all_tasks)
      	all_tasks.each_with_index do |task, index|
      		if task.completed == "true"
      			char_x = "X"
      		else
      			char_x = " "
      		end
    		puts "#{index+1}, [#{char_x}] #{task.name}"
    	end
    end

    def message_update
    	puts "You completed the task"
    end

end