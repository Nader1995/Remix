
# Hooks:
Here I regularly upload some crucial tips on hooks in React:

# setState:

+ Allows you to have state variables in functions
+ You pass initial values, and it returns a variable with the initial value and a function to update that value
+ It renders the view with each click

- const [value, setValue] = useState(initialValue);

# setEffect:

+ Performs side effects
+ Runs on the first render and anytime any devepndecy value changes

- useEffect(<function>, <dependency>);


