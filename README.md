# 📱 PokedexApp

Este é um projeto de estudo desenvolvido para aprofundar conhecimentos em desenvolvimento **iOS nativo** utilizando **Swift** e **SwiftUI**. O objetivo principal foi aplicar conceitos avançados de arquitetura e boas práticas de programação em um cenário real de consumo de API.

---

## 🛠 Arquitetura e Padrões

O projeto foi construído seguindo os princípios da **Clean Architecture**, garantindo o desacoplamento entre as camadas de dados, lógica de negócio e interface de usuário.

## 📸 Screenshots

Aqui podes visualizar a interface do projeto em execução:

<p align="center">
  <img src="https://github.com/user-attachments/assets/168dfbc5-0364-4e6b-86b7-9a5599ff07f6" width="300" alt="Lista de Pokémons">
  <img src="https://github.com/user-attachments/assets/8165f901-eb25-43a3-920b-917a8853ff5f" width="300" alt="Resultado da busca">
  <img src="https://github.com/user-attachments/assets/f908ba8a-2d5b-4de5-adf1-a3e661df6f3b" width="300" alt="Detalhes - sobre">
  <img src="https://github.com/user-attachments/assets/7af20831-76db-4fa4-82a4-27415efa1296" width="300" alt="Detalhes - fotos">
</p>

---

### Divisão de Camadas:
* **Domain**: Contém as **Entities** (como `PokemonListState`), **Use Cases** (como `LoadPokemonPageUseCase`) e protocolos de **Repositories**.
* **Data**: Responsável pela infraestrutura, incluindo o **NetworkClient** (URLSession), implementações concretas dos **Repositories** e **DTOs** para mapeamento da PokeAPI.
* **Presentation**: Implementada seguindo o padrão **MVVM**, utilizando **ViewModels** para gestão de estado e views modulares em **SwiftUI**.

---

## ✨ Funcionalidades

* **Listagem Paginada**: Carregamento infinito (infinite scroll) de Pokémons consumindo a PokeAPI.
* **Busca em Tempo Real**: Filtro por nome ou ID diretamente na barra de pesquisa.
* **Detalhes Dinâmicos**: Tela de detalhes com cores de fundo que se adaptam ao tipo principal do Pokémon.
* **Galeria de Imagens**: Visualização de sprites e artes oficiais em uma grade organizada.
* **Status de Combate**: Representação visual (barras de progresso) dos atributos de cada criatura.

---

## 🚀 Tecnologias e Ferramentas

* **Swift**: Utilização de concorrência moderna com `async/await`.
* **SwiftUI**: Interface declarativa e reativa para construção das views.
* **URLSession**: Cliente de rede para comunicação assíncrona.
* **Conventional Commits**: Padronização de histórico do Git para melhor manutenção em equipe.
* **Mocks de Teste**: Extensões de dados estáticos para permitir o desenvolvimento e preview de UI sem dependência de rede.

---

## 📂 Estrutura de Pastas

```text
pokedexApp/
├── Common/           # Views e componentes reutilizáveis (SearchBar, Icons)
├── Data/             # API, DTOs e Repositórios concretos
├── Domain/           # Entidades, Casos de Uso e Protocolos
└── Presentation/     # ViewModels, Views e lógica de formatação de dados
