Nested configuration involves
configurations within other
configurations, creating a
hierarchical structure of settings.

This lesson focuses on nested
hash configuration. However,
nested configurations can also
be created using other objects
such as classes or arrays.

To better understand this concept,
let's consider an example of a game
with multiple settings.

<codeblock language="ruby" type="lesson">
<code>
game_config = {
  player: {
    name: "John",
    level: 10,
    health: 100
  },
  world: {
    difficulty: "hard",
    size: "large"
  },
  graphics: {
    resolution: "1920x1080",
    quality: "high"
  }
}

puts game_config
</code>
</codeblock>

In the code above, `game_config`
utilizes hashes, which are 
key-value pairs.

We create a hash for each level
of configuration and arrange
them within each other as needed.
