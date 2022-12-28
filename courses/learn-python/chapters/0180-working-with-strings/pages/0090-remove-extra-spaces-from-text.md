There might be times when we will receive a text which is not properly formatted and has extra spaces or escape characters like newline around it. Python provides an inbuilt string method `.strip()` to remove these spaces and newlines.

<codeblock language="python" type="lesson">
<code>
text = "  Cooper, this is no time for caution.  \n\n"
print(text.strip())
</code>
</codeblock>