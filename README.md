# Лабораторная работа № 1. Введение в профессиональную деятельность

**Дисциплина:** «Введение в профессиональную деятельность»

**ФИО:** Трифонова Маргарита Сергеевна  
**Группа:** МЗО-111БВ-26  
**Номер в списке:** 26

## Цель

Сравнить модели выполнения языков программирования (компиляция, интерпретация, транспиляция, JIT) и освоить базовый цикл работы с Git: репозиторий, коммиты, ветки, слияния, разрешение конфликтов, теги.

## Языки программирования

- C
- C++
- Python
- JavaScript
- TypeScript
- Java
- C#
- F#
- Go
- Rust
- Bash
- Prolog
- Assembler (x86-64, GNU as)

## Окружение

- **ОС:** Windows 11 (x64)
- **Терминал:** встроенный терминал Visual Studio Code, PowerShell 5.1
- **Компиляторы C/C++/assembler:** w64devkit (GCC 16.2.0, GNU Binutils / `as` 2.47, target `x86_64-w64-mingw32`), каталог `bin` добавлен в пользовательский `PATH`
- **Остальные инструменты:** стандартные установщики (см. таблицу ниже)
- **Кодировка исходников:** UTF-8 без BOM

## Инструменты, версии и команды сборки/запуска

| Язык | Версия инструмента | Команда сборки / запуска |
|---|---|---|
| C | GCC 16.2.0 | `gcc -Wall -Wextra -pedantic main.c -o main.exe` → `.\main.exe` |
| C++ | G++ 16.2.0 | `g++ -Wall -Wextra -pedantic main.cpp -o main.exe` → `.\main.exe` |
| Python | Python 3.12.2 | `python main.py` |
| JavaScript | Node.js 24.13.1 | `node main.js` |
| TypeScript | tsc 7.0.2 | `tsc main.ts --outDir dist` → `node dist/main.js` |
| Java | JDK 25.0.1 | `javac Main.java` → `java Main` |
| C# | .NET SDK 9.0.314 | `dotnet run` |
| F# | .NET SDK 9.0.314 | `dotnet run` |
| Go | Go 1.27.3 | `go run main.go` |
| Rust | rustc 1.99.1 | `rustc main.rs -o main.exe` → `.\main.exe` |
| Bash | GNU Bash 5.1.16 | `bash main.sh` |
| Prolog | SWI-Prolog 10.0.2 | `swipl -q -g "load_files('main.pl', [encoding(utf8)]), main, halt" -t halt` |
| Assembler | GNU as 2.47 (w64devkit) | `as assembler.s -o assembler.o` → `gcc assembler.o -o assembler.exe` → `.\assembler.exe` |

Все команды запускаются из терминала VS Code, из папки соответствующего языка. Пример с C:

```bash
cd c
gcc -Wall -Wextra -pedantic main.c -o main.exe
.\main.exe