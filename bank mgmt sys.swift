                                                   
                                                    //Bank Management System
    
    //This structure represents the details for bank account holder
    struct bankHolderDetails{
        var acctNo: String
        var amount:String
        var name:String
        var phno:String
        var email:String
    }
    
    //This structure represents the details for customer details that a bank should know
    struct CustomerDetails{
        var name: String
        var address:String
        var maritalStatus:String
    }
    
    //This array stores the actual bank details
    var bankBase: [bankHolderDetails] = []
    //This array stores the customer's details
    var custBase: [CustomerDetails] = []
    
    
    //Functionality class stores the prototyping of functions that would be used in the Bank and Customer class respectively
    class Functionality{
        func userDetails(){
            //this function adds user details
        }
        
        func insertIntoBankBase(){
            //inserts data into array
        }
        
        func createUser(){
            //creates a new user or gettng bank details
        }
        
        func insertIntoCustBase(){
            //inserts Customer data into array
        }
        
        func displayCustDetails(){
            //This helps in displaying customer details
        }
        
        func withdraw(){
            //this function helps in withdrawing money
        }
        
        func deposit(){
            //Deposits money in bank 
        }
        
        func displayBankDetails(){
            //Displays bank Details
        }
    }//end of functionality class
    
    //Bank class contains functions that cater to the processes of a bank Management System
    class Bank:Functionality{
        var acctNoInClass:String
        var amountInClass:String
        var nameInClass:String
        var phnoInClass:String
        var emailInClass:String
        var tempAccntNum : String
        var tempAmount:String
        var flag:Int 
        var depositAmt:String
        
        override init(){
            acctNoInClass = " "
            amountInClass = " "
            nameInClass = " "
            phnoInClass = " "
            emailInClass = " "
            tempAccntNum = " "
            tempAmount = " "
            flag = 0
            depositAmt = " "
            
        }// end of init
        
        override func userDetails(){
            print("..............................ADD USER BANK DETAILS........................")
            print("Enter Account Number")
            acctNoInClass = readLine()!
            print("Enter Amount")
            amountInClass = readLine()!
            print("Enter name")
            nameInClass = readLine()!
            print("Enter phone number")
            phnoInClass = readLine()!
            print("Enter email")
            emailInClass = readLine()!
            }// end of userDetails function
            
        override func insertIntoBankBase(){
            let objStruct = bankHolderDetails(acctNo:acctNoInClass, amount:amountInClass, name:nameInClass, phno:phnoInClass,email: emailInClass)
            bankBase.append(objStruct)
            print("Inserted")
        }// end of insertIntoBankBase function
    
        override func withdraw(){
            //Find amount
            var index:Int = 0
            print("Enter Account Number")
            tempAccntNum = readLine()!
            for i in 0..<bankBase.count{
               if bankBase[i].acctNo == tempAccntNum{
                index = i
                tempAmount = bankBase[i].amount
                flag = 1
                break
               }
            }//end of for loop
            if (flag == 0){
                print("No such accnt number exists")
            }
           else{
            //convert to Int
            if var intAmt = Int(tempAmount)
            {
                print("Enter the amount to be deducted")
                let amtToBeDeducted = readLine()!
                if let intAmtToBeDeducted = Int(amtToBeDeducted){
                    intAmt = intAmt - intAmtToBeDeducted
                    print("Balance left = \(intAmt)")
                }
                bankBase[index].amount = String(intAmt)
            }
            // else{
            //     print("Entered input is \(acctNoTemp ) of the type:\(type(of: acctNoTemp ))")
            // }
           }
        }// end of withdraw function
        
        override func deposit(){
            var index : Int = 0
            print("Enter Account Number")
            tempAccntNum = readLine()!
             for i in 0..<bankBase.count{
                if bankBase[i].acctNo == tempAccntNum{
                   index = i
                   tempAmount = bankBase[i].amount
                   flag = 1
                   break
               }
               }//end of for loop
            print("Enter the amount to be deposited")
            depositAmt = readLine()!
            if let intDepositAmt = Int(depositAmt){
                if let intAmt = Int(tempAmount){
                    let newBalance = intAmt + intDepositAmt
                    bankBase[index].amount = String(newBalance)
                    print("Current Balance = \(bankBase[index].amount)")
            }
            else{
                print("Amount cannot be fetched")
             }
            }//end of inner if let
            else{
                print("Amount to be deposited cannot be fetched")
            }// end of outer if let
        }//end of deposit function
        
        
        override func displayBankDetails(){
            for i in 0..<bankBase.count{
                print(bankBase[i])
            }//end of for loop
        }//end of displayBankDetails function
    }//end of Bank class
    
    //Customer class contains functions that are responsible for gettng customer details
    class Customer:Functionality{
        var nameInCustClass : String
        var addInCustClass :String
        var statusInCustClass: String
      
        override init(){
            nameInCustClass = " "
            addInCustClass = " "
            statusInCustClass = " "
            
        }
        
        override func createUser(){
            print(".........................ADD NEW USER DETAILS TO CUSTOMER DATABASE..........................")
            print("Enter your name")
            nameInCustClass = readLine()!
            print("Enter your Address")
            addInCustClass = readLine()!
            print("Enter your marital Status")
            statusInCustClass = readLine()!
        }//end of createUser function
        
        override func insertIntoCustBase(){
            let objCustStruct = CustomerDetails(name:nameInCustClass , address:addInCustClass , maritalStatus:statusInCustClass)
            custBase.append(objCustStruct)
            print("Inserted Customer")
        }//end of insertIntoCustBase function
        
        override func displayCustDetails(){
            for i in 0..<custBase.count{
                print(custBase[i])
            }//end of for loop
        }//end of displayCustDetails function
        
    }//end of Customer class
    
    //The mainLoop class is responsible for displaying the menu  
    class mainLoop{
        var choice:String = " "
        func display(){
        print(".....................................//Bank Management System//.....................................\n\t\t\t\t\tby Navpreet Kaur\n\t\t\t\t\tIOS TECH INTERN\n\t\t\t\t\tJUNGLEWORKS")
           repeat{
               print("\n1> Create a new User \n2> Add user Details \n3> Exit \n4> Display Customer details\n5> Withdraw Amount\n6> Deposit Amount\n7> Display Bank Details" )
               choice = readLine()!
                let objOne = Customer()
                let obj = Bank()
               switch(choice){
                   case "1":
                        print("Case 1")
                       
                        objOne.createUser()
                        objOne.insertIntoCustBase()
                        print(custBase)
                        
                   case "2":
                        print("Case 2")
                       
                        obj.userDetails()
                        obj.insertIntoBankBase()
                        print(bankBase)
                   case "3":
                        break
                    
                   case "4":
                        print("Case 4")
                        objOne.displayCustDetails()
                    
                    case "5":
                         print("Case 5")
                         obj.withdraw()
                         
                    case "6":
                        print("Case 6")
                        obj.deposit()
                        
                    case "7":
                        print("Case 7")
                        obj.displayBankDetails()
                   default:
                        print("default")
               }
           }while(choice != "3")
           }//end of display Function
       }//end of mainLoop class
    
    //Driver code
    let mainObj = mainLoop()
    mainObj.display()
     
    
    
    
    



