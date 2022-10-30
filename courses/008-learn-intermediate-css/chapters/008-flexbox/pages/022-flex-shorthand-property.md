You can set `flex-grow`,
`flex-shrink` and `flex-basis`
with one single shorthand
`flex` property.

This can take one,
two or three values
separated by spaces:

```
flex: <flex-grow> <flex-shrink> <flex-basis>
```

## Three values

```
flex: 1 1 auto;
```

`flex-grow` is 1<br>
`flex-shrink` is 1<br>
`flex-basis` is auto

<Editor lang="css">
<code>
<panel lang="html">
<div class="container">
  <div id="first">
  </div>
  <div id="second">
  </div>
</div>
</panel>
<panel lang="css">
.container {
  display: flex;
}
.container > div {
  padding:30px;
}
#first {
  background-color: teal;
  flex: 1 1 auto;
}
#second {
  background-color: orange;
}
</panel>
</code>
</Editor>

##Two values - Both without units

```
flex: 0 1;
```

`flex-grow` is 0<br>
`flex-shrink` is 1<br>
`flex-basis` not specified

<Editor lang="css">
<code>
<panel lang="html">
<div class="container">
  <div id="first">
  </div>
  <div id="second">
  </div>
</div>
</panel>
<panel lang="css">
.container {
  display: flex;
}
.container > div {
  padding: 30px;
}
#first {
  background-color: teal;
  flex: 0 1;
}
#second {
  background-color: orange;
}
</panel>
</code>
</Editor>

## Two values - One without units and another with units

```
flex: 0 100px;
```

`flex-grow` is 0<br>
`flex-shrink` is not specified<br>
`flex-basis` is 100px

<Editor lang="css">
<code>
<panel lang="html">
<div class="container">
  <div id="first">
  </div>
  <div id="second">
  </div>
</div>
</panel>
<panel lang="css">
.container {
  display: flex;
}
.container > div {
  padding: 30px;
}
#first {
  background-color: teal;
  flex: 0 100px;
}
#second {
  background-color: orange;
}
</panel>
</code>
</Editor>

## One value - Without units

```
flex: 2;
```

`flex-grow` is 2<br>
`flex-shrink` is not specified<br>
`flex-basis` is not specified

<Editor lang="css">
<code>
<panel lang="html">
<div class="container">
  <div id="first">
  </div>
  <div id="second">
  </div>
</div>
</panel>
<panel lang="css">
.container {
  display: flex;
}
.container > div {
  padding: 30px;
}
#first {
  background-color: teal;
  flex: 2;
}
#second {
  background-color: orange;
  flex: 1;
}
</panel>
</code>
</Editor>

## One value - With units

```
flex: 50%;
```

`flex-grow` is not specified<br>
`flex-shrink` is not specified<br>
`flex-basis` is 50%

<Editor lang="css">
<code>
<panel lang="html">
<div class="container">
  <div id="first">
  </div>
  <div id="second">
  </div>
</div>
</panel>
<panel lang="css">
.container {
  display: flex;
}
.container > div {
  padding: 30px;
}
#first {
  background-color: teal;
  flex: 50%;
}
#second {
  background-color: orange;
  flex: 50%;
}
</panel>
</code>
</Editor>