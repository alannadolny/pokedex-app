# POKEDEX

## Table of Contents

- [General Info](#general-information)
- [Technologies \ Libraries Used](#technologies--libraries-used)
- [Features](#features)
- [Setup](#setup)
- [Project Status](#project-status)

## General Information

The Pokedex application based on data provided by [PokeApi](https://pokeapi.co/). The main idea of this project was to learn some basics of flutter with dart, including state management, routing, etc.
[Nagranie ekranu z 2024-09-13 00-57-48.webm](..%2F..%2FWideo%2FNagrania%20ekranu%2FNagranie%20ekranu%20z%202024-09-13%2000-57-48.webm)

## Technologies \ Libraries Used

The application was build using Flutter with Dart.
Libraries used:
- http
- go_router
- riverpod (flutter_riverpod, riverpod_annotation, riverpod_generator)
- infinite_scroll_pagination
- build_runner

## Features

- Scrollable list of pokemons (Data is loaded dynamically, 10 pokemons per request)
- Each pokemon has appropriate background color generated based on dominant color of the pokemon's artwork image
- List of pokemons is sortable and filterable
- Each pokemon has it's detailed view
- In detailed view there are available previews of evolution chain, description of the pokemon, damage relations and statistics

## Setup

To resolve the dependencies:
```
flutter pub get
```
To run the app:
```
flutter run lib/main.dart
```

## Project Status

Project is completed (13.09.2024)
