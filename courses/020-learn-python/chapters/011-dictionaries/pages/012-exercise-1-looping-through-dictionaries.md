You are in charge of displaying the show timings of movies for the day in a cinema hall. Given below is a dictionary of Movies along with the screening time.

Use a for loop to iterate through the `movie_timings` dictionary and print each movie's show time in the following manner:

**Movie: `movie name` \| Screening Time: `time`**

<Editor lang="python" type="exercise">
<code>
# Print movie timings in the format given using a for loop.

movie_timings = {
  'Cars 2': '10:30 AM',
  'Titantic': '01:00 PM',
  'Mission Impossible 5': '09:30 PM',
}
</code>

<solution>
# Print movie timings in the format given using a for loop.

movie_timings = {
  'Cars 2': '10:30 AM',
  'Titantic': '01:00 PM',
  'Mission Impossible 5': '09:30 PM',
}

for movie, time in movie_timings.items():
  print(f"Movie: {movie} | Screening Time: {time}")
</solution>
</Editor>