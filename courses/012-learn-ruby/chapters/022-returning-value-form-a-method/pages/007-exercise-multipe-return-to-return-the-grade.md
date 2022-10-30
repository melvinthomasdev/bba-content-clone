Students are taking Maths test and you need to write a program which will assign a grade to their score
based on the given criteria. If the score is 80 or more than 80 then assign grade "A".
If the score is 60 or more than 60 but less than 80 then assign grade "B".
If the score is 30 or more than 30 but less than 60 then assign grade "C".
If the score is less than 30 then assign grade "D".

You need to use four return statements to accomplish this task.

<Editor lang="ruby" type="exercise">
<code>
class GradeAssigner
  def grade(score)
  end
end

assigner = GradeAssigner.new
puts assigner.grade(60)
</code>

<solution>
class GradeAssigner
  def grade(score)
    return "A" if score >= 80 && score <= 100
    return "B" if score >= 60 && score < 80
    return "C" if score >= 30 && score < 60
    return "D" if score < 30
  end
end

assigner = GradeAssigner.new
puts assigner.grade(60)
</solution>
</Editor>