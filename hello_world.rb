class Hello_World

  attr_reader :data

  def initialize(data)
    @data = data
  end

  def print_hello_world
    data.big_guy_counter += 1
    data.hello_counter += 1
    "Hello World! (#{data.hello_counter})"
  end

end
