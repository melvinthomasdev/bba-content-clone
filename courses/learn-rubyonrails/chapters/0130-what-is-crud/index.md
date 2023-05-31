In the software development world, CRUD consists of four operations - create,
read, update, and delete.

- **Create**: This operation would create a brand new entity. In terms of
  database, this would be `INSERT` statement.
- **Read**: This operation would read something from the database and would not
  make any permanent changes to the database. In terms of database, this would
  be a `READ` operation.
- **Update**: This operation would change an already existing entity. In terms
  of database it would be an `UPDATE` operation.
- **Delete**: This operation would delete an entity. In terms of database this
  would be a `DELETE` operation.

## CRUD in action

In Rails each `resource` typically performs these seven operations:

| VERB   | URI Pattern     | Controller#Action | Used for               | Operation |
| ------ | --------------- | ----------------- | ---------------------- | --------- |
| GET    | /books          | books#index       | List books             | READ      |
| POST   | /books          | books#create      | Create a book          | CREATE    |
| GET    | /books/new      | books#new         | Form for a new book    | READ      |
| GET    | /books/:id/edit | books#edit        | Form for editing book  | READ      |
| GET    | /books/:id      | books#show        | Show info about book   | READ      |
| PATCH  | /books/:id      | books#update      | Update info about book | UPDATE    |
| PUT    | /books/:id      | books#update      | Update info about book | UPDATE    |
| DELETE | /books/:id      | books#destroy     | Delete info about book | DELETE    |

As we can see each of those seven actions could be assigned to one of these four
operations - Create, Read, Update and Delete.

## REST and CRUD

REST is an architectural system that deals with data through HTTP protocols.
More info about REST is
[here](https://en.wikipedia.org/wiki/Representational_state_transfer).

Typically software applications create RESTful APIs to handle CRUD operations.
More info about CRUD operations is
[here](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete).

There aren't any changes to the application in this chapter. So let us clean up
any accidental changes.

```bash
git clean -fd
```
