Given is a number. 
Write a program to compute the sum of all the prime numbers less than the given number.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const number = 100
// Write code here
</code>
<solution>
const number = 100;

const sumOfPrime = (inputNumber) => {
    let sum = 0;

    for (let i = 2; i < inputNumber; i++) {
        let isPrime = true;
        for (let j = 2; j <= Math.sqrt(i); j++) {
            if (i % j === 0) {
                isPrime = false;
                break;
            }
        }
        if (isPrime) {
            sum += i;
        }
    }
    return sum;
};

sumOfPrime(number);
</solution>
<testcases>
<caller>
console.log(sumOfPrime(testNumber));
</caller>
<testcase>
<i>
const testNumber = 250;
</i>
</testcase>
<testcase>
<i>
const testNumber = 1000;
</i>
</testcase>
<testcase>
<i>
const testNumber = 381;
</i>
</testcase>
<testcase>
<i>
const testNumber = 620;
</i>
</testcase>
</testcases>
</codeblock>
