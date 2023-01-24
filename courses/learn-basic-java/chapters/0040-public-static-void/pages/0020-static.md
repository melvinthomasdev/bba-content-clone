- The **static** keyword in Java is a non-access modifier used for methods and attributes.
- It is mainly used for memory management. 
- The static keyword in Java is used to share the same variable or method of a given class. 
- The users can apply static keywords with variables, methods, blocks, and nested classes. 
- The static keyword belongs to the class than an instance of the class. 
- The static keyword is used for a constant variable or a method that is the same for every instance of a class.

## A few points to remember:
1. The static keyword is a non-access modifier in Java that is applicable for the following: 
  - Blocks
  - Variables
  - Methods
  - Classes
2. We can create static variables at the class level only.
3. Static block and static variables are executed in the order they are present in a program.

<codeblock language="java" type="lesson">
  <code>
    public class Main {
      // Static method
      static void myStaticMethod() {
      System.out.println("Static methods can be called without creating objects");
    }

    // Public method
    public void myPublicMethod() {
      System.out.println("Public methods must be called by creating objects");
    }

    // Main method
    public static void main(String[ ] args) {
      // Calling the static method
      myStaticMethod();

      // Calling the public method directly. This would output an error, uncomment to familiarize.
      // myPublicMethod(); 

      // Creating an object of Main.
      Main myObj = new Main(); 
      // Calling the public method via the new object. This shouldn't throw an error.
      myObj.myPublicMethod(); 
    }
   }
  </code>
</codeblock>
