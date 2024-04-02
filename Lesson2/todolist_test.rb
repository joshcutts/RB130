require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todolist'


class TodoListTest < Minitest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false , @list.done?)
  end

  def test_type_error
    assert_raises(TypeError) {@list.add("hi")}
  end

  def test_add
    @todo4 = Todo.new("test add")
    @list.add(@todo4)
    assert_equal((@list.to_a << @todo4), @list.to_a)
  end

  def test_shovel
    @todo4 = Todo.new("test add")
    @list << @todo4
    assert_equal((@list.to_a << @todo4), @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) {@list.item_at(100)}
  end

  def test_mark_done_at
    assert_equal(@todo1.done!, @list.mark_done_at(0))
    assert_raises(IndexError) {@list.mark_done_at(100)}
  end

  def mark_undone_at
    @todo1.done!
    @list.mark_undone_at(0)

    assert_equal(false, @todo1.done?)
    assert_raises(IndexError) {@list.mark_undone_at(100)}
  end

  def test_mark_all_done
    @list.mark_all_done
    # assert_equal(true, @todos.all? {|todo| todo.done?})
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_remove_at
    removed = @list.remove_at(0)
    assert_equal(@todo1, removed)
    assert_equal([@todo2, @todo3], @list.to_a)
    assert_raises(IndexError) {@list.remove_at(100)}
  end

  def to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)

    @todo1.done!

    checked_output = <<~CHECK_OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    CHECK_OUTPUT

    assert_equal(checked_output, @list.to_s)

    @todo2.done!
    @todo3.done!

    all_done_output = <<~ALL_CHECK_OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    ALL_CHECK_OUTPUT

    assert_equal(all_done_output, @list.to_s)
  end

  def test_each
    returns = @list.each do |todo|
      todo.done!
    end

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)

    assert_equal(returns, @list)
  end

  def test_select
    @todo2.done!
    selected = @list.select do |todo|
      todo.done?
    end

    assert_equal(true, selected.instance_of?(TodoList))
    assert_equal(@todo2, selected.to_a.first)
  end
end