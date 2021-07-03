# Languages

Supports international versions of repositories: <a href="https://github.com/luciangreen/listprologinterpreter">List Prolog Interpreter</a>.

# Getting Started

Please read the following instructions on how to install the project on your computer for coding in other languages.

# Prerequisites

* Please download and install SWI-Prolog for your machine at `https://www.swi-prolog.org/build/`.

* You may need to install gawk using Homebrew.

* Install <a href="https://github.com/soimort/translate-shell">Translation Shell</a> on Mac, etc.
Change line in
```
culturaltranslationtool/ctt.pl
concat_list(["../../../trans ",FromLang,":",ToLang," '",Input1,"'"],F),
```
to correct location of <a href="https://github.com/soimort/translate-shell">trans</a>.

# 1. Install manually

Download <a href="http://github.com/luciangreen/Languages/">this repository</a>, <a href="http://github.com/luciangreen/Prolog-to-List-Prolog/">Prolog to List Prolog</a>, the <a href="https://github.com/luciangreen/listprologinterpreter">List Prolog Interpreter</a> and <a href="https://github.com/luciangreen/culturaltranslationtool">Cultural Translation Tool</a>.

# 2. Or Install from List Prolog Package Manager (LPPM)

* Download the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>:

```
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
swipl
['lppm'].
lppm_install("luciangreen","Languages").
halt
```

# Running

* In Shell:
`cd listprologinterpreter`
`['listprolog'].`    

* Running the tests: See <a href="https://github.com/luciangreen/listprologinterpreter">List Prolog Interpreter</a>.

# Languages commands

* To install a new language for LPI (see available <a href="https://github.com/soimort/translate-shell">language codes</a>):
```
cd Languages
swipl
['lang_db_generator.pl'].
lang_db_generator("en2",["de","ga"]).
```
to install German (de) and Irish (ga) (in the listprologinterpreter/languages folder, not in the Languages repository).  The English2 file is used to translate English commands.

* To generate LPI documentation in language "en2" (i.e. "concatenate strings" instead of "stringconcat"):
```
cd Languages
swipl
['../listprologinterpreter/listprolog.pl'].
make_docs("docs_full.txt").
```

* To generate LPI documentation in a language:
```
cd Languages
swipl
['make_docs.pl'].
% run one of the following lines every few hours
make_docs("docs1.txt"). 
make_docs("docs2.txt").
make_docs("docs3.txt").
make_docs("docs4.txt").
make_docs("docs5.txt").
make_docs("docs6.txt").
make_docs("docs6-1.txt").
make_docs("docs6-2.txt").
make_docs("docs7.txt").
make_docs("docs8.txt").
make_docs("docs9.txt").
make_docs("docs10.txt").
make_docs("docs11.txt").
make_docs("docs12.txt").
```

The following is displayed, and the user enters a language code (installed from the previous step):
```
Enter target language code for LPI docs:
|: fr
```

* Note: The trans shell software has a quota, so it is recommended to translate 60 words of doc.txt at a time by editing it before running.

* You could translate docs.txt into the target language "en2" and then into your chosen target language with Google Translate.

* To translate an algorithm from one language to another:

```
cd Languages
swipl
['make_docs.pl'].
trans_alg([[[n,reverse],[[],[v,l],[v,l]]],[[n,reverse],[[v,l],[v,m],[v,n]],":-",[[[n,head],[[v,l],[v,h]]],[[n,tail],[[v,l],[v,t]]],[[n,wrap],[[v,h],[v,h1]]],[[n,append],[[v,h1],[v,m],[v,o]]],[[n,reverse],[[v,t],[v,o],[v,n]]]]]],"en","fr",A),writeln1(A).

[[["n","inverser"],[["v","l"],["v","l"]]],[["n","inverser"],[["v","l"],["v","m"],["v","n"]],":-",[[["n","tête"],[["v","l"],["v","h"]]],[["n","queue"],[["v","l"],["v","t"]]],[["n","emballage"],[["v","h"],["v","h 1"]]],[["n","ajouter"],[["v","h 1"],["v","m"],["v","o"]]],[["n","inverser"],[["v","t"],["v","o"],["v","n"]]]]]]
```

* Note: When translating an algorithm from another language to English, it is better to avoid errors from capitalised strings by using the language code "en2" rather than "en", i.e.

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
