Dependency Injection
====================

## Learn to

* Use dependency injection to test classes in isolation

## Introduction

Dependency injection is a technique for helping you test classes in isolation. It allows a class to use either its real dependency, or a double.

Consider this code:

```ruby
class Greeter
  def greet
    smiley = Smiley.new
    "Hello #{smiley.get}"
  end
end

class Smiley
  def get
    ":)"
  end
end

# > greeter = Greeter.new
# > greeter.greet
# => "Hello :)"
```

`Smiley` has no dependencies, so we can test it like this:

```ruby
it "returns a smiley" do
  smiley = Smiley.new
  expect(smiley.get).to eq ":)"
end
```

But `Greeter` depends on `Smiley`, and there's no easy way of sparating them out. The dependency is hard coded. We might say that `Greeter` is tightly coupled to `Smiley`.

We can't call `Greeter#greet` without calling `Smiley#get`. That means if `Smiley` breaks, then our tests for `Greeter` break — even when `Greeter` is doing exactly what it is supposed to. This makes it harder to track down bugs.

But we can rearrange the code like this:

```ruby
class Greeter
  def initialize(smiley = Smiley.new)
    @smiley = smiley
  end

  def greet
    "Hello #{@smiley.get}"
  end
end

class Smiley
  def get
    ":)"
  end
end
```

And then test both like this:

```ruby
# greeter_spec.rb

describe Greeter do
  describe "#greet" do
    it "prints a message and a smiley" do
      smiley_double = double :smiley, get: ":D"
      greeter = Greeter.new(smiley_double)
      expect(greeter.greet).to eq "Hello :D"
    end
  end
end

# smiley_spec.rb
describe Smiley do
  describe "#get" do
    it "returns a smiley" do
      smiley = Smiley.new
      expect(smiley.get).to eq ":)"
    end
  end
end
```

This is called **dependency injection**. Instead of hard coding the dependency, we 'inject' it into the class via the initializer.

## Exercise 1

Amend the following classes to be testable in isolation, then write the tests for them.

```ruby
class Note
  def initialize(title, body)
    @title = title
    @body = body
    @formatter = NoteFormatter.new
  end

  def display
    @formatter.format(self)
  end

  attr_reader :title, :body
end

class NoteFormatter
  def format(note)
    "Title: #{note.title}\n#{note.body}"
  end
end
```

You will know you've succeeded when you can delete the `format` method on `NoteFormatter` and your `Note` tests still pass.

## Intermezzo: Of Classes

You can also inject and double classes themselves, like so:

```ruby
class CarFactory
  def initialize(car_class = Car)
    @car_class = car_class
  end

  def make_a_car
    car = @car_class.new
    car.drive_away
  end
end

class Car
  def drive_away
    # ... whatever ...
  end
end

describe CarFactory do
  describe "#make_a_car" do
    it "makes a car" do
      car_double = double :car
      car_class_double = double :car_class, new: car_double

      car_factory = CarFactory.new(car_class_double)

      expect(car_double).to receive(:drive_away)
      car_factory.make_a_car
    end
  end
end
```

## Exercise 2

Amend the following classes to be testable in isolation, then write the tests for them.

Hint: you can inject classes too, not just instances.

```ruby
class Diary
  def initialize
    @entries = []
  end

  def add(title, body)
    @entries << Entry.new(title, body)
  end

  def index
    titles = @entries.map do |entry|
      entry.title
    end
    titles.join("\n")
  end
end

class Entry
  def initialize(title, body)
    @title = title
    @body = body
  end

  attr_reader :title, :body
end
```

## Exercise 3

Amend `SayHello` to be testable in isolation, then write the tests for it.

```ruby
class EmailClient
  def message
    Message.new
  end
end

class Message
  def send(to, body)
    # Imagine I'm sending an email
  end
end

class SayHello
  def run
    email = EmailClient.new
    email.message.send(
      "friend@example.com",
      "HELLO!"
    )
  end
end
```


## Optional Extension

Amend the following class to be testable in isolation, then write the tests for it.

Hint: can you spot the class that Greeter interacts with?

```ruby
class Greeter
  def greet
    puts "What is your name?"
    name = Kernel.gets.chomp
    puts "Hello, #{name}"
  end
end
```
