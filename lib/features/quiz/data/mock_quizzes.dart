import '../domain/entities/quiz.dart';

final List<Quiz> premadeQuizzes = [
  const Quiz(
    id: 'python_basics',
    title: 'Python Mastery',
    description: 'Master the basics of the world\'s most popular language.',
    imageUrl: 'https://images.unsplash.com/photo-1526379095098-d400fd0bf935',
    questions: [
      Question(
        text: 'What keyword is used to define a function in Python?',
        options: ['func', 'def', 'function', 'define'],
        correctIndex: 1,
      ),
      Question(
        text: 'Which data type is immutable in Python?',
        options: ['List', 'Dictionary', 'Set', 'Tuple'],
        correctIndex: 3,
      ),
      Question(
        text: 'How do you print output to the console?',
        options: ['console.log()', 'System.out.println()', 'print()', 'echo'],
        correctIndex: 2,
      ),
      Question(
        text: 'What does PEP 8 refer to?',
        options: [
          'Database connectivity',
          'Style guide for Python code',
          'Package management',
          'Multithreading',
        ],
        correctIndex: 1,
      ),
      Question(
        text: 'Which operator is used for exponentiation?',
        options: ['^', '**', '//', 'exp()'],
        correctIndex: 1,
      ),
    ],
  ),
  const Quiz(
    id: 'js_expert',
    title: 'JavaScript Ninja',
    description: 'Test your knowledge of the web\'s logic layer.',
    imageUrl: 'https://images.unsplash.com/photo-1579468118864-1b9ea3c0db4a',
    questions: [
      Question(
        text: 'Which symbol is used for strict equality?',
        options: ['==', '=', '===', '!=='],
        correctIndex: 2,
      ),
      Question(
        text: 'What is a Closure?',
        options: [
          'A function bundled with its lexical environment',
          'A way to close a browser window',
          'A database connection',
          'A style of CSS',
        ],
        correctIndex: 0,
      ),
      Question(
        text: 'Which keyword is used to declare a constant?',
        options: ['var', 'let', 'const', 'final'],
        correctIndex: 2,
      ),
      Question(
        text: 'What does JSON stand for?',
        options: [
          'JavaScript Object Notation',
          'Java Source Object Network',
          'JavaScript Online Notation',
          'Just Script Over Network',
        ],
        correctIndex: 0,
      ),
      Question(
        text: 'Which method adds an element to the end of an array?',
        options: ['push()', 'pop()', 'unshift()', 'shift()'],
        correctIndex: 0,
      ),
    ],
  ),
  const Quiz(
    id: 'java_core',
    title: 'Java Core',
    description: 'Deep dive into Object Oriented Programming with Java.',
    imageUrl: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97',
    questions: [
      Question(
        text: 'Which keyword is used to inherit a class?',
        options: ['implements', 'extends', 'inherits', 'super'],
        correctIndex: 1,
      ),
      Question(
        text: 'What is the size of an int in Java?',
        options: ['16 bit', '32 bit', '64 bit', '8 bit'],
        correctIndex: 1,
      ),
      Question(
        text: 'Which of these is NOT an access modifier?',
        options: ['public', 'protected', 'private', 'external'],
        correctIndex: 3,
      ),
      Question(
        text: 'What is the entry point of a Java application?',
        options: ['start()', 'run()', 'main()', 'init()'],
        correctIndex: 2,
      ),
      Question(
        text: 'Which exception is thrown when dividing by zero?',
        options: [
          'NullPointerException',
          'ArithmeticException',
          'NumberFormatException',
          'DivideByZeroException',
        ],
        correctIndex: 1,
      ),
    ],
  ),
  const Quiz(
    id: 'cpp_pro',
    title: 'C++ Systems',
    description: 'Challenge yourself with pointers and memory management.',
    imageUrl: 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4',
    questions: [
      Question(
        text: 'What symbol is used to access the address of a variable?',
        options: ['*', '&', '->', '@'],
        correctIndex: 1,
      ),
      Question(
        text: 'What is a destructor prefixed with?',
        options: ['!', '~', '#', '-'],
        correctIndex: 1,
      ),
      Question(
        text: 'Which is used for dynamic memory allocation?',
        options: ['alloc', 'malloc', 'new', 'create'],
        correctIndex: 2,
      ),
      Question(
        text: 'What does STL stand for?',
        options: [
          'Standard Template Library',
          'System Type List',
          'Simple Text Language',
          'Standard Tool Linker',
        ],
        correctIndex: 0,
      ),
      Question(
        text: 'Which keyword is used to define a class template?',
        options: ['generic', 'template', 'typename', 'pattern'],
        correctIndex: 1,
      ),
    ],
  ),
  const Quiz(
    id: 'dart_flutter',
    title: 'Dart & Flutter',
    description: 'The engine behind this very app!',
    imageUrl: 'https://images.unsplash.com/photo-1629904853716-6c29f6024d84',
    questions: [
      Question(
        text: 'What widget is the root of most Flutter apps?',
        options: ['MaterialApp', 'Scaffold', 'Container', 'Center'],
        correctIndex: 0,
      ),
      Question(
        text: 'Is Dart single-threaded or multi-threaded?',
        options: [
          'Multi-threaded',
          'Single-threaded',
          'No threads',
          'Dual-threaded',
        ],
        correctIndex: 1,
      ),
      Question(
        text: 'Which keyword handles async operations?',
        options: ['wait', 'await', 'async', 'future'],
        correctIndex: 1,
      ),
      Question(
        text: 'What is the command to run a Flutter app?',
        options: ['flutter start', 'flutter run', 'dart run', 'flutter go'],
        correctIndex: 1,
      ),
      Question(
        text: 'StatefulWidget has a separate class for...',
        options: ['Build', 'State', 'Context', 'Controller'],
        correctIndex: 1,
      ),
    ],
  ),
  const Quiz(
    id: 'golang_basics',
    title: 'Go Fundamentals',
    description: 'Concurency, channels, and goroutines.',
    imageUrl: 'https://images.unsplash.com/photo-1627398242454-45a1465c2479',
    questions: [
      Question(
        text: 'Who developed Go?',
        options: ['Microsoft', 'Facebook', 'Google', 'Apple'],
        correctIndex: 2,
      ),
      Question(
        text: 'What keyword starts a goroutine?',
        options: ['thread', 'go', 'start', 'run'],
        correctIndex: 1,
      ),
      Question(
        text: 'Does Go have a "while" loop?',
        options: ['Yes', 'No, it uses "for"', 'No, it uses "loop"', 'No, it uses "do-until"'],
        correctIndex: 1,
      ),
      Question(
        text: 'What is the zero value for a pointer?',
        options: ['0', 'undefined', 'null', 'nil'],
        correctIndex: 3,
      ),
      Question(
        text: 'How do you declare a variable with type inference?',
        options: ['var x = 1', 'x := 1', 'let x = 1', 'int x = 1'],
        correctIndex: 1,
      ),
    ],
  ),
  const Quiz(
    id: 'rust_safe',
    title: 'Rust Safety',
    description: 'Ownership, borrowing, and zero-cost abstractions.',
    imageUrl: 'https://images.unsplash.com/photo-1542831371-d531d36971e6',
    questions: [
      Question(
        text: 'What is the default mutability of variables?',
        options: ['Mutable', 'Immutable', 'Dynamic', 'Static'],
        correctIndex: 1,
      ),
      Question(
        text: 'Which macro is used to print to the console?',
        options: ['print()', 'println!()', 'fmt.Println', 'echo'],
        correctIndex: 1,
      ),
      Question(
        text: 'What handles memory safety in Rust?',
        options: ['Garbage Collector', 'The Borrower', 'The Compiler/Borrow Checker', 'Manual Management'],
        correctIndex: 2,
      ),
      Question(
        text: 'Which keyword defines a match expression?',
        options: ['switch', 'case', 'match', 'when'],
        correctIndex: 2,
      ),
      Question(
        text: 'What is "cargo" in Rust?',
        options: ['A transport protocol', 'The package manager', 'A variable type', 'An error type'],
        correctIndex: 1,
      ),
    ],
  ),
  const Quiz(
    id: 'swift_ios',
    title: 'Swift & iOS',
    description: 'Build apps for the Apple ecosystem.',
    imageUrl: 'https://images.unsplash.com/photo-1563986768609-322da13575f3',
    questions: [
      Question(
        text: 'What keyword indicates a variable can be null?',
        options: ['nullable', 'optional', 'maybe', 'nil'],
        correctIndex: 1,
      ),
      Question(
        text: 'Which symbol is used for Optionals?',
        options: ['!', '?', '#', '@'],
        correctIndex: 1,
      ),
      Question(
        text: 'What is the primary UI framework for modern iOS?',
        options: ['UIKit', 'AppKit', 'SwiftUI', 'CocoaTouch'],
        correctIndex: 2,
      ),
      Question(
        text: 'Which keyword defines a constant?',
        options: ['const', 'var', 'let', 'static'],
        correctIndex: 2,
      ),
      Question(
        text: 'What is a "protocol" in Swift similar to in Java?',
        options: ['Class', 'Interface', 'Abstract Class', 'Enum'],
        correctIndex: 1,
      ),
    ],
  ),
  const Quiz(
    id: 'sql_db',
    title: 'SQL Data',
    description: 'Query, update, and manage relational databases.',
    imageUrl: 'https://images.unsplash.com/photo-1544383835-bda2bc66a55d',
    questions: [
      Question(
        text: 'What does SQL stand for?',
        options: ['Standard Query Language', 'Structured Query Language', 'Simple Question Language', 'System Query Logic'],
        correctIndex: 1,
      ),
      Question(
        text: 'Which command retrieves data?',
        options: ['GET', 'FETCH', 'SELECT', 'PULL'],
        correctIndex: 2,
      ),
      Question(
        text: 'Which clause filters records?',
        options: ['FILTER BY', 'WHERE', 'WHEN', 'HAVING'],
        correctIndex: 1,
      ),
      Question(
        text: 'What uniquely identifies a record?',
        options: ['Primary Key', 'Foreign Key', 'Unique Index', 'Row ID'],
        correctIndex: 0,
      ),
      Question(
        text: 'Which command removes a table?',
        options: ['DELETE TABLE', 'REMOVE TABLE', 'DROP TABLE', 'ERASE TABLE'],
        correctIndex: 2,
      ),
    ],
  ),
  const Quiz(
    id: 'web_basics',
    title: 'HTML & CSS',
    description: 'The building blocks of the web.',
    imageUrl: 'https://images.unsplash.com/photo-1507721999472-8ed4421c4af2',
    questions: [
      Question(
        text: 'What tag defines the largest heading?',
        options: ['<head>', '<h1>', '<h6>', '<header>'],
        correctIndex: 1,
      ),
      Question(
        text: 'What property changes text color in CSS?',
        options: ['text-color', 'font-color', 'color', 'foreground'],
        correctIndex: 2,
      ),
      Question(
        text: 'Which HTML tag creates a hyperlink?',
        options: ['<link>', '<a>', '<href>', '<url>'],
        correctIndex: 1,
      ),
      Question(
        text: 'How do you comment in CSS?',
        options: ['// comment', '<!-- comment -->', '/* comment */', '# comment'],
        correctIndex: 2,
      ),
      Question(
        text: 'What does HTML stand for?',
        options: ['Hyper Text Markup Language', 'High Tech Modern Logic', 'Hyperlink Text Manager', 'Home Tool Markup Language'],
        correctIndex: 0,
      ),
    ],
  ),
];

