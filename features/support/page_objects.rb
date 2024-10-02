# frozen_string_literal: true

# modulo para instanciar classes
module PageObjects
  def users
    Users.new
  end

  def posts
    Posts.new
  end

  def comments
    Comments.new
  end

  def todos
    Todos.new
  end

end
