# Nome do repositório no GitHub: dio-lab-first-token-ethereum

# MPT Coin - Meu Primeiro Token

MPT Coin (Meu Primeiro Token) é um projeto desenvolvido para atender ao laboratório DIO, demonstrando a criação de um token baseado no padrão ERC20 da rede Ethereum.

## Objetivo

O objetivo principal deste projeto é criar uma criptomoeda simples e funcional para comprovar as habilidades de desenvolvimento na rede Ethereum utilizando Solidity. Esta criptomoeda, chamada **MPT Coin**, é um token ERC20 projetado para um nicho específico, com a intenção de oferecer um token com maior capacidade de fracionamento e limitado em termos de total supply.

## Especificações do Token

- **Nome**: MPT Coin
- **Símbolo**: MPT
- **Decimais**: 5 (permitindo transações fracionadas até 0,00001 MPT)
- **Total Supply**: 32.768 MPT
- **Padrão**: ERC20

A escolha do total supply de 32.768 tokens (2^15) foi feita para criar uma estrutura de nicho, com foco em um público específico, além de permitir a supervalorização do token no futuro, mantendo acessível a compra de pequenos valores. Além de fazer uma referência Nerd ao limite superior de uma variável inteira e sinalizada de 16 bits.

## Funções Implementadas

O contrato do MPT Coin implementa as seguintes funções básicas do padrão ERC20:

- `totalSupply()`: Retorna o total de tokens disponíveis.
- `balanceOf(address tokenOwner)`: Retorna o saldo de um endereço específico.
- `allowance(address tokenOwner, address spender)`: Verifica a quantidade de tokens que um endereço está autorizado a gastar em nome de outro.
- `transfer(address to, uint256 tokens)`: Transfere tokens para outro endereço.
- `approve(address spender, uint256 tokens)`: Aprova que outro endereço gaste tokens em nome do proprietário.
- `transferFrom(address from, address to, uint256 tokens)`: Transfere tokens de um endereço autorizado para outro.

## Como Usar

1. **Deploy do Contrato**: O contrato foi desenvolvido em Solidity, com versão 0.8.7. Para implantar o contrato na rede Ethereum (ou em uma rede de testes), utilize ferramentas como Remix ou Truffle.
2. **Interação com o Token**: Após o deploy, o token pode ser transferido entre contas, e outras funções ERC20, como `approve` e `transferFrom`, podem ser utilizadas.

## Licença

Este projeto está licenciado sob a [GPL-3.0 License](https://opensource.org/licenses/GPL-3.0).

---

Projeto criado por Flávio Nogueira Campos como parte do laboratório DIO.
