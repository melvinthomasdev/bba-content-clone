Finish the method definition below.

The method `format_elapsed_seconds` should convert the given elapsed number of seconds to a format of `hours:minutes:seconds`.

For example, given `3670` as input, the output should be `1:1:10`. This is because 3670 can be expressed as 1 hour (3600s), 1 minute (60s) and 10 seconds.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def format_elapsed_seconds(elapsed_seconds)
  # Write your code here
end
</code>

<solution>
def format_elapsed_seconds(elapsed_seconds)
  hours = (elapsed_seconds / 3600).to_i
  minutes = ((elapsed_seconds / 60) % 60).to_i
  seconds = (elapsed_seconds % 60).to_i

  "#{ hours }:#{ minutes }:#{ seconds }"
end
</solution>

<testcases>
<caller>
puts format_elapsed_seconds(elapsed_seconds)
</caller>
<testcase>
<i>
elapsed_seconds = 3670
</i>
</testcase>
<testcase>
<i>
elapsed_seconds = 670
</i>
</testcase>
<testcase>
<i>
elapsed_seconds = 545
</i>
</testcase>
<testcase>
<i>
elapsed_seconds = 50
</i>
</testcase>
<testcase>
<i>
elapsed_seconds = 9834
</i>
</testcase>
</testcases>
</codeblock>
