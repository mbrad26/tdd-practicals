Learning by Building 1
======================

## Learn to

* Learn about your tools by building them yourself

## Introduction

We're going to build RSpec, step by step.

In the process, we'll prove to ourselves that our tools aren't magic. They're made up of simple concepts that we can understand, with enough time and thoughtfulness.


## Exercise 1

We won't be using RSpec today — we'll be building our own version of it. So don't worry about requiring it or installing it.

Let's look at a trivial RSpec test. We're not going to build this yet — but this is what we're working towards.

```ruby
describe "a simple test" do
  it "works" do
    expect(true).to eq true
  end
end
```

We're going to write the code to make this work:

```ruby
expect(true).to eq true
```

:::info
Notice the technique I'm using here: **simplify the problem.**

I use this an awful lot. As programmers we love this tool. As a junior developer you won't always pick the perfect 'simplification', but give it a go sometime.
:::

To make our job a little easier, we're going to simplify it:

```ruby
expect_to_be_equal(true, true)
```

And instead of producing a nice error message, let's start with this example:

```ruby
> expect_to_be_equal(true, true)
=> "Test passes! :)"
> expect_to_be_equal(true, false)
=> "Test fails! D:"
```

Go ahead and implement the `expect_to_be_equal` method.

## Exercise 2

Here's where I cheat a little bit — RSpec uses some fancy Ruby code to make the syntax more readable, but for #reasons we're going to uglify it again.

Write the code to make this work:

```ruby
> Expect.new.to_be_equal(true, true)
=> "Test passes! :)"
> Expect.new.to_be_equal(true, false)
=> "Test fails! D:"
```

## Exercise 3

Now write the code to make this work:

```ruby
> Expect.new(true).to_equal(true)
=> "Test passes! :)"
> Expect.new(true).to_equal(false)
=> "Test fails! D:"
```

## Exercise 4

Here's where it gets a little tougher.

Get to this:

```ruby
> Expect.new(true).to(Equal.new(true))
=> "Test passes! :)"
> Expect.new(true).to(Equal.new(false))
=> "Test fails! D:"
```

This exercise involves a way of relating classes together that you won't have used much yet.

Have a solid go at figuring out how it might work — if you don't come up with an idea after 5 minutes, scroll down to the tip.

```
>
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
>
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
>
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
>
```

### Tip

Let's zoom in on `Equal`:

Get to this:

```ruby
# Note — we're talking about `Equal`, not `Expect`
> Equal.new(true).compare(true)
=> true
> Equal.new(true).compare(false)
=> false
```

Then, consider this — don't worry if yours is a bit different:

```ruby
class Expect
  def initialize(value)
    @value = value
  end

  def to(comparison)
    if # ... fill in this gap ...
      puts "Test passed! :)"
    else
      puts "Test failed! :("
    end
  end
end
```

## Conclusion

So here we are:

```ruby
> Expect.new(true).to(Equal.new(true))
=> "Test passes! :)"
> Expect.new(true).to(Equal.new(false))
=> "Test fails! D:"
```

The RSpec version looks like this:

```ruby
expect(true).to eq true
```

We're not too far. Let's create some helper methods to make ours look more like RSpec:

```ruby
def expect(value)
  Expect.new(value)
end

def eq(value)
  Equal.new(value)
end

expect(true).to(eq(true))
# => "Test passes! :)"
```

And though you might not know the rules, you'll recall that in certain circumstances ruby lets you omit parentheses. So:

```ruby
expect(true).to eq true
```

And that's it!

## Extension

### More Matchers

(Note that RSpec calls classes like our `Equal` class 'matchers')

1. `expect([1, 2, 3]).to include 2`
2. `expect(obj).to respond_to :method`
3. `expect(obj).to be_a Class`

And any others you feel like!

Note: If this task gets confusing, it might be worth taking a read of the Exercise 4 Tip.

### It Blocks

Work your way towards adding `it` blocks.

```ruby
it "works" do
  expect(true).to eq true
end
```

Where it prints the test description on pass or fail.

This is more work than it might first appear, but don't be discouraged! You'll need to learn about ruby blocks and exceptions to get there.
