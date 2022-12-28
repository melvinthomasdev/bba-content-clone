The Mi6 intelligence agency in Britain is assigning numeric codes to its operatives. The agency follows a coding scheme wherein the numeric code is prefixed with a `00`.

Given below are print statements containing f-strings with the operative name and their respective code. Your task is to pad the codes with a 00 using the String formatting syntax.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Pad the codes given below with 00 using String formatting syntax
# i.e Elena Williams    005

print("Operative \t\t Code")
print("-----------------------------")
print(f"Elena Williams \t\t 5")
print(f"Catherine Smith \t 6")
print(f"James Bond \t\t 7")
</code>

<solution>
print("Operative \t\t Code")
print("-----------------------------")
print(f"Elena Williams \t\t {5:03d}")
print(f"Catherine Smith \t {6:03d}")
print(f"James Bond \t\t {7:03d}")
</solution>
</codeblock>