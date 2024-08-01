Complete the method definition given below.

Given a coded message `message` and a key, the method should decipher the code and return the decoded message back. The decoding rules are:

1. Not all words in the coded message are part of the decoded message.
2. Each word in the message will have a number as prefix.
3. Any word that has a prefix number that is perfectly divisible by the key, then the word following the prefix number is part of the decoded message.
4. The final decoded message will be returned as a string.
5. Ensure there are no unnecessary trailing or leading whitespaces.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def enigma_function(message, key)
  # Write your code here
end
</code>

<solution>
def enigma_function(message, key)
  words = message.split(" ")
  decoded_message = ""

  words.each do |word|
    decoded_message += " #{word}" if word.to_i % key == 0
  end

  decoded_message.gsub(/[0-9]/, '').strip
end
</solution>

<testcases>
<caller>
puts enigma_function(message, key)
</caller>
<testcase>
<i>
key = 13
message = '12The 908happy 468party 208troops 333will 124never 42fail 936to 761move 202my 765heart. 412This 297happened 1040again 64in 70the 17Coffee 780Shop 208today 55at 210sunset 99time. 321I 3want 2to 404visit 3all 313of 416the 99seven 23wonders 3123of 21the 09world'
</i>
</testcase>
</testcases>
</codeblock>
