public class ExpectDecimal extends Expect {
    protected final Decimal expected;

    public ExpectDecimal(Decimal expected) {
        this.expected = expected;
    }

    private ExpectDecimal(ExpectDecimal existingInstance) {
        super(NEGATED_ASSERT, existingInstance);
        this.expected = existingInstance.expected;
    }

    public ExpectDecimal negated {
        get {
            return new ExpectDecimal(this);
        }
    }

    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }

    private ExpectDecimal assertThis(Boolean test, String message) {
        assertNegatable(test, message);
        return (ExpectDecimal) parentInstance;
    }

    public ExpectDecimal shouldEqual(Decimal actual) {
        return shouldEqual(
            actual,
            formatMessage(SHOULD_BE_MESSAGE, String.valueOf(actual))
        );
    }

    public ExpectDecimal shouldEqual(Decimal actual, String message) {
        return assertThis(expected == actual, message);
    }

    public ExpectDecimal shouldBeLessThan(Decimal actual, string message) {
        return assertThis(expected < actual, message);
    }

    public ExpectDecimal shouldBeLessThan(Decimal actual) {
        return shouldBeLessThan(
            actual,
            formatMessage(SHOULD_BE_LESS_MESSAGE, String.valueOf(actual))
        );
    }

    public ExpectDecimal shouldBeLessThanOrEqualTo(
        Decimal actual,
        string message
    ) {
        return assertThis(expected <= actual, message);
    }

    public ExpectDecimal shouldBeLessThanOrEqualTo(Decimal actual) {
        return shouldBeLessThanOrEqualTo(
            actual,
            formatMessage(
                SHOULD_BE_LESS_OR_EQUAL_MESSAGE,
                String.valueOf(actual)
            )
        );
    }

    public ExpectDecimal shouldBeGreaterThan(Decimal actual, string message) {
        return assertThis(expected > actual, message);
    }

    public ExpectDecimal shouldBeGreaterThan(Decimal actual) {
        return shouldBeGreaterThan(
            actual,
            formatMessage(SHOULD_BE_GREATER_MESSAGE, String.valueOf(actual))
        );
    }

    public ExpectDecimal shouldBeGreaterThanOrEqualTo(
        Decimal actual,
        string message
    ) {
        return assertThis(expected >= actual, message);
    }

    public ExpectDecimal shouldBeGreaterThanOrEqualTo(Decimal actual) {
        return shouldBeGreaterThanOrEqualTo(
            actual,
            formatMessage(
                SHOULD_BE_GREATER_OR_EQUAL_MESSAGE,
                String.valueOf(actual)
            )
        );
    }

    public ExpectDecimal shouldBeBetween(Decimal rangeStart, Decimal rangeEnd) {
        return shouldBeBetween(
            rangeStart,
            rangeEnd,
            expectedShouldBeBetweenMessage(
                String.valueOf(rangeStart),
                String.valueOf(rangeEnd)
            )
        );
    }

    public ExpectDecimal shouldBeBetween(
        Decimal rangeStart,
        Decimal rangeEnd,
        string message
    ) {
        Boolean testedBetween = (rangeStart < rangeEnd)
            ? rangeStart <= this.expected && this.expected <= rangeEnd
            : rangeEnd <= this.expected && this.expected <= rangeStart;

        return assertThis(testedBetween, message);
    }

    public ExpectDecimal andIt {
        get {
            return (ExpectDecimal) parentInstance;
        }
    }
}
