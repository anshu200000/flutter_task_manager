# High-Level Overview

It’s a Flutter app where you can:

#### Fetch tasks from an API (JSONPlaceholder fake API).
#### Add tasks (locally + send to API).
#### Delete tasks (locally + delete on API).
#### Manage state using Provider (instead of messy setState).

A new Flutter project created with FlutLab - https://flutlab.io

## How the App Works Step by Step

App starts → TaskProvider is created → empty task list.
User taps “Fetch Tasks” → API call → first 10 tasks from JSONPlaceholder loaded.
User types a task & presses Add → task added locally + sent to API.
User taps Delete → task removed from local state + API.
UI automatically updates (because of Provider’s notifyListeners()).

## Summary

This code is a mini Task Manager app that demonstrates state management (Provider) + API integration in Flutter.
