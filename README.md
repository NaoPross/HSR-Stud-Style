# HSR-Stud LaTeX Style & Macros

## Built it

### Automagically with `make`
It is as simple as it gets.
```
$ make
```
The output will be generated in a directory called `build`.

### Manually
This will generate many files including `hsrstud.sty` that can be placed in the
folder of any other LaTeX project, which can access the library with
`\usepackage{hsrstud}`
```
$ xelatex hsrstud.ins
```

To get the documentation (in PDF) you can compile the respective `dtx` file
```
$ xelatex hsrstud.dtx          # package documentation
$ xelatex hsrstud-classes.dtx  # classes documentation
``` 

## Documentation
The usage of the package and classes documented in `hsrstud.pdf` and
`hsrstud-classes.pdf` respectively, which is automatically generated when the
`dtx` file is compiled.

## License
```
HSR-Stud-Style (c) by Naoki Pross

HSR-Stud-Style is licensed under a Creative Commons Attribution-ShareAlike 4.0 Unported License.
You should have received a copy of the license along with this work. If not, see

http://creativecommons.org/licenses/by-sa/4.0/
```
