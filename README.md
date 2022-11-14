# Expect Apex

Expect Apex is a framework to write more readable assertions in Apex, with explicit intent of verifying a result.

To begin, an expect statement should start with the global class `Expect`, and it follows the syntax of "expect that something is/equals another thing". For example: "expect that boolean variable equals true".

A standard Apex assertion might look like this:

```apex
Boolean b = true;
System.assertEquals(b, 'It should have been true.');
```

But with this framework the assertion becomes:

```apex
Expect.that(b).shouldBeTrue();
// or
Expect.that(b).shouldEqual(true);
```

For numeric and more advanced types, it is possible to use the `andIt` method to make multiple assertions at once:

```apex
Expect.that(integerValue).shouldBeGreaterThan(0).andIt.shouldBeLessThan(5);
// Which is also the equivalent to:
Expect.that(integerValue).shouldBeBetween(0, 5);
```