pragma solidity ^0.4.0;

contract ContratoConta {

   address cliente;
   // variavel booleana que facilita
   // a verificação
   bool _switch = false;
   
   // eventos que mandam mensagens de atualização
   // ao usuario
   event AtualizaStatus(string _msg);
   event StatusUsuario(string _msg, address user, uint amount);
   
   // construtor 
   function ContratoConta() public {
       // atribui o dono da conta à variavel cliente
       cliente = msg.sender;
   }
   
   // modificador usado para reaproveitar codigo
   modifier ifCliente() {
       if(msg.sender != cliente) {
           throw;
       }else {
            // retorna para a função que chamou o modificador
            _;
       }
   }
   
   // O payable indica que essa é uma função
   // que movimenta valores
   function depositaFundos() payable public{
       StatusUsuario("Usuario transferiu dinheiro", msg.sender, msg.value);
   }
   
   function verificaFundos(uint amount) ifCliente public{
       // verifica se o dinheiro foi transferido
       if(cliente.send(amount)){
           AtualizaStatus("Usuario transferiu dinheiro");
           // indica que a transferencia foi feita com sucesso
           _switch = true;
       }else {
           _switch = false;
       }
   }
   
   // mostra a quantia de dinheiro na conta para o usuario
   // o uso do modificador ifCliente permite que somente
   // o dono da conta tenha acesso
   function getFundos() public ifCliente constant returns(uint){
       return this.balance;
   }
   
}
