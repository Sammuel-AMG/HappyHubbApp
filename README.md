# Happy Hub – Documentação Técnica

**Versão 0.3 – 26 jun 2025**

**Estado do projeto:** MVP funcional offline, com navegação declarativa, autenticação mock, tela de hub com feed de promoções, tema de marca e estrutura modular pronta para plugar back-end.

## Índice

1. [Visão geral](#1--visão-geral)
2. [Funcionalidades atuais](#2--funcionalidades-atuais)
3. [Pilha tecnológica](#3--pilha-tecnológica)
4. [Arquitetura & fluxos](#4--arquitetura--fluxos)
5. [Estrutura de pastas](#5--estrutura-de-pastas-lib)
6. [Guia de instalação & execução](#6--guia-de-instalação--execução)
7. [Gerência de estado (Riverpod)](#7--gerência-de-estado)
8. [Navegação (GoRouter)](#8--navegação)
9. [Temas & design system](#9--temas--design-system)
10. [Autenticação mock](#10--autenticação-mock)
11. [Padrão de repositórios](#11--padrão-de-repositórios)
12. [Testes & qualidade de código](#12--testes--qualidade-de-código)
13. [Roadmap curto](#13--roadmap-curto)
14. [Licença](#14--licença)

## 1 · Visão geral

Happy Hub é um aplicativo mobile inspirado na experiência do iFood, porém focado em promoções de bares e restaurantes em Brasília (happy hour). O objetivo inicial é entregar um MVP navegável que demonstre:

- Identidade visual própria
- Fluxo Splash → Login/Cadastro → Hub + navegação por abas
- Mock de feed de promoções e barras mais populares
- Estrutura de código escalável (Riverpod + GoRouter) pronta para backend real

## 2 · Funcionalidades atuais

| Módulo | Descrição |
|--------|-----------|
| **Splash Screen** | Tela de abertura com logotipo, cor de fundo, progress indicator (2 s). |
| **Autenticação mock** | Login/Cadastro locais; estado guardado em memória. |
| **Hub** | Search bar (UI), abas "Favoritos / Histórico / Seguindo", carrossel "Bares do mês", lista vertical de promoções (imagem, preço, nome do bar). |
| **Bottom Navigation** | Hub, Mapa (stub), Pedidos (stub), Notificações (stub), Perfil. |
| **Perfil** | Avatar genérico, dados fictícios, botão Sair (logout). |
| **Proteção de rotas** | GoRouter redireciona usuários não autenticados para /login. |

## 3 · Pilha tecnológica

| Camada | Ferramenta | Versão |
|--------|------------|--------|
| **SDK** | Flutter | ≥ 3.22 |
| **Linguagem** | Dart | ≥ 3.4 |
| **Ger. estado** | flutter_riverpod | ^2.5 |
| **Navegação** | go_router | ^13.0 |
| **Imagens em cache** | cached_network_image | ^3.3 |
| **UI** | Material 3 + Google Fonts (Rubik) | |
| **Teste unitário/widget** | flutter_test (builtin) | |

> **Nota:** Back-end ainda não conectado; NestJS/PostgreSQL será adicionado na Fase E do roadmap.

## 4 · Arquitetura & fluxos

```
(Splash) ──▶ /login ──▶ /hub ──▶ HubShell[BottomNav]
                                 │
                                 ├─ /map        (stub)
                                 ├─ /orders     (stub)
                                 ├─ /notifications (stub)
                                 └─ /profile
```

- GoRouter + ShellRoute mantém o HubShell vivo enquanto troca as rotas-filhas
- Autenticação é um StateNotifier<bool> (verdadeiro = logado)
- Splash verifica authRepoProvider → decide se vai para /login ou /hub
- Bottom-nav chama context.go(path) garantindo URL/location correta

## 5 · Estrutura de pastas (lib/)

```
core/          # theme, constants, app_router.dart
data/
  └─ repositories/
        auth_repo.dart
features/
  auth/
    └─ view/  (login_page.dart, signup_page.dart)
  hub/
    ├─ view/  (hub_screen.dart, hub_shell.dart)
    └─ widgets/ (top_bars_section.dart)
  map/view/
  orders/view/
  notifications/view/
  profile/view/
ui/
  └─ widgets/ (promo_card.dart)
splash_screen.dart
bootstrap.dart   # ProviderScope + HappyHubApp
main.dart        # export do bootstrap
```

## 6 · Guia de instalação & execução

```bash
# Pré-requisitos: Flutter 3.22+, Dart 3.4+, Git
git clone https://github.com/seu-usuario/Happy-Hub.git
cd Happy-Hub
flutter pub get
flutter run           # emulador Android, iOS ou -d chrome
flutter test          # testes unitários/widget
```

## 7 · Gerência de estado

- **Riverpod 2.x** – ProviderScope em bootstrap.dart
- **authRepoProvider** ⇒ StateNotifier<bool> para login/logout
- Futuras entidades (Promoções, Bares) serão expostas como AsyncNotifier

## 8 · Navegação

```dart
final routerProvider = Provider<GoRouter>((ref) {
  final loggedIn = ref.watch(authRepoProvider);
  return GoRouter(
    redirect: (context, state) { ... },
    routes: [Splash, Login, SignUp, ShellRoute{Hub,Map,...}]
  );
});
```

- Redirect impede acesso não autorizado
- ShellRoute injeta HubShell(child), permitindo bottom-nav + deep-links

## 9 · Temas & Design System

```dart
class HHColors {
  static const orange = Color(0xFFA54205);
  static const yellow = Color(0xFFFFEC99);
}
```

- **hhTheme** centraliza cores, tipografia Rubik, Material 3, useMaterial3: true
- Constantes reutilizadas em todos os widgets

## 10 · Autenticação mock

| Ação | Implementação |
|------|---------------|
| **login()** | authRepo.logIn() → state = true |
| **logout()** | state = false; GoRouter redireciona para /login |
| **persistência** | (a implementar) SharedPreferences |

## 11 · Padrão de repositórios

- Interface PromoRepository (em planejamento)
- Dummy Repo lê lista estatística de promoções em dummy_data.dart
- Estrutura garante injeção via Provider e fácil troca para REST/GraphQL

## 12 · Testes & qualidade de código

- **Teste widget:** verifica que HappyHubApp renderiza texto Happy Hub na splash
- **flutter analyze** limpo (avisos de deprecated withOpacity aceitos até upgrade)
- CI será adicionado com GitHub Actions (lint + testes)

## 13 · Roadmap curto

| Fase | Item | Status |
|------|------|--------|
| **A** | Repository + Stream de promoções | próximo |
| **C** | Skeleton loader & pull-to-refresh | planejado |
| **E** | Back-end NestJS + PostgreSQL | backlog |
| **D** | Golden tests / integração | backlog |

## 14 · Licença

Este projeto está licenciado sob **MIT License**. Consulte o arquivo LICENSE.

---

## Contato

**Maintainer:** Sammuel Gomes – sammuel.machado0413@gmail.com

Contribuições, issues e pull requests são bem-vindos!