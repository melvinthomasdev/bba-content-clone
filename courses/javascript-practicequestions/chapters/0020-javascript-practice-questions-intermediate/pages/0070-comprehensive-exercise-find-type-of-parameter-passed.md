The function `findType` should return the type of the parameters passed.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const findType = parameter => // write your code here
</code>

<solution>
const findType = parameter => typeof parameter
</solution>

<testcases>
<caller>
console.log(findType(parameter));
</caller>
<testcase>
<i>
parameter = 221;
</i>
</testcase>
<testcase>
<i>
parameter = hello = () => {
    return true
};
</i>
</testcase>
<testcase>
<i>
parameter = 'BigBinary';
</i>
</testcase>
<testcase>
<i>
parameter = true;
</i>
</testcase>
<testcase>
<i>
parameter = [
    {
        "name": "Miami",
        "state": "Florida"
    },
    {
        "name": "Pune",
        "state": "Maharashtra"
    },
    {
        "name": "Kochi",
        "state": "Kerala"
    }
];
</i>
</testcase>
</testcases>
</codeblock>