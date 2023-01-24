- The **private** keyword is an access modifier which declares a member's access as private.
- It makes them only accessible within the declared class.
- That is, the member is only visible within the declared class, not from any other class (including subclasses). 
- The visibility of private extends to nested classes.
- It is also used for attributes, methods and constructors.

## A few points to remember:
- We can't assign private to outer class and interface.
- The best use of private keyword is to create a fully encapsulated class in Java by making all the data members of that class private.
- If we make any class constructor private, we cannot create the instance of that class from outside the class.
- If we are overriding any method, overridden method (i.e., declared in the subclass) must not be more restrictive.
- According to the previous point, if we assign a private modifier to any method or variable, that method or variable can be overridden to sub-class using all type of access modifiers. However, still, we can't invoke private method outside the class.

## Example
<codeblock language="java" type="lesson">
  <code>

    public class Main {
      private String fname = "John";
      private String lname = "Doe";
      private String email = "john@doe.com";
      private int age = 24;

      public static void main(String[] args) {
        Main myObj = new Main();
        System.out.println("Name: " + myObj.fname + " " + myObj.lname);
        System.out.println("Email: " + myObj.email);
        System.out.println("Age: " + myObj.age);
      }
    }

    // Following will throw an error, uncomment to familiarize.
    /*
    class Test {
      public static void main(String[] args) {
        Main myObj = new Main();
        System.out.println("Name: " + myObj.fname + " " + myObj.lname);
        System.out.println("Email: " + myObj.email);
        System.out.println("Age: " + myObj.age);
      }
    }
    */
  </code>
</codeblock>
