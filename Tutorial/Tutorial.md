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

Um contrato inteligente ou smart contract é uma coleção de código programado para executar ações, sem a possibilidade de
censura, fraude ou interferência de terceiros.
Os contratos inteligentes podem ser utilizados para programar e executar ações como: depositar fundos em uma empresa,
transferir dinheiro e vai muito além disso essa tecnologia leva a chamada "internet das coisas" a um outro nível, por
exemplo uma empresa que desenvolve sistemas eletrônicos está trabalhando em uma geladeira que cria uma lista de compras
para o que está faltando, com um contrato inteligente específico ela pode realizar a compra automaticamente direto no
fornecedor e ainda pesquisar por produtos mais baratos.

Os contratos são desenvolvidos em linguagens de alto nível criadas pela própria Ethereum, usaremos aqui a Solidity uma
linguagem parecida com o JavaScript.

### 2. Instalação

Para começar a programar em Solidity é necessário um compilador:

Instale o compilador e a IDE online acessando o [projeto no GitHub](https://github.com/ethereum/browser-solidity)
do compilador online de Solidity e siga as intruções de instalação.

Ou se preferir acesse o site do [compilador online em tempo real](https://remix.ethereum.org/).

Você também pode instalar Solidity via nmp/Node.js pela linha de comando:

```
    npm install -g solc
``` 

### 3. Criando um Contrato Inteligente

Abra o compilador no navegador e compile o código:
    
    ```
    contract HelloWorld {
        event Print(string out);
        function() { Print("Hello, World!"); }
    }
    ```
    
### 4.Referências e API's
