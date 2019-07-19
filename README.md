
Summary
-------

In this phase of the project, I implement the value numbering algorithm on top of LLVM. In a nutshell, the implementation assigns a value to each operand and expression and stores them in a hashmap. The hashmap is the map data structure in the C++. Before storing the values, the algorithm checks whether the value already exists in the hashmap. If such case occurs for expressions, the algorithm reports that there is a redundancy. In the rest of this report, I explain the compilation technical details, hashmap implementation, obtaining the operands, the algorithm as a whole and finally the results.

Compilation
-----------
If _cmake_ uses _gcc_ and _g++_ for compilation and you get the "symbol not found error", pass the compiler path for c and c++. More specifically, use:
-CMAKE\_C\_COMPILER:FILEPATH and -CMAKE\_CXX\_COMPILER:FILEPATH options.

Hashmap implementation
----------------------

I store the values assigned to operands and expressions in a hashmap. The hashmap is implemented using the std::map data structure:

       std::map<std::string,  int \> hashTable;

Further, I implemented a method that updates the hashmap based on a given string. The string can be a single operand or an expression. The method first searches the string in the hashmap, and if not existed it adds the string to the hashmap. The value for the input string is a number that is incremented every time a <key,value> is inserted into the hashmap. The following is the implementation:

        int  addOrFindHashTable(std::string  op, bool   found){

         auto  search = hashTable.find( op);

         auto  retVN = VN;

         if  (search != hashTable.end()){

           found =  true ;

           retVN = search->second;

         }

         else {

           found =  false ;

           hashTable.insert(std::pair<std::string, int \>(op,VN++));

        }

       return  retVN;

      }

Operands retrieval
------------------

I implement the value numbering for binary operations as requested in the project description. Every binary instruction in LLVM has two source operands and one destination operand.

### Obtaining source operands

The source operands can be accessed by casting a _LLVM instruction_ to _User_ and iterating over the _Use_ objects. The source operand can be a variable or a constant. A variable name can be obtained using _getName_ method, and a source constant can be retrieved by casting the _Use_ object to _ConstantInt_ object and calling _getValue_ method. The following method retrieves a source operand covering both cases:

 void  getValueName(Use  it, std::string  op){        
        if  (( it)->hasName()){
               op = ( it)->getName();
        }
        else  {
         if  (isa<ConstantInt>(it)){
               auto   constantVal = dyn\_cast<ConstantInt>(it);
               op = constantVal->getValue().toString(10,1);
        }
          else {
               errs() << "neither has name nor it is constant\\n";
               op = "";
          }
        }
}

### Obtaining destination operand

The destination operand for a binary instruction can be retrieved by casting it to a _Value_ object. Below is the code snippet to achieve it:

           auto   val = dyn\_cast<Value>(&inst);
           op3 = val->getName();
 
 Value Numbering Algorithm
-------------------------

This section explains my implementation of the Value Numbering (VN) based on the pieces explained above. One important point is that the instructions are already in the SSA form because of the _\-mem2reg_ option passed on to _“_opt_”_. The algorithm works as follows:

*   Read one instruction
*   Convert the instruction enum to its corresponding string i.e. “+”, “-”, “*” and “/”
*   Cast the instruction to _Value_ and read its name (this is the destination operand)
*   Cast the instruction to _Use_ and read the source operands
*   Query the source operands value number from the hashmap, and add them if not existed
*   Create an expression from the value numbers and the operation string e.g. a + b becomes 1 + 2
*   Query the expression value number from the hashmap. Report redundancy if existed, otherwise add the expression to the hashmap.
*   Add <destinaton\_operand, value> to the hashmap

Below is the main body of the algorithm:

         if  (inst.isBinaryOp()){
              if (inst.getOpcode() == Instruction::Add){
              operation = "+";
          }
         if (inst.getOpcode() == Instruction::Sub){
             operation = "-";
          }
         if (inst.getOpcode() == Instruction::Mul){
            operation = " ";
          }
         if (inst.getOpcode() == Instruction::UDiv){
           operation = "/";
          }
         auto   ptr = dyn\_cast<User>(&inst);
         auto   val = dyn\_cast<Value>(&inst);
         op3 = val->getName();
         int  i = 1;
         for  ( auto  it = ptr->op\_begin(); it != ptr->op\_end(); ++it) {
           if  (i==1){
                getValueName(it,op1);
           }
           if  (i==2){
                getValueName(it,op2);
           }
        i++;
        }
        bool   found =  new bool ( false );
        op_1 = addOrFindHashTable(op1,found);
        op_2 = addOrFindHashTable(op2,found);
        hashKey = std::to_string(op_1) +  operation + std::to_string(op_2);
        std::string instructionSimp =  op3 + " = " +  op1 +  operation +  op2;
        instructionsSimplified =  instructionsSimplified + instructionSimp + "\n";
        op_3 = addOrFindHashTable(hashKey,found);
        if  (found){
            errs() << ">>>>>>>>> Redundancy found: " <<  op1 <<  operation <<  op2 << " <<<<<<<<<\\n";
            found =  false ;
        }
        hashTable.insert(std::pair<std::string, int \>( op3,op\_3));
        }
       
Result
------

Before exploring the results, the following should be pointed out:  
● The conversion to llvm removes some of the copy operations  
● LLVM automatically does the constant folding  
As a result, the VN result might not come out as expected simply because the LLVM code is  
different than the original code. For instance:

b = d + e;  
a = d + e;  
a = 17;  
c = d + e;  
f = a;  
becomes:  
%add = add nsw i32 %d, %e  
%add1 = add nsw i32 %d, %e  
%add2 = add nsw i32 %d, %e

And the code:  
b = d + e;  
a = d + e;  
a = 17;  
c = d + e;  
f = a + 2;  
becomes:  
%add = add nsw i32 %d, %e  
%add1 = add nsw i32 %d, %e  
%add2 = add nsw i32 %d, %e  
%add3 = add nsw i32 17, 2

To avoid confusion, I print out both the LLVM instructions and the simplified version (more  
readable) I work with.
![](https://github.com/adava/LLVM-Value-Numbering/raw/master/docs/VN-output.jpg)
