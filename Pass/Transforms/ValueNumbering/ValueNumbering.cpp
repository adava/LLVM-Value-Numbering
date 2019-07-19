#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Instruction.h"
#include <string>
#include <map>
#include <typeinfo>

using namespace llvm;
using namespace std;

#define DEBUG_TYPE "ValueNumbering"

using namespace llvm;

namespace {
struct ValueNumbering : public FunctionPass {
  string func_name = "test";
  static char ID;
  ValueNumbering() : FunctionPass(ID) {}

    std::map<std::string, int> hashTable;
    int VN = 1;



    void getValueName(Use *it, std::string *op){
        if ((*it)->hasName()){
            *op = (*it)->getName();
        }
        else {
            if (isa<ConstantInt>(it)){
                auto* constantVal = dyn_cast<ConstantInt>(it);
                *op = constantVal->getValue().toString(10,1);
            }
            else{
                errs() << "neither has name nor it is constant\n";
                *op = "";
            }
        }
    }

    int addOrFindHashTable(std::string *op,bool *found){
        auto search = hashTable.find(*op);
        auto retVN = VN;
        if (search != hashTable.end()){
            *found = true;
            retVN = search->second;
        }
        else{
            *found = false;
            hashTable.insert(std::pair<std::string,int>(*op,VN++));
        }
        return retVN;
    }

  bool runOnFunction(Function &F) override {
      std::string *op1 = new std::string;
      int op_1;
      std::string *op2 = new std::string;
      int op_2;
      std::string *op3 = new std::string;
      int op_3;
      std::string *operation = new std::string;
      std::string *hashKey = new std::string;
      std::string *instructionsSimplified = new std::string;

      hashTable.clear();
        errs() << "---------------------------------\nValueNumbering: ";
        errs() << F.getName() << "\n";
//        if (F.getName() != func_name) return false;

        for (auto& basic_block : F)
        {

            for (auto& inst : basic_block)
            {
            	errs() << inst << "\n";
              if(inst.getOpcode() == Instruction::Load){
                      errs() << "This is Load"<<"\n";
              }
              if(inst.getOpcode() == Instruction::Store){
                      errs() << "This is Store"<<"\n";
              }
                if (inst.isBinaryOp())
                {
//                    errs() << "Op Code:" << inst.getOpcodeName()<<"\n"; // print opcode name
                    if(inst.getOpcode() == Instruction::Add){
                        *operation = "+";
                    }
                    if(inst.getOpcode() == Instruction::Sub){
                        *operation = "-";
                    }
                    if(inst.getOpcode() == Instruction::Mul){
                        *operation = "*";
                    }
                    if(inst.getOpcode() == Instruction::UDiv){
                        *operation = "/";
                    }
                    // See Other classes, Instruction::Sub, Instruction::UDiv, Instruction::SDiv
                //	errs() << "Operand(0)" << (*inst.getOperand(0))<<"\n";
                    auto* ptr = dyn_cast<User>(&inst);
                    auto* val = dyn_cast<Value>(&inst);
                    *op3 = val->getName();
					//errs() << "\t" << *ptr << "\n";
					int i = 1;
                    for (auto it = ptr->op_begin(); it != ptr->op_end(); ++it) {
                        if (i==1){
                            getValueName(it,op1);

                        }
                        if (i==2){
                            getValueName(it,op2);
                        }
                        i++;
                    }
                    bool *found = new bool(false);
                    op_1 = addOrFindHashTable(op1,found);
                    op_2 = addOrFindHashTable(op2,found);
                    *hashKey = std::to_string(op_1) + *operation + std::to_string(op_2);
                    std::string instructionSimp = *op3 + " = " + *op1 + *operation + *op2;
                   *instructionsSimplified = *instructionsSimplified + instructionSimp + "\n";
                    op_3 = addOrFindHashTable(hashKey,found);
                    if (*found){
                         errs() << ">>>>>>>>> Redundancy found: " << *op1 << *operation << *op2 << " <<<<<<<<<\n";
                        *found = false;
                    }
                    hashTable.insert(std::pair<std::string,int>(*op3,op_3));
                }
            }
            errs() << "instructions: \n" << *instructionsSimplified;
        }
    return false;
  }
}; // end of struct ValueNumbering
}  // end of anonymous namespace

char ValueNumbering::ID = 0;
static RegisterPass<ValueNumbering> X("ValueNumbering", "ValueNumbering Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);