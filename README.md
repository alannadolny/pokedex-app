# POKEDEX

## Table of Contents

- [General Info](#general-information)
- [Technologies \ Libraries Used](#technologies--libraries-used)
- [Features](#features)
- [Setup](#setup)
- [Project Status](#project-status)

## General Information

The Pokedex application is based on data provided by [PokeApi](https://pokeapi.co/). The main idea of this project was to learn some basics of flutter with dart, including state management, routing, etc.
<img alt="readme_1.gif" height="300px" src="img%2Freadme_1.gif"/>
<img alt="readme_2.gif" height="300px" src="img%2Freadme_2.gif"/>

## Technologies \ Libraries Used

The application was built using Flutter with Dart.
Libraries used:
- http
- go_router
- riverpod (flutter_riverpod, riverpod_annotation, riverpod_generator)
- infinite_scroll_pagination
- build_runner

## Features

- Scrollable list of Pokemon (Data is loaded dynamically, 10 pokemons per request)
- Each Pokemon has an appropriate background color generated based on dominant color of the Pokemon's artwork image
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
