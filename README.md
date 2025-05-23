# Common Lisp Overview for Programming Languages

## Installing

In GitHub codespaces run these commands (responding to prompts as needed):

```
sudo apt update
sudo apt install sbcl
```

This installs Steel Bank Common Lisp. To install on your personal machine, access the version for your OS at this link:

[SBCL](https://www.sbcl.org/platform-table.html)

## Running

Once SBCL is installed, execute the following command from the command line.

```
sbcl --script lisp-overview.lisp main
```

The code is configured to look for the command line parameter "main" and run a function called `(main)` in this case. However, while developing the code, you should primarily interact with your code in the interpreter. First, launch the interpreter with this command:

```
sbcl
```

Then, in the interpreter, execute this Lisp command:

```
(load "lisp-overview.lisp")
```

Note that there will be style warnings. These should all go away as you work on the code.

## Testing

To perform unit tests, you will need the library manager [Quicklisp](https://www.quicklisp.org/). The file `quicklisp.lisp` is already in your repository, but must be installed with this command:

```
sbcl --script install-ql.lisp
```

Configuring your system this way makes it possible to automatically load the unit testing framework [parachute](https://quickref.common-lisp.net/parachute.html) whenever you launch unit tests using the command below:

```
sbcl --script lisp-overview-test.lisp
```

## Project Objectives

TODO: Explain the point of this assignment in your own words with a brief paragraph. Say what the code does.

## Files

TODO: Bulleted list with brief description of each file

## Known Issues

TODO: Describe any problems with your submission, or indicate that you believe everything functions correctly.

## Author

**Eleanor Wagner**