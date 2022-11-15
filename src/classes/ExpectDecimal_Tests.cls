@SuppressWarnings(
    'PMD.MethodNamingConventions,PMD.ApexUnitTestClassShouldHaveAsserts'
)
@IsTest
public class ExpectDecimal_Tests {
    private static final Decimal DECIMAL_LOWEST = 1.2;
    private static final Decimal DECIMAL_MIDDLE = 2.5;
    private static final Decimal DECIMAL_HIGHEST = 4.2;
    private static final String DECIMAL_LOWEST_S = String.valueOf(
        DECIMAL_LOWEST
    );
    private static final String DECIMAL_MIDDLE_S = String.valueOf(
        DECIMAL_MIDDLE
    );
    private static final String DECIMAL_HIGHEST_S = String.valueOf(
        DECIMAL_HIGHEST
    );

    @IsTest
    static void ExpectShouldEqualMatchingValueDoesNotThrow() {
        Expect.that(DECIMAL_LOWEST).shouldEqual(DECIMAL_LOWEST);
    }

    private class ShouldEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DECIMAL_LOWEST).shouldEqual(DECIMAL_MIDDLE);
        }
        protected override void testCase(string message) {
            Expect.that(DECIMAL_LOWEST).shouldEqual(DECIMAL_MIDDLE, message);
        }
    }

    @IsTest
    static void ExpectShouldEqualThrowsDefaultMessage() {
        new ShouldEqualThrows()
            .verifyMessage(
                'Expected ' +
                DECIMAL_LOWEST_S +
                ' should be ' +
                DECIMAL_MIDDLE_S
            );
    }

    @IsTest
    static void ExpectShouldEqualThrowsSpecificMessage() {
        new ShouldEqualThrows().verifyCustomMessage('Unequal');
    }

    @IsTest
    static void ExpectShouldNotEqualDoesNotThrow() {
        Expect.that(DECIMAL_LOWEST).negated.shouldEqual(DECIMAL_MIDDLE);
    }

    private class ShouldNotEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DECIMAL_LOWEST).negated.shouldEqual(DECIMAL_LOWEST);
        }
        protected override void testCase(string message) {
            Expect.that(DECIMAL_LOWEST)
                .negated.shouldEqual(DECIMAL_LOWEST, message);
        }
    }

    @IsTest
    static void ExpectShouldNotEqualThrowsDefaultMessage() {
        new ShouldNotEqualThrows()
            .verifyMessage(
                'Expected ' +
                DECIMAL_LOWEST_S +
                ' should not be ' +
                DECIMAL_LOWEST_S
            );
    }

    @IsTest
    static void ExpectShouldNotEqualThrowsSpecificMessage() {
        new ShouldNotEqualThrows().verifyCustomMessage('equaled');
    }

    @IsTest
    static void ExpectShouldBeLessThanDoesNotThrow() {
        Expect.that(DECIMAL_LOWEST).shouldBeLessThan(DECIMAL_MIDDLE);
    }

    @IsTest
    static void ExpectShouldBeLessThanNegatedDoesNotThrow() {
        Expect.that(DECIMAL_MIDDLE)
            .negated.shouldBeLessThan(DECIMAL_LOWEST)
            .andIt.shouldBeLessThan(DECIMAL_HIGHEST);
    }

    private class ShouldBeLessThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DECIMAL_MIDDLE).shouldBeLessThan(DECIMAL_LOWEST);
        }
        protected override void testCase(String message) {
            Expect.that(DECIMAL_MIDDLE)
                .shouldBeLessThan(DECIMAL_LOWEST, message);
        }
    }

    @IsTest
    static void ExpectShouldBeLessThanThrowsDefaultMessage() {
        new ShouldBeLessThanThrows()
            .verifyMessage(
                'Expected ' +
                DECIMAL_MIDDLE_S +
                ' should be less than ' +
                DECIMAL_LOWEST_S
            );
    }

    @IsTest
    static void ExpectShouldBeLessThanThrowsCustomMessage() {
        new ShouldBeLessThanThrows().verifyCustomMessage('too high');
    }

    @IsTest
    static void ExpectShouldBeLessThanOrEqualToDoesNotThrow() {
        Expect.that(DECIMAL_LOWEST).shouldBeLessThanOrEqualTo(DECIMAL_LOWEST);
        Expect.that(DECIMAL_LOWEST).shouldBeLessThanOrEqualTo(DECIMAL_MIDDLE);
    }

    private class ShouldBeLessThanOrEqualToThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DECIMAL_MIDDLE)
                .shouldBeLessThanOrEqualTo(DECIMAL_LOWEST);
        }
        protected override void testCase(String message) {
            Expect.that(DECIMAL_MIDDLE)
                .shouldBeLessThanOrEqualTo(DECIMAL_LOWEST, message);
        }
    }

    @IsTest
    static void ExpectShouldBeLessThanOrEqualToThrowsDefaultMessage() {
        new ShouldBeLessThanOrEqualToThrows()
            .verifyMessage(
                'Expected ' +
                DECIMAL_MIDDLE_S +
                ' should be less than or equal to ' +
                DECIMAL_LOWEST_S
            );
    }

    @IsTest
    static void ExpectShouldBeLessThanOrEqualToThrowsCustomMessage() {
        new ShouldBeLessThanOrEqualToThrows().verifyCustomMessage('too high');
    }

    @IsTest
    static void ExpectShouldBeGreaterThanDoesNotThrow() {
        Expect.that(DECIMAL_MIDDLE).shouldBeGreaterThan(DECIMAL_LOWEST);
    }

    private class ShouldBeGreaterThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DECIMAL_LOWEST).shouldBeGreaterThan(DECIMAL_MIDDLE);
        }
        protected override void testCase(String message) {
            Expect.that(DECIMAL_LOWEST)
                .shouldBeGreaterThan(DECIMAL_MIDDLE, message);
        }
    }

    @IsTest
    static void ExpectShouldBeGreaterThanThrowsDefaultMessage() {
        new ShouldBeGreaterThanThrows()
            .verifyMessage(
                'Expected ' +
                DECIMAL_LOWEST_S +
                ' should be greater than ' +
                DECIMAL_MIDDLE_S
            );
    }

    @IsTest
    static void ExpectShouldBeGreaterThanThrowsSpecificMessage() {
        new ShouldBeGreaterThanThrows().verifyCustomMessage('too low');
    }

    @IsTest
    static void ExpectShouldBeGreaterThanOrEqualToDoesNotThrow() {
        Expect.that(DECIMAL_MIDDLE)
            .shouldBeGreaterThanOrEqualTo(DECIMAL_LOWEST);
        Expect.that(DECIMAL_LOWEST)
            .shouldBeGreaterThanOrEqualTo(DECIMAL_LOWEST);
    }

    private class ShouldBeGreaterThanOrEqualToThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DECIMAL_LOWEST)
                .shouldBeGreaterThanOrEqualTo(DECIMAL_MIDDLE);
        }
        protected override void testCase(String message) {
            Expect.that(DECIMAL_LOWEST)
                .shouldBeGreaterThanOrEqualTo(DECIMAL_MIDDLE, message);
        }
    }

    @IsTest
    static void ExpectShouldBeGreaterThanOrEqualToThrowsDefaultMessage() {
        new ShouldBeGreaterThanOrEqualToThrows()
            .verifyMessage(
                'Expected ' +
                DECIMAL_LOWEST_S +
                ' should be greater than or equal to ' +
                DECIMAL_MIDDLE_S
            );
    }

    @IsTest
    static void ExpectShouldBeGreaterThanOrEqualToThrowsSpecificMessage() {
        new ShouldBeGreaterThanOrEqualToThrows().verifyCustomMessage('too low');
    }

    @IsTest
    static void ExpectShouldBeBetweenDoesNotThrow() {
        Expect.that(DECIMAL_MIDDLE)
            .shouldBeBetween(DECIMAL_MIDDLE, DECIMAL_HIGHEST);
        Expect.that(DECIMAL_MIDDLE)
            .shouldBeBetween(DECIMAL_LOWEST, DECIMAL_MIDDLE);
        Expect.that(DECIMAL_MIDDLE)
            .shouldBeBetween(DECIMAL_LOWEST, DECIMAL_HIGHEST);
        Expect.that(DECIMAL_MIDDLE)
            .shouldBeBetween(DECIMAL_HIGHEST, DECIMAL_MIDDLE);
    }

    private class ShouldBeBetweenThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DECIMAL_LOWEST)
                .shouldBeBetween(DECIMAL_MIDDLE, DECIMAL_HIGHEST);
        }
        protected override void testCase(String message) {
            Expect.that(DECIMAL_LOWEST)
                .shouldBeBetween(DECIMAL_MIDDLE, DECIMAL_HIGHEST, message);
        }
    }

    @IsTest
    static void ExpectShouldBeBetweenThrowsThrowsDefaultMessage() {
        new ShouldBeBetweenThrows()
            .verifyMessage(
                'Expected ' +
                DECIMAL_LOWEST_S +
                ' should be between ' +
                DECIMAL_MIDDLE_S +
                ' and ' +
                DECIMAL_HIGHEST_S
            );
    }

    @IsTest
    static void ExpectShouldBeBetweenThrowsSpecificMessage() {
        new ShouldBeBetweenThrows()
            .verifyCustomMessage('outside allowed range');
    }

    private class ShouldNotBeBetweenThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DECIMAL_MIDDLE)
                .negated.shouldBeBetween(DECIMAL_LOWEST, DECIMAL_HIGHEST);
        }
        protected override void testCase(String message) {
            Expect.that(DECIMAL_MIDDLE)
                .negated.shouldBeBetween(
                    DECIMAL_LOWEST,
                    DECIMAL_HIGHEST,
                    message
                );
        }
    }

    @IsTest
    static void ExpectShouldNotBeBetweenThrowsThrowsDefaultMessage() {
        new ShouldNotBeBetweenThrows()
            .verifyMessage(
                'Expected ' +
                DECIMAL_MIDDLE_S +
                ' should not be between ' +
                DECIMAL_LOWEST_S +
                ' and ' +
                DECIMAL_HIGHEST_S
            );
    }

    @IsTest
    static void ExpectShouldNotBeBetweenThrowsSpecificMessage() {
        new ShouldNotBeBetweenThrows()
            .verifyCustomMessage('outside allowed range');
    }

    @IsTest
    static void ExpectIntegerChains() {
        Expect.that(DECIMAL_LOWEST)
            .shouldBeLessThan(DECIMAL_MIDDLE)
            .andIt.shouldEqual(DECIMAL_LOWEST);
    }
}
