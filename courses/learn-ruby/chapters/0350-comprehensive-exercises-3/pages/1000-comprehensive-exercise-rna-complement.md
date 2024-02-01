Finish the method definition given below.

Given a string `str` representing a ribonucleic acid (RNA) strand, the method `rna_complement` should return the reverse complement of the string.

The `str` RNA will be represented as a string containing only the characters "A", "C", "G" and "U". Since RNA can only (canonically) allow pairings of A/U and G/C, the complement of an RNA would be as follows:
  - 'AAA' would be 'UUU' and 'UUU' would be 'AAA'
  - 'GGG' would be 'CCC' and 'CCC' would be 'GGG'

Finally the function should reverse the string obtained till now by complementing RNA and return it.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def rna_complement(str)
  # Write your code here
end
</code>

<solution>
def rna_complement(str)
  str.reverse.tr('AUGC', 'UACG' )
end
</solution>

<testcases>
<caller>
puts rna_complement(str)
</caller>
<testcase>
<i>
str = 'GAGGC'
</i>
</testcase>
<testcase>
<i>
str = 'UCUCG'
</i>
</testcase>
<testcase>
<i>
str = 'CAGGU'
</i>
</testcase>
<testcase>
<i>
str = 'UAUUUUUCCA'
</i>
</testcase>
<testcase>
<i>
str = 'GUAGGCAACA'
</i>
</testcase>
<testcase>
<i>
str = 'UAGCUAAAUC'
</i>
</testcase>
<testcase>
<i>
str = 'AUGAGCGUAC'
</i>
</testcase>
<testcase>
<i>
str = 'UUAUACCCGAGUCGGAUUUGUCACU'
</i>
</testcase>
</testcases>
</codeblock>