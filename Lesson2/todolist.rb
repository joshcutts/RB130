class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  # def ==(otherTodo)
  #   title == otherTodo.title &&
  #     description == otherTodo>description &&
  #     done == otherTodo.done
  # end
end

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# todo1.done!
# todo2.done!
# todo3.done!

# puts todo1
# puts todo2
# puts todo3

require "pry"

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of?(Todo)
    @todos << todo if todo.class == Todo
  end
  alias_method :<<, :add

  def size
    @todos.length
  end

  def first
    @todos[0]
  end

  def last
    @todos[-1]
  end

  def to_a
    @todos
  end

  def done?
    @todos.all? {|todo| todo.done?}
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    @todos.fetch(index).done!
  end

  def mark_undone_at(index)
    @todos.fetch(index).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end
  
  def to_s
    test = "---- #{title} ----\n"
    test << @todos.map(&:to_s).join("\n")
    test
  end

  def each
    counter = 0

    while counter < @todos.length
      yield @todos[counter]
      counter += 1
    end
    
    self
  end

  def select
    new_list = TodoList.new("#selected #{title}")
    selected = @todos.select do |todo|
      yield(todo)
    end

    selected.each do |selected_todo|
      new_list.add(selected_todo)
    end

    new_list
  end

  def find_by_title(str)
    index = @todos.map(&:title).index(str)
    return @todos[index] if index
    nil
  end

  def all_done
    @todos.select(&:done?)
  end

  def all_not_done
    @todos.select {|todo| !todo.done?}
  end

  def mark_done(str)
    index = @todos.map(&:title).index(str)
    @todos[index].done!
  end

  def mark_all_done
    @todos.each { |todo| todo.done! }
  end

  def mark_all_undone
    @todos.each { |todo| todo.undone! }
  end

end

# list = TodoList.new("Today's Todos")

# list.add(todo1)
# list.add(todo2)
# list.add(todo3)
# list.add(1)

# p list.size
# puts list.first
# puts list.last
# puts list.to_a
# puts list.done?

# puts list.item_at(100)

# list.mark_done_at(1)
# puts list.to_a

# list.remove_at(1)
# puts
# puts list.to_a

# puts list

# results = list.select { |todo| todo.done? }
# puts results.inspect

# a = ["one", "two", "three"]
# p a.find("two")

# list.mark_all_undone

# puts list