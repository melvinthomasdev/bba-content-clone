When developing JavaScript applications,
we often face a common challenge where
modifications vanish after a page refresh.

Let's look at an example:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html" hidden=true>
  <h1>To-Do List</h1>
  <input type="text" id="newTask" placeholder="Enter a new task">
  <button id="addTaskButton">Add Task</button>

  <ul id="tasks"></ul>
</panel>
<panel language="css" hidden=true>
body {
  font-family: Arial, sans-serif;
  text-align: center;
  height: 100vh;
  padding: 0 100px;
}

#tasks {
  list-style-type: none;
  padding: 0;
}

li {
  margin: 10px 0;
  display: flex;
  justify-content: space-between;
}

.completed {
  text-decoration: line-through;
  color: #888;
}
</panel>
<panel language="javascript" hidden=true>
let tasks = [];

document.getElementById('addTaskButton').addEventListener('click', function() {
  addTask();
});

function addTask() {
  const newTaskInput = document.getElementById('newTask');
  const taskText = newTaskInput.value.trim();

  if (taskText === '') {
    alert('Please enter a valid task.');
    return;
  }

  tasks.push({ text: taskText, completed: false });
  updateTaskList();
  newTaskInput.value = '';
}

function updateTaskList() {
  const tasksList = document.getElementById('tasks');
  tasksList.innerHTML = '';

  tasks.forEach((task, index) => {
    const listItem = document.createElement('li');
    listItem.className = task.completed ? 'completed' : '';

    const checkbox = document.createElement('input');
    checkbox.type = 'checkbox';
    checkbox.checked = task.completed;
    checkbox.addEventListener('change', () => toggleTaskCompletion(index));

    const taskText = document.createTextNode(task.text);

    const deleteButton = document.createElement('button');
    deleteButton.textContent = 'Delete';
    deleteButton.addEventListener('click', () => deleteTask(index));

    listItem.appendChild(checkbox);
    listItem.appendChild(taskText);
    listItem.appendChild(deleteButton);

    tasksList.appendChild(listItem);
  });
}

function toggleTaskCompletion(index) {
  tasks[index].completed = !tasks[index].completed;
  updateTaskList();
}

function deleteTask(index) {
  tasks.splice(index, 1);
  updateTaskList();
}
</panel>
</code>
</codeblock>

In the above example, try adding a few tasks
to the to-do list and then refresh the page.
Upon refreshing the page,
you'll notice that the to-do list items are lost.
The remedy to this issue lies in **localStorage**,
a persistent web storage object that allows us
to store **key/value** pairs in the browser.

**localStorage** remains saved in the browser
and persists even when the page is refreshed or
when the browser is closed and reopened.
