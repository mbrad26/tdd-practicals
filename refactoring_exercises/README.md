# Refactoring

## Learn to

- Improving the Design of existing code.

## Introduction

> Refactoring is a controlled technique for improving the design of an existing code base. Its essence is applying a series of small behavior-preserving transformations, each of which "too small to be worth doing". However the cumulative effect of each of these transformations is quite significant. – Martin Fowler

**Refactoring** is the third and final part of the Red, Green, Refactor TDD Cycle. It's also the most important part. From doing refactoring, you:

- Improve the design of your code
- Learn more about the whole program you're designing
- Define the patterns and names that make your code extensible.

In this practical, you will learn three simple techniques for refactoring, and when to use them:

- Extract variable for unnamed expressions
- Extract method for unnamed procedures
- Extract class for unnamed objects

> I have two programming brains. One to make it work, and another to make it good. This practical trains the latter brain.

## Extract variable

Let's imagine that we have the following test:

```ruby
expect { Calculator.new.add(2, 5) }.to output("The result is: 7").to_stdout
```

Here is the basic code to solve this test:

```ruby
# Understands adding two numbers and printing the result with a header
class Calculator
  def add(number_1, number_2)
    puts("The result is: #{number_1 + number_2}")
  end
end
```

Here's what's wrong with this code:

1. When we describe this class using the comment above, we use the words `result` and `header`, but these names don't exist anywhere in the code (there are no variables or methods with these names).
2. `#add` has two responsibilities. It adds numbers **and** it prints things.
3. `Calculator` has two responsibilities. It adds numbers **and** it prints things.

Each of these problems is a clue that we should refactor our code. Here's the code after using the **extract variable** technique:

```ruby
# Understands adding two numbers and printing the result with a header
class Calculator
  def add(number_1, number_2)
    result = number_1 + number_2
    header = "The result is: "

    puts("#{ header }#{ result }")
  end
end
```

The benefit is: we have named two parts of the program, `result` and `header`. Now they have names, our program is easier to read. Also, we can separate them out further.

> Lots of people use the term _"listen to your code"_. What they normally mean is "something in your code needs a name. If you find it and name it your path will become more obvious".

## Extract method

Here's the code after using **extract method**:

```ruby
# Understands adding two numbers and printing the result with a header
class Calculator
  def add(number_1, number_2)
    result = number_1 + number_2

    print(result)
  end

  private

  def print(result)
    header = "The result is: "

    puts("#{ header }#{ result }")
  end
end
```

The benefits are:

1. Everything to do with printing is in one place: the `#print` method.
2. Our `#add` method is easier to read.
3. Our `#add` method has only one responsibility: calculating the result. It delegates printing responsibilities to another method, `#print`.

> If you can do this pattern – extract method to a `private` method – the signs are good that you can now extract a class.
