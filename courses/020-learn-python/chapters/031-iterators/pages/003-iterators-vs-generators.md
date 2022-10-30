Iterators are similar to Generators. They provide the result only when required. There are some mild differences among them. However, their purpose is the same and they function the same way as generators.

| Iterators                                                   | Generators                                                        |
|-------------------------------------------------------------|-------------------------------------------------------------------|
| Iterators use classes                                       | Generators use functions                                          |
| Iterators use the `__next__` and `__iter__` methods             | Generators use the `yield` keyword                                  |
| Iterators maintain state within instance attributes         | Generators store state in local function variables                |
| No methods are paused. State is maintained within instance. | Functions are paused and their state is maintained within Python. |
| Can be created using iter()                                 | Can be created using `function()`                                   |

