pragma solidity ^0.4.0;
contract CustodialContract {

   address client;
   bool _switch = false;
   
   event UpdateStatus(string _msg);
   event UserStatus(string _msg, address user, uint amount);
   
   function CustodialContract() {
       client = msg.sender;
   }
   
   modifier ifClient() {
       if(msg.sender != client) {
           throw;
       }
       _;
   }
   
   function depositFunds() payable {
       UserStatus("User transferred some money", msg.sender, msg.value);
   }
   
   function witdrawFunds(uint amount) ifClient {
       if(client.send(amount)){
           UpdateStatus("User transferred some money");
           _switch = true;
       }else {
           _switch = false;
       }
   }
   
   function getFunds() ifClient constant returns(uint) {
       return this.balance;
   }
   
}
