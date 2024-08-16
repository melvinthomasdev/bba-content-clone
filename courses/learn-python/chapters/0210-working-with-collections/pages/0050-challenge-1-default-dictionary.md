Sunita is sorting her favorite songs by Artists. She has a list of songs along with the artist's name in the format of **song_name-artist_name**.

Help her group the songs by artists into a dictionary `{ artist: [son1, song2] }`. Use a `defaultdict` with a default value as a `list`. Print the dictionary.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Group songs by Artist name.
# Use .split() to split the song and artist names
# Use defaultdict to store the result

favorite_songs = ["Not Afraid-Eminem", "Hotel California-Eagles", "I have a dream-ABBA",
                  "Desperado-Eagles", "Dancing Queen-ABBA", "Space Bound-Eminem", "Chiquitita-ABBA"]
</code>

<solution>
# Group songs by Artist name.
# Use .split() to split the song and artist names
# Use defaultdict to store the result

from collections import defaultdict

favorite_songs = ["Not Afraid-Eminem", "Hotel California-Eagles", "I have a dream-ABBA",
                  "Desperado-Eagles", "Dancing Queen-ABBA", "Space Bound-Eminem", "Chiquitita-ABBA"]

artist_songs = defaultdict(list)

for song in favorite_songs:
  song, artist = song.split('-')
  artist_songs[artist].append(song)

print(artist_songs)
</solution>
</codeblock>