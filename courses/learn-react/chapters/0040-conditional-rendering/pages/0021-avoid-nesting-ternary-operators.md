Nesting ternary operators can often lead to poor code readability. If you have a block of code as shown below:

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = ({ isLoading, isAdmin, name, imageSource }) => {
  return (
    isLoading ? (
      <Loader />
    ):(
      isAdmin? (
        <div className="profilePicture">
          Admin: {name}
          <img src={imageSource} alt="adminPicture"/>
        </div>
      ) : (
        <div className="profileBasic">{name}</div>
      )
    )
  )
}
```

As a rule of thumb, it's often best to just use a couple of guard clauses to improve readability like this:

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = ({ isLoading, isAdmin, name, imageSource }) => {
  if(isLoading) return <Loader />
  if(!isAdmin) return <div className="profileBasic">{name}</div>

  return (
    <div className="profilePicture">
      Admin: {name}
      <img src={imageSource} alt="adminPicture"/>
    </div>
  )
}
```

This isn't to say that nested ternary operators are always bad.

They can sometimes improve code readability over the alternatives like when you're nested inside JSX as shown below :

```jsx
const notification = ({type, sender, code, message}) => (
  <NotificationBase>
    {(type == ALERT) ? (
      <AlertNotification type={type}/>
    ) : (type == MESSAGE) ? (
      <MessageNotification sender={sender} message={message} />
    ) : (type == SURVEY) ? (
      <SurveyNotification type={type} code={code} />
    ) : null}
  </NotificationBase>
)
```

But in most cases, avoid nesting ternary operators.
