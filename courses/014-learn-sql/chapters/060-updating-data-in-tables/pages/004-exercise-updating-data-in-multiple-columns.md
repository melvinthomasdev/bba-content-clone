We have a table `books` below. Write an SQL statement to:

1. set `price` as NULL

2. add `'Sold Out - '` in the beginning of the `name`

3. update `publisherName` to `HYDRA Corp.`
<br><br>

for all the `books` whose `publisherName` is `HYDRA Inc.`

`Note`: If you want to add `'Prefix - '` to values in a column x, add `x = 'Prefix - ' || x` in the `SET` list.



<Editor lang="sql" dbName="students3-v4.db" focusTableAfterRun="books" type="exercise">
<code>
UPDATE
SET
WHERE
</code>

<solution>
UPDATE books
SET    price = NULL,
       publisherName = 'HYDRA Corp.',
       name = 'Sold Out - ' || name
WHERE  publisherName = 'HYDRA Inc.'
</solution>
</Editor>