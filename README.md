# Maestro mobile tests (demo)

iOS tests for My Demo App 2.3.0, a public practice app from Sauce Labs (https://github.com/saucelabs/my-demo-app-ios). Last run: iPhone 16 Pro simulator, iOS 18.6.

- `flows/`: 4 regression flows (catalog, cart total, login before checkout, address validation). All pass.
- `guards/`: 2 deliberately wrong checks. They must fail on an assertion, which shows the checks can catch a problem.
- `known-bugs/`: 1 real defect, expected to fail until it is fixed.

Run: install Maestro, boot a simulator, install the app's Simulator build, then

    ./run.sh <simulator id>

## Defect: cart shows the wrong colour

1. From a clean start, open "Sauce Labs Backpack - Black".
2. Tap Add To Cart without choosing a colour, then open the cart.

Expected: the colour matches the black backpack. Actual: the cart says "Color: Green". Evidence: `results/cart-colour.png`.

Observation, not a confirmed defect: the cart is empty after the app is stopped and reopened. The intended behaviour is not documented.

Not covered: Android, real devices, payment and order completion.

Independent demo, not client work. Not affiliated with Sauce Labs.
