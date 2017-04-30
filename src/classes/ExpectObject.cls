public class ExpectObject extends Expect {

    private final Object expected;

    public ExpectObject(Object expected) {
        this.expected = expected;
    }

    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }

    public ExpectObject andIt { get { return this; } }

    public Expect shouldEqual(Object actual) {
        shouldEqual(actual, expectedShouldBeMessage(actual));
        return this;
    }

    public Expect shouldEqual(Object actual, String message) {
        assert(expected === actual, message);
        return this;
    }
/* no test
    public Expect shouldNotEqual(Object actual) {
        return shouldNotEqual(actual, expectedShouldNotBeMessage(actual));
    }*/
/* no test
    public Expect shouldNotEqual(Object actual, String message) {
        assert(expected !== actual, message);
        return this;
    } */

    public Expect isEquivalentTo(Object actual) {
        return isEquivalentTo(actual, expectedShouldBeMessage(actual));
    }

    public Expect isEquivalentTo(Object actual, String message) {
        assert(expected == actual, message);
        return this;
    }
}