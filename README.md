Test driving I
===================

_This will need to be pasted into http://hackmd.io/ to render properly._

## Learn to

* Test drive your code from the outside in

## Introducton

One of the jobs of a software engineer is turning vague half-formed ideas into working software.

We might imagine this experience:

```flow
understand=>operation: 1. Understand the brief
decide=>operation: 2. Decide what software to write
write=>operation: 3. Write the software
happy=>end: :D

understand->decide->write->happy
```

We're going to talk about step 2 here — "**Decide what software to write**".

You will do this very often during the course, except the 'brief' is our assignments.

Let's say we have this assignment:

> As a student  
> So that I can pay attention to my motivation  
> I want an IRB application that stores my motivation ratings  

There are many strategies for **deciding what software to write** here. We'll focus on one today: we will **imagine how to use it**.

We will do this by typing out an imagined interaction:

```ruby
> track_motivation(5)
=> "Motivation stored!"
> show_motivations
=> [5]
> track_motivation(6)
=> "Motivation stored!"
> show_motivations
=> [5, 6]
```

This isn't enough to tell us what to code yet, of course. We'll get into that.

## Exercise 1

Apply the **imagine how to use it** strategy for this brief:

> As a student  
> So that I can remember people's names  
> I want an IRB application that stores the names of people I meet  

Don't implement the solution — just **imagine how to use it.**

You will know it's right by reading the brief back and checking that your imagined solution satisfies it.

## Exercise 2

Apply the **imagine how to use it** strategy for this brief:

> As a student  
> So that I can understand my recent motivation  
> I want an IRB application that stores my motivation ratings  
> And I want to see the average of my last 3 ratings

Don't implement the solution — just **imagine how to use it.**

You will know it's right by reading the brief back and checking that your imagined solution satisfies it.

## Exercise 3

There's something rather neat about the **imagine how to use it** strategy for **deciding what software to write.** We can convert our examples into tests quite easily.

This is how we do it:

```ruby
# The imagined example
> track_motivation(5)
=> "Motivation stored!"
```

```ruby
# The expectation
expect(track_motivation(5)).to eq "Motivation stored!"
```

```ruby
# The full test
describe "the track_motivation method" do
  it "gives us a friendly message" do
    expect(track_motivation(5)).to eq "Motivation stored!"
  end
end
```

Take your result from Exercise 1 (remembering names) and convert it to a test like the above.

## Exercise 4

We're going to set up a new RSpec project.

```shell
$ gem install rspec
$ mkdir design_strategies_1
$ cd design_strategies_1
$ rspec --init
```

Run `rspec` now and you should see something like this:

```
No examples found.


Finished in 0.0004 seconds (files took 0.26379 seconds to load)
0 examples, 0 failures
```

* Open the `design_strategies_1` directory in atom
* Create a new file in the spec directory called `remembering_names_spec.rb`
* Paste your test from the last exercise into that file.

Run `rspec`. You should see the test fail.

## Exercise 5

Test failure messages can guide you with what code to write next.

This is another sort of design strategy: **race to green.**

For example, if you see the error:

```
NoMethodError:
 undefined method `add_name' for (...)
```

You can write the code:

```ruby
def add_name
end
```

And you will now get the error

```
ArgumentError:
 wrong number of arguments (given 1, expected 0)
```

So next:

```ruby
def add_name(name)
end
```

And then:

```
expected: "Motivation stored!"
     got: nil
```

See if you can make your test pass *purely* by fixing what the error messages tell you is wrong.

Don't jump straight to the solution.
