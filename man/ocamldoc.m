.\"**************************************************************************
.\"*                                                                        *
.\"*                                 OCaml                                  *
.\"*                                                                        *
.\"*             Maxence Guesdon, projet Cristal, INRIA Rocquencourt        *
.\"*                                                                        *
.\"*   Copyright 2004 Institut National de Recherche en Informatique et     *
.\"*     en Automatique.                                                    *
.\"*                                                                        *
.\"*   All rights reserved.  This file is distributed under the terms of    *
.\"*   the GNU Lesser General Public License version 2.1, with the          *
.\"*   special exception on linking described in the file LICENSE.          *
.\"*                                                                        *
.\"**************************************************************************
.\"
.TH OCAMLDOC 1

\" .de Sh \" Subsection heading
\" .br
\" .if t .Sp
\" .ne 5
\" .PP
\" \fB\\$1\fR
\" .PP
\" ..

.SH NAME
ocamldoc \- The OCaml documentation generator


.SH SYNOPSIS
.B ocamldoc
[
.I options
]
.IR filename \ ...

.SH DESCRIPTION

The OCaml documentation generator
.BR ocamldoc (1)
generates documentation from special comments embedded in source files. The
comments used by
.B ocamldoc
are of the form
.I (** ... *)
and follow the format described in the
.IR "The OCaml user's manual" .

.B ocamldoc
can produce documentation in various formats: HTML, LaTeX, TeXinfo,
Unix man pages, and
.BR dot (1)
dependency graphs. Moreover, users can add their own
custom generators.

In this manpage, we use the word
.I element
to refer to any of the following parts of an OCaml source file: a type
declaration, a value, a module, an exception, a module type, a type
constructor, a record field, a class, a class type, a class method, a class
value or a class inheritance clause.

.SH OPTIONS

The following command-line options determine the format for the generated
documentation generated by
.BR ocamldoc (1).
.SS "Options for choosing the output format"
.TP
.B \-html
Generate documentation in HTML default format. The generated HTML pages are
stored in the current directory, or in the directory specified with the
.B \-d
option. You can customize the style of the generated pages by editing the
generated
.I style.css
file, or by providing your own style sheet using option
.BR \-css\-style .
The file
.I style.css
is not generated if it already exists.
.TP
.B \-latex
Generate documentation in LaTeX default format. The generated LaTeX document
is saved in file
.IR ocamldoc.out ,
or in the file specified with the
.B -o
option. The document uses the style file
.IR ocamldoc.sty .
This file is generated when using the
.B \-latex
option, if it does not already exist. You can change this file to customize
the style of your LaTeX documentation.
.TP
.B \-texi
Generate documentation in TeXinfo default format. The generated LaTeX document
is saved in file
.IR ocamldoc.out ,
or in the file specified with the
.B -o
option.
.TP
.B \-man
Generate documentation as a set of Unix man pages. The generated pages are
stored in the current directory, or in the directory specified with the
.B \-d
option.
.TP
.B \-dot
Generate a dependency graph for the toplevel modules, in a format suitable for
displaying and processing by
.IR dot (1).
The
.IR dot (1)
tool is available from
.IR http://www.research.att.com/sw/tools/graphviz/ .
The textual representation of the graph is written to the file
.IR ocamldoc.out ,
or to the file specified with the
.B -o
option. Use
.BI dot \ ocamldoc.out
to display it.
.TP
.BI \-g \ file
Dynamically load the given file (which extension usually is .cmo or .cma),
which defines a custom documentation generator.
If the given file is a simple one and does not exist in
the current directory, then
.B ocamldoc
looks for it in the custom
generators default directory, and in the directories specified with the
.B \-i
option.
.TP
.BI \-customdir
Display the custom generators default directory.
.TP
.BI \-i \ directory
Add the given directory to the path where to look for custom generators.
.SS "General options"
.TP
.BI \-d \ dir
Generate files in directory
.IR dir ,
rather than the current directory.
.TP
.BI \-dump \ file
Dump collected information into
.IR file .
This information can be read with the
.B \-load
option in a subsequent invocation of
.BR ocamldoc (1).
.TP
.BI \-hide \ modules
Hide the given complete module names in the generated documentation.
.I modules
is a list of complete module names are separated by commas (,),
without blanks. For instance:
.IR Pervasives,M2.M3 .
.TP
.B \-inv\-merge\-ml\-mli
Reverse the precedence of implementations and interfaces when merging.
All elements in implementation files are kept, and the
.B \-m
option indicates which parts of the comments in interface files are merged with
the comments in implementation files.
.TP
.B \-keep\-code
Always keep the source code for values, methods and instance variables, when
available. The source code is always kept when a .ml
file is given, but is by default discarded when a .mli
is given. This option allows the source code to be always kept.
.TP
.BI \-load \ file
Load information from
.IR file ,
which has been produced by
.BR ocamldoc\ \-dump .
Several
.B -load
options can be given.
.TP
.BI \-m \ flags
Specify merge options between interfaces and implementations.
.I flags
can be one or several of the following characters:

.B d
merge description

.B a
merge @author

.B v
merge @version

.B l
merge @see

.B s
merge @since

.B o
merge @deprecated

.B p
merge @param

.B e
merge @raise

.B r
merge @return

.B A
merge everything
.TP
.B \-no\-custom\-tags
Do not allow custom @-tags.
.TP
.B \-no\-stop
Keep elements placed after the
.B (**/**)
special comment.
.TP
.BI \-o \ file
Output the generated documentation to
.I file
instead of
.IR ocamldoc.out .
This option is meaningful only in conjunction with the
.BR \-latex , \ \-texi ,\ or \ \-dot
options.
.TP
.BI \-open \ module
Opens
.I module
before typing.
.TP
.BI \-pp \ command
Pipe sources through preprocessor
.IR command .
.TP
.BI \-ppx \ command
Pipe abstract syntax tree through preprocessor
.IR command .
.TP
.BR \-show\-missed\-crossref
Show missed cross-reference opportunities.
.TP
.B \-sort
Sort the list of top-level modules before generating the documentation.
.TP
.B \-stars
Remove blank characters until the first asterisk ('*') in each line of comments.
.TP
.BI \-t \ title
Use
.I title
as the title for the generated documentation.
.TP
.BI \-text \ file
Consider \fIfile\fR as a .txt file.
.TP
.BI \-intro \ file
Use content of
.I file
as
.B ocamldoc
text to use as introduction (HTML, LaTeX and TeXinfo only).
For HTML, the file is used to create the whole "index.html" file.
.TP
.B \-v
Verbose mode. Display progress information.
.TP
.B \-version
Print version string and exit.
.TP
.B \-vnum
Print short version number and exit.
.TP
.B \-warn\-error
Treat
.B ocamldoc
warnings as errors.
.TP
.B \-hide\-warnings
Do not print
.B ocamldoc
warnings.
.TP
.BR \-help \ or \ \-\-help
Display a short usage summary and exit.
.SS "Type-checking options"
.BR ocamldoc (1)
calls the OCaml type-checker to obtain type information. The
following options impact the type-checking phase. They have the same meaning
as for the
.BR ocamlc (1)\ and \ ocamlopt (1)
commands.
.TP
.BI \-I \ directory
Add
.I directory
to the list of directories search for compiled interface files (.cmi files).
.TP
.B \-nolabels
Ignore non-optional labels in types.
.TP
.B \-rectypes
 Allow arbitrary recursive types. (See the
.B \-rectypes
option to
.BR ocamlc (1).)
.SS "Options for generating HTML pages"
The following options apply in conjunction with the
.B \-html
option:
.TP
.B \-all\-params
Display the complete list of parameters for functions and methods.
.TP
.BI \-charset \ s
Add information about character encoding being \fIs\fR
(default is \fBiso-8859-1\fR).
.TP
.BI \-css\-style \ filename
Use
.I filename
as the Cascading Style Sheet file.
.TP
.B \-colorize\-code
Colorize the OCaml code enclosed in [ ] and \\{[ ]\\}, using colors to emphasize
keywords, etc. If the code fragments are not syntactically correct, no color
is added.
.TP
.B \-index\-only
Generate only index files.
.TP
.B \-short\-functors
Use a short form to display functors:
.B "module M : functor (A:Module) -> functor (B:Module2) -> sig .. end"
is displayed as
.BR "module M (A:Module) (B:Module2) : sig .. end" .
.SS "Options for generating LaTeX files"
The following options apply in conjunction with the
.B \-latex
option:
.TP
.B \-latex\-value\-prefix prefix
Give a prefix to use for the labels of the values in the generated LaTeX
document. The default prefix is the empty string. You can also use the options
.BR -latex-type-prefix ,
.BR -latex-exception-prefix ,
.BR -latex-module-prefix ,
.BR -latex-module-type-prefix ,
.BR -latex-class-prefix ,
.BR -latex-class-type-prefix ,
.BR -latex-attribute-prefix ,\ and
.BR -latex-method-prefix .

These options are useful when you have, for example, a type and a value
with the same name. If you do not specify prefixes, LaTeX will complain about
multiply defined labels.
.TP
.BI \-latextitle \ n,style
Associate style number
.I n
to the given LaTeX sectioning command
.IR style ,
e.g.
.BR section or subsection .
(LaTeX only.) This is useful when including the generated document in another
LaTeX document, at a given sectioning level. The default association is 1 for
section, 2 for subsection, 3 for subsubsection, 4 for paragraph and 5 for
subparagraph.
.TP
.B \-noheader
Suppress header in generated documentation.
.TP
.B \-notoc
Do not generate a table of contents.
.TP
.B \-notrailer
Suppress trailer in generated documentation.
.TP
.B \-sepfiles
Generate one .tex file per toplevel module, instead of the global
.I ocamldoc.out
file.
.SS "Options for generating TeXinfo files"
The following options apply in conjunction with the
.B -texi
option:
.TP
.B \-esc8
Escape accented characters in Info files.
.TP
.B
\-info\-entry
Specify Info directory entry.
.TP
.B \-info\-section
Specify section of Info directory.
.TP
.B \-noheader
Suppress header in generated documentation.
.TP
.B \-noindex
Do not build index for Info files.
.TP
.B \-notrailer
Suppress trailer in generated documentation.
.SS "Options for generating dot graphs"
The following options apply in conjunction with the
.B \-dot
option:
.TP
.BI \-dot\-colors \ colors
Specify the colors to use in the generated dot code. When generating module
dependencies,
.BR ocamldoc (1)
uses different colors for modules, depending on the directories in which they
reside. When generating types dependencies,
.BR ocamldoc (1)
uses different colors for types, depending on the modules in which they are
defined.
.I colors
is a list of color names separated by commas (,), as in
.BR Red,Blue,Green .
The available colors are the ones supported by the
.BR dot (1)
tool.
.TP
.B \-dot\-include\-all
Include all modules in the
.BR dot (1)
output, not only modules given on the command line or loaded with the
.B \-load
option.
.TP
.B \-dot\-reduce
Perform a transitive reduction of the dependency graph before outputting the
dot code. This can be useful if there are a lot of transitive dependencies
that clutter the graph.
.TP
.B \-dot\-types
Output dot code describing the type dependency graph instead of the module
dependency graph.
.SS "Options for generating man files"
The following options apply in conjunction with the
.B \-man
option:
.TP
.B \-man\-mini
Generate man pages only for modules, module types, classes and class types,
instead of pages for all elements.
.TP
.BI \-man\-suffix \ suffix
Set the suffix used for generated man filenames. Default is o, as in
.IR List.o .
.TP
.BI \-man\-section \ section
Set the section number used for generated man filenames. Default is 3.


.SH SEE ALSO
.BR ocaml (1),
.BR ocamlc (1),
.BR ocamlopt (1).
.br
.IR "The OCaml user's manual",
chapter "The documentation generator".
