- Public is a **Java** access modifier which declares a member's access as public.
- It is visible to all other classes in the Java universe.
- Public can be assigned to variables, methods and fields.
- It can also specify how to access classes, methods and fields.
- Other classes can modify public fields unless the field is declared as final.

## A few points to remember:
1. Everything that is declared as public can be accessed everywhere, this means it can be accessed from:
  - Inside a class.
  - Inside a package.
  - Outside a class.
  - Outside a package.
2. If a program contains multiple classes, at most one class can be assigned as public.
3. If a class is public, the name of the program should be the same as that of the public class name.


## Example
<codeblock language="java" type="lesson">
  <code>
    class Data {
      public String fname = "John";
      public String lname = "Doe";
      public String email = "john@doe.com";
      public int age = 24;
    }

    class Main {
      public static void main(String[] args) {
        Data myObj = new Data();
        System.out.println("Name: " + myObj.fname + " " + myObj.lname);
        System.out.println("Email: " + myObj.email);
        System.out.println("Age: " + myObj.age);
      }
    }
  </code>
</codeblock>
