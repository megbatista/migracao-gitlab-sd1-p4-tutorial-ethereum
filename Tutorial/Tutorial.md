# Tutorial Ethereum

## Índice

* 1. Introdução
* 2. Instalação
* 3. Criando um Contrato Inteligente
* 4. Referências e API's


### 1. Introdução

Ethereum é uma plataforma descentralizada que utiliza a tecnologia blockchain, um projeto de código aberto que começou
a ser desenvolvido em 2013 e permite que qualquer pessoa possa desenvolver suas próprias aplicações baseadas em
blockchain. Algumas aplicações dessa tecnologia são: transferências financeiras para qualquer parte do mundo,
apólices de seguro, coleta de impostos e o desenvolvimento de contratos inteligentes.

A tecnologia blockchain surgiu com o bitcoin e pode ser considerada um grande banco de dados distribuídos, uma rede
onde cada parte conectada executa e grava as mesmas transações, dificultando o ataque centralizado e fraudes. Assim como
qualquer blockchain a Ethereum possui um protocolo peer-to-peer e é sustentada por vários usuários conectados que possuem
a ethereum virtual machine e executam as mesmas instruções.

Tudo que acontece na plataforma é pago em Ether, uma cripto-moeda que funciona como um combustível, a Ethereum não
considera o Ether concorrente da bitcoin, mas um complemento já que sem ela o Ether nem seria possível.

Neste Tutorial iremos aprender a criar um contrato inteligente usando essa tecnologia.

Um contrato inteligente ou smart contract é uma coleção de código que funciona como um programa de computador programado
para executar ações, sem a possibilidade de censura, fraude ou interferência de terceiros.
Os contratos inteligentes podem ser utilizados para programar e executar ações como: depositar fundos em uma empresa,
transferir dinheiro e vai muito além disso essa tecnologia leva a chamada "internet das coisas" a um outro nível, por
exemplo uma empresa que desenvolve sistemas eletrônicos está trabalhando em uma geladeira que cria uma lista de compras
para o que está faltando, com um contrato inteligente específico ela pode realizar a compra automaticamente direto no
fornecedor e ainda pesquisar por produtos mais baratos.

Os contratos são desenvolvidos em linguagens de alto nível criadas pela própria Ethereum, usaremos aqui a Solidity uma
linguagem orientada a objetos parecida com o JavaScript.


### 2. Instalação

Para começar a programar em Solidity é necessário apenas acesso a internet pois usaremos um compilador online
chamado "remix":

Instale o compilador e a IDE online acessando o [projeto no GitHub](https://github.com/ethereum/browser-solidity)
do compilador online de Solidity e siga as intruções de instalação.

Ou se preferir acesse o site do [compilador online em tempo real](https://remix.ethereum.org/).

Você também pode instalar Solidity via nmp/Node.js pela linha de comando:
    ```
    npm install -g solc
    ```

### 3. Criando um Contrato Inteligente

Abra o compilador e digite o código:

```
pragma solidity ^0.4.0;

contract OlaMundoContrato {
    string palavra = "Olá, Mundo";
    uint valor;
    
    event Imprime(string out);
    function() { Imprime(palavra); }
    
    function setPalavra(string novaPalavra) {
        palavra = novaPalavra;
    }
    
    function getPalavra() returns (string) {
        return palavra;
    }
    
    function setValor(uint x) {
        valor = x;
    }

    function getValor() constant returns (uint) {
        return valor;
    }
}
```
    
A primeira coisa que fazemos é definir a versão da linguagem usada, para isso é usada a palavra 'pragma', pragmas
são instruções dadas ao compilador para que ele saiba como tratar o código.

Definimos um contrato utilizando a palavra 'contract', criamos uma variável palavra do tipo string  e um evento
'Imprime' que possui uma saída do tipo string. Dentro de uma função esse evento é chamado e executado. No compilador
clique na aba 'Run' e no botão 'create' seu contrato será criado. Os métodos criados aparecem no lado direito da tela
clicando neles você pode mudar ou ver os valores das variáveis.

O tipo uint é um inteiro de 256 bits que só armazena valores inteiros, criamos uma variável valor do tipo uint, que
pode representar uma quantia de depósito em ether. Depois são definidos métodos de acesso que são usados para evitar
o acesso público às suas variáveis definindo-as como privadas veremos mais tarde o uso de variáveis públicas e privadas.
Os métodos setValor e setPalavra são usados para mudar o valor da variável, digite no campo criado com o nome do método
no compilador uma nova palavra entre aspas duplas e clique em setPalavra, no log do compilador aparecerá o evento gerado
e o novo conteúdo da variável. Os getters, métodos que possuem get na frente do nome retornam o valor de uma variável
sem modifica-la e necessitam da palavra "constant" para serem definidos.

Agora que você já está familiarizado com a linguagem e ambiente vamos criar um simples contrato que funciona como uma
conta de banco.

Precisaremos de uma função para depositar fundos nessa conta que terá acesso público, pois qualquer um pode depositar,
um método getter para verificar quanto tem na conta e eventos que indicam as transações feitas. Para começar criamos
uma variável ```address cliente``` address é um tipo de 20 bytes que não suporta operação aritmeticas e guarda
endereço Ethereum de um usuário. Também foi criado um construtor que instancia essa variavel com a identificação do dono
da conta:

    function ContratoConta() public {
       cliente = msg.sender;
    }

Para depositar vamos precisar de um tipo de função especial chamada "payable" que movimenta o ether, combustivel da
plataforma Ethereum, a função emite um evento que mostra ao usuário quem depositou e quantia depositada.

    function depositaFundos() payable public{
       StatusUsuario("Usuario transferiu dinheiro", msg.sender, msg.value);
    }

Se o cliente quiser verificar a quantidade de dinheiro na conta ele pode usar o método a seguir

    function getFundos() public ifCliente constant returns(uint){
       return this.balance;
    }
 
 o ifCliente na declaração da função é um modificador, na linguagem solidity um modificador pode ser usado para
 verificar uma condição e economizar código
 
    modifier ifCliente() {
       if(msg.sender != cliente) {
           throw;
       }else {
            _;
       }
    }

como muitas funções dentro do código precisam de verificar se o cliente e a pessoa que está executando a função
possuem o mesmo endereço, basta colocar o nome do modificador na função e ele será chamado.

A próxima função verifica se foi depositado algum dinheiro, se sim executa um evento que atualiza o status, '_switch'
é uma variável do tipo boolean que auxilia na verificação

    function verificaFundos(uint amount) ifCliente public{
       if(cliente.send(amount)){
           AtualizaStatus("Usuario transferiu dinheiro");
           _switch = true;
       }else {
           _switch = false;
       }
    }

O código completo pode ser encontrado na pasta contrato dentro do projeto.

No compilador execute o código e no campo "value" digite uma quantia em unidades contidas do sistema métrico do ether
e utilize o campo "depositaFundos" criado para fazer depósitos.


### 4.Referências e Documentações

Site oficial da [Ethereum](https://www.ethereum.org/)

Documentação [Ethereum](http://www.ethdocs.org/en/latest/index.html)

Documentação [Solidity](https://solidity.readthedocs.io/en/develop/index.html)

[Artigo sobre a tecnologia Ethereum](https://medium.com/@creole/7-a-simple-view-of-ethereum-e276f76c980b)

[Tutorial no youtube de Solidity](https://www.youtube.com/watch?v=R_CiemcFKis&list=PLQeiVDgMaJcWnAZLElXKLZhS5a71Sxzw0)
