# HSR-Stud LaTeX Style & Macros [![Build Status](https://travis-ci.org/NaoPross/HSR-Stud-Style.svg?branch=master)](https://travis-ci.org/NaoPross/HSR-Stud-Style)

## TODO
- [ ] `hsrstud` package
  - [ ] Options
    - [X] Keyval options
    - [X] `donotrenew` don't rename predefined LaTeX commands and environments
    - [X] `arrowvec` vectors with arrows
    - [X] `textvecdiff` vector dervivatives without Del notation
    - [X] `legacy` backwards compatibility with HSR-Stud/header etc.
    - [ ] `ost` use the new OST theme and colors
  - [X] Macros
    - [X] Vectors, Matrices and Tensors
    - [X] Equalities
    - [X] Derivatives and vector operators
    - [ ] Book and external material references
  - [X] HSR Colors
  - [ ] OST Colors
  - [ ] Legacy support
    - [ ] Formelbuch macros
    - [X] Legacy color names
- [ ] Document classes
  - [ ] Essay 
  - [X] `hsrzf` Summary (Zusammenfassung)
  - [ ] `hsrbericht` Report (Bericht)
  - [ ] `hsrsa` Simple thesis (Studentenarbeit)
  - [ ] `hsrletter` Formal letter
- [ ] Beamer class support
- [ ] Documentation on how to contribute
  - [ ] Explaination of the `dtx` file format
  - [X] Add a new macro
  - [ ] Add a new env
  - [ ] Update a documentclass
- [ ] More options (suggestions?)

## Compile
It is as simple as it gets. 
This will generate many files including `hsrstud.sty` that can be placed in the folder of any other LaTeX project, which can access the library with `\usepackage{hsrstud}`
```
$ xelatex hsrstud.ins
```

To get the documentation (in PDF) you can compile the respective `dtx` file
```
$ xelatex hsrstud.dtx          # package documentation
$ xelatex hsrstud-classes.dtx  # classes documentation
``` 

## Documentation
The usage of the macros is documented in `hsrstud.pdf`, which is automatically generated when
the `dtx` file is compiled.

## Contribute
### Documented LaTeX sources (`dtx`)
TODO

### Macro code style
- Macros and environments should be all lowercase.
- If a macro redefines an existing csname (command), an alternative version should also be present (see `dontrenew` option)
- Internal variables are prefixed with `\hsr@`, `\hsrstud@` for the package and `\hsrzf@`, `\hsrbericht@` for the classes.
 
### Create a new macro
```latex
\newcommand[<n>]{\<yourmacro>}{%
  % implementation
}
```

### Add a new option
Options are created using the `kvoptions` packages. See the package documentation for more advanced uses.

#### Boolean options
```latex
\DeclareBoolOption[<default>]{<name>}
```

And then you can use it

```latex
% the prefix may be different depending on the file.
% eg: \ifhsrzf@<name>
\ifhsr@<name>
  % do something
\fi
```

## License
```
HSR-Stud-Style (c) by Naoki Pross

HSR-Stud-Style is licensed under a Creative Commons Attribution-ShareAlike 4.0 Unported License.
You should have received a copy of the license along with this work. If not, see

http://creativecommons.org/licenses/by-sa/4.0/
```
