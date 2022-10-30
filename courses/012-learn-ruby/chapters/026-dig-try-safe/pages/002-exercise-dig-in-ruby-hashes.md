Get the **hex_value** of the colour
**blue** using `dig`.

<Editor lang="ruby" type="exercise">
<code>
colour_theme = {
    primary_choice: [
        {
          name: "red",
          hex_value: "#ff5555"
        },
        {
          name: "blue",
          hex_value: "#3333ff"
        }
    ],
    fallback: [
      "snow", "gold", "teal"
    ]
}

# Write your code below this

puts
</code>

<solution>
colour_theme = {
    primary_choice: [
        {
          name: "red",
          hex_value: "#ff5555"
        },
        {
          name: "blue",
          hex_value: "#3333ff"
        }
    ],
    fallback: [
      "snow", "gold", "teal"
    ]
}

# Write your code below this

puts colour_theme.dig(:primary_choice, 1, :hex_value)
</solution>
</Editor>