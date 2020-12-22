# Languages

Supports international versions of repositories: <a href="https://github.com/luciangreen/listprologinterpreter">List Prolog Interpreter</a>.

So far, French is supported.  Please see `languages/fr.txt` for translations of commands and `lpiverify4-fr.pl` for an example in French in LPI.

# Getting Started

Please read the following instructions on how to install the project on your computer for coding in other languages.

# Prerequisites

<a href="https://github.com/luciangreen/listprologinterpreter">List Prolog Interpreter</a>

<a href="https://github.com/luciangreen/culturaltranslationtool">Cultural Translation Tool</a>

Install <a href="https://github.com/soimort/translate-shell">Translation Shell</a> on Mac, etc.
Change line in culturaltranslationtool/ctt.pl
`concat_list(["../../../trans ",FromLang,":",ToLang," '",Input1,"'"],F),` to correct location of <a href="https://github.com/soimort/translate-shell">trans</a>

You may need to install gawk using Homebrew.


# Installation from List Prolog Package Manager (LPPM)

* Optionally, you can install from LPPM by installing <a href="https://www.swi-prolog.org/build/">SWI-Prolog</a> for your machine, downloading the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>,
```
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
swipl
```
loading LPPM with `['lppm'].` then installing the package by running `lppm_install("luciangreen","Languages").`.

# Installing

* Please download and install SWI-Prolog for your machine at https://www.swi-prolog.org/build/.

Install <a href="https://github.com/soimort/translate-shell">Translation Shell</a> on Mac, etc.
Change line in culturaltranslationtool/ctt.pl
`concat_list(["../../../trans ",FromLang,":",ToLang," '",Input1,"'"],F),` to correct location of <a href="https://github.com/soimort/translate-shell">trans</a>

You may need to install gawk using Homebrew.

* Download the repository to your machine.
In the SWI-Prolog environment, enter:
`cd listprologinterpreter`
`['listprolog'].`    

* Running the tests
To run the test, enter:
`i_test1(off,1,Passed).`

# Languages commands

* To install a new language for LPI (see available <a href="https://github.com/soimort/translate-shell">language codes</a>):
```
cd Languages
swipl
['lang_db_generator.pl'].
lang_db_generator("fr",["de","ga"]).
```
to install German (de) and Irish (ga) (in the listprologinterpreter/languages folder, not in the Languages repository).  The French file is used to translate English commands.

* To generate LPI documentation in a language:
```
cd Languages
swipl
['make_docs.pl'].
make_docs.
```

The following is displayed, and the user enters a language code (installed from the previous step):
```
Enter target language code for LPI docs:
|: fr
```

* Note: The trans shell software has a quota, so it is recommended to translate 60 words of doc.txt at a time by editing it before running.  Lucian Academy does not support using another language and gives no guarantee for the software.

* To translate an algorithm from one language to another:

```
cd Languages
swipl
['make_docs.pl'].
trans_alg([[[n,reverse],[[],[v,l],[v,l]]],[[n,reverse],[[v,l],[v,m],[v,n]],":-",[[[n,head],[[v,l],[v,h]]],[[n,tail],[[v,l],[v,t]]],[[n,wrap],[[v,h],[v,h1]]],[[n,append],[[v,h1],[v,m],[v,o]]],[[n,reverse],[[v,t],[v,o],[v,n]]]]]],"en","fr",A),writeln1(A).

[[["n","inverser"],[["v","l"],["v","l"]]],[["n","inverser"],[["v","l"],["v","m"],["v","n"]],":-",[[["n","tête"],[["v","l"],["v","h"]]],[["n","queue"],[["v","l"],["v","t"]]],[["n","emballage"],[["v","h"],["v","h 1"]]],[["n","ajouter"],[["v","h 1"],["v","m"],["v","o"]]],[["n","inverser"],[["v","t"],["v","o"],["v","n"]]]]]]
```

* Note: When translating an algorithm from another language to English, it is better to avoid errors from capitalised strings, atom/string conflicts and underscores in data strings by using the language code "en2" rather than "en", i.e.

```
trans_alg([[[n,reverse],[[],[v,l],[v,l]]],[[n,reverse],[[v,l],[v,m],[v,n]],":-",[[[n,head],[[v,l],[v,h]]],[[n,tail],[[v,l],[v,t]]],[[n,wrap],[[v,h],[v,h1]]],[[n,append],[[v,h1],[v,m],[v,o]]],[[n,reverse],[[v,t],[v,o],[v,n]]]]]],"en","en2",A),writeln1(A).

[[["n","reverse"],[["v","l"],["v","l"]]],[["n","reverse"],[["v","l"],["v","m"],["v","n"]],":-",[[["n","head"],[["v","l"],["v","h"]]],[["n","tail"],[["v","l"],["v","t"]]],[["n","wrap"],[["v","h"],["v","h 1"]]],[["n","append"],[["v","h 1"],["v","m"],["v","o"]]],[["n","reverse"],[["v","t"],["v","o"],["v","n"]]]]]]
```

# Versioning

We will use SemVer for versioning.

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the LICENSE.md file for details
