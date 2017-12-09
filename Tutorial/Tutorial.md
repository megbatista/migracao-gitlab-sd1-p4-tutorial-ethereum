# Tutorial Ethereum

## Índice

* 1. Introdução
* 2. Instalação
* 3. Criando um Contrato Inteligente
* 4. Referências e API's

### 1. Introdução

Ethereum é uma plataforma descentralizada que utiliza a tecnologia blockchain, seu projeto possui código aberto
e permite que qualquer pessoa possa desenvolver suas próprias aplicações baseadas em blockchain ou até mesmo criar
sua própria cripto-moeda.

A tecnologia blockchain pode ser considerada um grande banco de dados distribuídos, uma rede onde cada parte conectada
executa e grava as mesmas transações dificultando o ataque centralizado e fraudes. Assim como qualquer blockchain a
Ethereum possui um protocolo peer-to-peer e é sustentada por vários usuários conectados que possuem a ethereum virtual
machine e executam as mesmas instruções.

Neste Tutorial vamos aprender a criar um contrato inteligente usando essa tecnologia.

Um contrato inteligente ou smart contract é uma coleção de código que funciona como um programa de computador programado
para executar ações, sem a possibilidade de censura, fraude ou interferência de terceiros.
Os contratos inteligentes podem ser utilizados para programar e executar ações como: depositar fundos em uma empresa,
transferir dinheiro e vai muito além disso essa tecnologia leva a chamada "internet das coisas" a um outro nível, por
exemplo uma empresa que desenvolve sistemas eletrônicos está trabalhando em uma geladeira que cria uma lista de compras
para o que está faltando, com um contrato inteligente específico ela pode realizar a compra automaticamente direto no
fornecedor e ainda pesquisar por produtos mais baratos.

Os contratos são desenvolvidos em linguagens de alto nível criadas pela própria Ethereum, usaremos aqui a Solidity uma
linguagem orientada a objetos parecida com o JavaScript, contratos criados em solidity possuem a extensão .sol nome.

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
pode representar uma quantia de depósito em ether. Depois são definidos métodos de acesso às variáveis esses métodos
são chamados de getters e setters. Os métodos setValor e setPalavra são usados para mudar o valor da variável, digite
no campo criado com o nome do método no compilador uma nova palavra entre aspas duplas e clique em setPalavra, no log
do compilador aparecerá o evento gerado e o novo conteúdo da variável.

Agora que você já está familiarizado com a linguagem e ambiente vamos criar um contrato mais complexo 


### 4.Referências e API's
