require 'csv'

class Task
	attr_accessor :name, :completed

	def initialize(name, completed=false)
		@name = name
		@completed = completed
	end
end

class Record

	def save(task)
		CSV.open('list.csv', "a+") do |csv|
			csv << [task.name, task.completed]  
		end  
	end
	def all_save(task)
	CSV.open('list.csv', "wb") do |csv|
			task.each do |task|
			csv << [task.name, task.completed]
			end 
		end
	end

	def create(name)
		Task.new(name)
	end
	def delete(num)
		list_new = []
		list = read
		puts "#{list}"
		list.each_with_index do |task, index|
			if index+1 != num.to_i
				list_new << task
			end
		end
		list_new
		puts "lista de delete #{list_new}"
 	end

 	def update(num)
		list = read
		list.each_with_index do |task, index|
			task.completed = true if index+1 == num.to_i
		end
		list
	end

	def read
		task_list = []
		CSV.foreach('list.csv') do |row|
			task_list << Task.new(row[0], row[1])
		end	
		task_list
	end	
end