Finish the method definition below.

`department_newsletter_list` is a hash with department names as keys and an array of newsletter titles as values. Given `department_newsletter_list` and a list of department names `department_names_list`, the method should return an alphabetically sorted single dimensional array of newsletters of the given departments in the `department_names_list`.

If none of departments specified in `department_names_list` are present in `department_newsletter_list`, then the method should return `false`.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def newsletter_list(department_newsletter_list, department_names_list)
  # Write your code here
end
</code>

<solution>
def newsletter_list(department_newsletter_list, department_names_list)
  list = []
  department_names_list.each do |department_name|
    if department_newsletter_list.has_key? department_name
      list << department_newsletter_list[department_name.to_sym]
    end
  end

  list.empty? ? false : list.flatten.sort
end
</solution>

<testcases>
<caller>
department_newsletter_list = {
  Programming: ['frontend', 'backend', 'database', 'javascript', 'ruby'],
  QA: ['unit testing', 'regression testing', 'alpha testing', 'beta testing'],
  Marketing: ['outbound', 'inbound', 'digital', 'content', 'video'],
  Sales: ['inside', 'outside', 'client services', 'lead generation']
}
puts newsletter_list(department_newsletter_list, department_names_list)
</caller>
<testcase>
<i>
department_names_list = ['Programming', 'QA']
</i>
</testcase>
<testcase>
<i>
department_names_list = ['Sales', 'Marketing']
</i>
</testcase>
<testcase>
<i>
department_names_list = ['Design', 'Programming']
</i>
</testcase>
<testcase>
<i>
department_names_list = ['HR', 'Product Management']
</i>
</testcase>
</testcases>
</codeblock>
