# 📝 Notes App — Practice Flutter Clean Architecture

## 📖 О проекте

Данный проект разработан исключительно в образовательных целях для изучения **Clean Architecture** при разработке Flutter-приложений.

Основной целью проекта являлось не создание полноценного приложения для заметок, а понимание правильного разделения приложения на независимые слои, организации потока данных и применения современных архитектурных подходов.

В качестве локального хранилища используется **Hive**, а управление состоянием реализовано с помощью **Cubit (flutter_bloc)**.

---

<img width="433" height="818" alt="image" src="https://github.com/user-attachments/assets/8978d52b-6aa7-4d2d-b249-b6fc27e69969" />

<img width="371" height="781" alt="image" src="https://github.com/user-attachments/assets/164aeacc-dd99-4894-864e-06af5a6a6868" />

---

# 🚀 Возможности приложения

На данный момент реализованы следующие функции:

- ➕ Добавление новой заметки
- 📋 Просмотр списка заметок
- ❌ Удаление заметки
- ✅ Изменение статуса выполнения задачи
- 💾 Локальное хранение данных с использованием Hive
- 🔄 Автоматическое обновление интерфейса через Cubit

---

# 🏛 Используемая архитектура

Проект построен по принципам **Clean Architecture**.

Архитектура разделена на три независимых слоя:

```
Presentation
      │
      ▼
Domain
      │
      ▼
Data
```

Каждый слой отвечает только за свою область ответственности.

---

# 📂 Структура проекта

```text
lib/
│
├── core/
│   ├── errors/
│   ├── services/
│   └── theme/
│
├── features/
│   └── notes/
│       │
│       ├── data/
│       │   ├── datasources/
│       │   │   ├── local/
│       │   │   └── remote/
│       │   │
│       │   ├── models/
│       │   │
│       │   └── repositories/
│       │
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       │
│       └── presentation/
│           ├── cubit/
│           ├── pages/
│           └── widgets/
│
└── main.dart
```

---

# 🖥 Presentation Layer

Слой отвечает только за пользовательский интерфейс.

В него входят:

- Pages
- Widgets
- Cubit
- States

Presentation получает действия пользователя, передает их в UseCase и отображает результат.

Данный слой ничего не знает о Hive, Firebase, API или способах хранения данных.

---

# 🧠 Domain Layer

Domain — это сердце приложения.

Он содержит:

- Entity
- Repository (абстракции)
- Use Cases

Именно здесь находится бизнес-логика приложения.

Domain полностью независим от Flutter, Hive и любых сторонних библиотек.

---

# 💾 Data Layer

Data отвечает за получение и сохранение данных.

В него входят:

- DataSource
- Repository Implementation
- Models

В данном проекте данные сохраняются локально с использованием Hive.

При необходимости источник данных можно заменить на Firebase, REST API или SQLite без изменения остальных слоев приложения.

---

# 🔄 Поток данных

## Добавление новой задачи

```
Пользователь

↓

NotesAddButton

↓

NotesCubit

↓

AddTaskUseCase

↓

Repository

↓

HiveLocalDatasource

↓

Hive Database
```

---

## Получение списка задач

```
NotesCubit

↓

GetAllTasksUseCase

↓

Repository

↓

HiveLocalDatasource

↓

Hive

↓

Repository

↓

Cubit

↓

BlocBuilder

↓

Обновление интерфейса
```

---

## Удаление задачи

```
Кнопка удаления

↓

Cubit

↓

DeleteTaskUseCase

↓

Repository

↓

HiveLocalDatasource

↓

Hive

↓

Cubit

↓

BlocBuilder
```

---

# 📦 Entity

Entity описывает бизнес-сущность приложения.

В данном проекте задача состоит из:

- Названия
- Описания
- Статуса выполнения

Entity никак не зависит от Hive или Flutter.

---

# 📄 Model

Model наследуется от Entity.

Дополнительно содержит методы преобразования данных.

Используемые методы:

- fromHive()
- toHive()

Это позволяет преобразовывать данные между Hive и Entity.

```
Hive

↓

Map<String, dynamic>

↓

Model

↓

Entity
```

или наоборот

```
Entity

↓

Model

↓

Map<String, dynamic>

↓

Hive
```

---

# 📚 Repository Pattern

Presentation никогда не работает напрямую с Hive.

Вместо этого используется Repository.

```
Cubit

↓

UseCase

↓

Repository

↓

Hive
```

Благодаря этому можно полностью заменить источник данных, не изменяя пользовательский интерфейс.

---

# 🎮 Управление состоянием

Для управления состояниями используется **Cubit**.

Используемые состояния:

- Init
- Loading
- Loaded
- Error

После выполнения бизнес-логики Cubit изменяет состояние через метод `emit()`.

Например:

```dart
emit(NotesStateLoading());

final tasks = await getAllTasksUseCase();

emit(NotesStateLoaded(tasks: tasks));
```

После изменения состояния `BlocBuilder` автоматически перестраивает только необходимую часть интерфейса.

---

# 🛠 Используемые технологии

- Flutter
- Dart
- Hive
- flutter_bloc (Cubit)
- Clean Architecture
- Repository Pattern

---

# 📚 Что было изучено

Во время разработки проекта были изучены следующие темы:

- Clean Architecture
- Разделение приложения на слои
- Repository Pattern
- Entity и Model
- DataSource
- Use Cases
- Cubit
- Hive Database
- Организация структуры проекта
- Поток данных между слоями приложения

---

# 📌 Цель проекта

Главной целью данного проекта являлось получение практического опыта разработки Flutter-приложений с использованием **Clean Architecture** и понимание принципов построения масштабируемой архитектуры.

---

# 👨‍💻 Автор

**Ersultan Serikbaev**

Flutter Developer (Learning)
