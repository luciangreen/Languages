# Languages

Supports international versions of repositories: <a href="https://github.com/luciangreen/listprologinterpreter">List Prolog Interpreter</a>.

So far, French is supported.  Please see `languages/fr.txt` for translations of commands and `lpiverify4-fr.pl` for an example in French in LPI.

# Getting Started

Please read the following instructions on how to install the project on your computer for coding in other languages.

# Prerequisites

<a href="https://github.com/luciangreen/listprologinterpreter">List Prolog Interpreter</a>

<a href="https://github.com/luciangreen/culturaltranslationtool">Cultural Translation Tool</a>

Install <a href="https://github.com/soimort/translate-shell">Translation Shell</a> on Mac, etc.
Change line in ctt.pl
`concat_list(["../../../trans ",FromLang,":",ToLang," '",Input1,"'"],F),` to correct location of <a href="https://github.com/soimort/translate-shell">trans</a>

You may need to install gawk using Homebrew.


# Installation from List Prolog Package Manager (LPPM)

* Optionally, you can install from LPPM by installing <a href="https://www.swi-prolog.org/build/">SWI-Prolog</a> for your machine, downloading the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>,
```
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
```
loading LPPM with `['lppm'].` then installing the package by running `lppm_install("luciangreen","Languages").`.

# Installing

* Please download and install SWI-Prolog for your machine at https://www.swi-prolog.org/build/.

Install <a href="https://github.com/soimort/translate-shell">Translation Shell</a> on Mac, etc.
Change line in ctt.pl
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

To install a new language (see available <a href="https://github.com/soimort/translate-shell">language codes</a>):
```
cd Languages
swipl
lang_db_generator("fr",["de","ga"]).
```
to install German (de) and Irish (ga).  The French file is used to translate English commands.

* Move the `<language code>.txt` file to `listprologinterpreter/languages/*`.

# Versioning

We will use SemVer for versioning.

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the LICENSE.md file for details
