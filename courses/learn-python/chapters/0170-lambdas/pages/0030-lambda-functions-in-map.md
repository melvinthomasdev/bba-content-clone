Lambda functions are generally useful when using functions like `map()`. The `map()` function takes in a list and returns its modified version based on some criteria. This criterion is passed to it as a function.

<codeblock language="python" type="lesson">
<code>
circle_radii = [5, 10, 34, 54, 67]
circle_areas = list(map(lambda x: 3.14 * x * x, circle_radii))
print(circle_areas)
</code>
</codeblock>

A Lambda function is used here to calculate the area of each radius in `circle_radii`. The Lambda function, which calculates the circle area, is passed to `map()` as its first argument, along with the `circle_radii` list. `map()` iterates through `circle_radii` and passes every radius to the Lambda function which returns its area.