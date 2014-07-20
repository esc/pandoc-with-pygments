pandoc-with-pygments
====================

About
-----

Example on how to use the Pygments highlighter and it's style definitions from
Pandoc.

Pandoc is a great tool for making LaTeX Beamer presentations from
reStructuredText (RST) sources. However, it's highlighting enigine is currently
(2014-07-20) missing syntax definitions for ``pycon``, which is the python
console (not Python code) and ``console`` which is for  a shell session (not
shell scrips). These are especially useful when writing documentation and they
do exist in Pygments and are regularly used in Sphinx documents. So, now the
goal is to use Pygments as a filter in pandoc to perform the highlighting.
