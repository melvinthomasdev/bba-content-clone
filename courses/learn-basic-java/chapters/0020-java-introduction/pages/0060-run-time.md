<div>
  <img src="compile-time.png" alt="Compile Time" />
</div>

# J.V.M execution
## Interpreter
- Line by line execution of translated machine code.
- When one method is called repeatedly, it will interpret repeatedly.

# J.I.T execution
- Those methods that are repeated, J.I.T provides direct machine code so re-interpretation is not required.
- Makes code execution faster.
# Class Loader
## Loading
- Reads `.class` file and generates binary data.
- An object of this class is created in the heap memory.

## Linking
- J.V.M. verifies the `.class` file using **Byte Code Verifier**.
- It allocates the memory for class variables and default values.
- It also replaces symbolic references from type with direct references.

## Initialization
- All static variables are assigned with their values defined in the code and static block.
- J.V.M. contains the stack and heap memory allocations.

# Runtime
- Runtime is the period between the start and end of running intermediate code at runtime environment.
- A program’s life cycle is in runtime when the program is in execution.
- Runtime generally occurs after compile time.
- Fixing an error in runtime needs going back to the source code.
