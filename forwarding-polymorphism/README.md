OO Relationships 1 (Forwarding, Polymorphism)
=============================================

## Learn to

* Apply two kinds of OO class relationship:
  * Forwarding
  * Polymorphism

## Introduction

We've covered a bit about how we can control complexity in our codebases by breaking our programs up using encapsulation — in our case with classes and objects.

Object Oriented Programming has introduced many powerful ways of relating these classes and objects to each other. We are going to cover two today.

## Forwarding

Consider the following example:

```ruby
class SecretDiary
  def initialize
    @contents = "Eric Cantona is the best footballer"
    @unlocked = false
  end

  def unlock
    @unlocked = true
  end

  def lock
    @unlocked = false
  end

  def read
    return "Go away!" unless @unlocked
    @contents
  end
end
```

If we draw a method relatedness diagram, we'd get something like:

```
   * lock
   * unlock
                   * read
```

There seem to be two clear 'groups' of methods. We can separate these up like this:

```ruby
class Diary
  def initialize
    @contents = "Eric Cantona is the best footballer"
  end

  def read
    @contents
  end
end

class SecretDiary
  def initialize
    @diary = Diary.new
    @unlocked = false
  end

  def unlock
    @unlocked = true
  end

  def lock
    @unlocked = false
  end

  def read
    return "Go away!" unless @unlocked
    @diary.read
  end
end
```

See how `SecretDiary` **forwards** methods on to `Diary`.

The behaviours of 'locking/unlocking' and 'diary keeping' are now in separate classes. This is a better way of organising our code.

## Exercise 1

Draw a diagram of the above code. Think about the best way to denote this **forwarding** relationship.

## Exercise 2

Consider this code:

```ruby
class User
  def initialize(name, bio, age, password)
    @name = name
    @bio = bio
    @age = age
    @password = password
  end

  def authenticate(candidate_password)
    return true if candidate_password == @password
    false
  end

  def profile
    "#{@name}, born in #{birth_year}: #{@bio}"
  end

  private

  def birth_year
    Time.new.year - @age
  end
end
```

Use a **forwarding** relationship to extract the authentication behaviour from `User` into another class.

Draw a diagram first, then do the refactor on the code.


## Polymorphism

Consider the following example:

```ruby
class Expect
  def initialize(value)
    @value = value
  end

  def to_equal(other)
    if @value == other
      puts "Test passed"
    else
      puts "Test failed"
    end
  end

  def to_include(other)
    if @value.include? other
      puts "Test passed"
    else
      puts "Test failed"
    end
  end

  def to_respond_to(method_name)
    if @value.respond_to? method_name
      puts "Test passed"
    else
      puts "Test failed"
    end
  end
end

class Tests
  def run
    Expect.new(5).to_equal(5)
    Expect.new([1,2,3]).to_include(2)
    Expect.new("hello").to_respond_to(:reverse)
  end
end
```

Notice that each of the methods on Expect are quite similar — they all do the same thing but with a single difference.

We'll cover the problem with this in more detail, but for now, consider the following arrangement:

```ruby
class Expect
  def initialize(value)
    @value = value
  end

  def to(comparison)
    if comparison.compare(@value)
      puts "Test passed"
    else
      puts "Test failed"
    end
  end
end

class Equal
  def initialize(value)
    @value = value
  end

  def compare(other)
    other == @value
  end
end

class Include
  def initialize(value)
    @value = value
  end

  def compare(array)
    array.include?(@value)
  end
end

class RespondTo
  def initialize(method_name)
    @method_name = method_name
  end

  def compare(other)
    other.respond_to? @method_name
  end
end

class Tests
  def run
    Expect.new(5).to(Equal.new(5))
    Expect.new([1,2,3]).to(Include.new(2))
    Expect.new("hello").to(RespondTo.new(:reverse))
  end
end
```

Notice how each comparison class (`Equal`, `Include`, `RespondTo`) is encapsulated within its own class.

Notice how each comparison follows the same pattern. We can think of that pattern as a sort of template. We'll call that template `Comparison`. It has these features:

* You can call `#new` on it to get a new instance.
* You can call `#compare` on it with a value, and get true or false.

The `Equal` class knows how to deal with anything that fits the `Comparison` template.

We sometimes call this 'duck typing' — if it looks like a duck, and quacks like a duck it's probably a duck.

If you can call`#compare` on it — we'll assume it's a `Comparison`.

This pattern gives us enormous power. We can make `Expect` do cool new stuff just by creating a new `Comparison` class. If we're adding code we're not changing existing code — so we can't be adding any new bugs to our existing classes.

## Exercise 3

Draw a diagram of the above code. Think about the best way to denote this **polymorphic** relationship.

## Exercise 4

Consider this code:

```ruby
class ScrambledDiary
  def initialize(contents)
    @contents = contents
  end

  def read
    @contents
  end

  def scramble_by_advancing_chars(steps)
    plain_chars = @contents.chars
    scrambled_chars = plain_chars.map do |char|
      (char.ord + steps).chr
    end
    @contents = scrambled_chars.join
  end

  def unscramble_by_advancing_chars(steps)
    scrambled_chars = @contents.chars
    plain_chars = scrambled_chars.map do |char|
      (char.ord - steps).chr
    end
    @contents = plain_chars.join
  end

  def scramble_by_reversing
    @contents = @contents.reverse
  end

  def unscramble_by_reversing
    @contents = @contents.reverse
  end
end
```

Use a **polymorphic** relationship to extract the different scrambling behaviours from `ScrambledDiary`.

Draw a diagram first, then do the refactor on the code.
