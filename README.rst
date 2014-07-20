pandoc-with-pygments
====================

About
-----

Example on how to use the Pygments highlighter and it's style definitions from
Pandoc.

Pandoc is a great tool for making LaTeX Beamer presentations from
reStructuredText (RST) sources. However, it's highlighting engine is currently
(2014-07-20) missing syntax definitions for ``pycon``, which is the python
console (not Python code) and ``console`` which is for  a shell session (not
shell scrips). These are especially useful when writing documentation and they
do exist in Pygments and are regularly used in Sphinx documents. So, now the
goal is to use Pygments as a filter in Pandoc to perform the highlighting.

Usage
-----

.. code-block:: console

   $ ./compile.sh
   $ $PDFVIEWER slides-fragile.pdf


Warts
-----

Unfortunately it isn't quite straightforward. The Haskell filter works OK.
However, we need to a) insert the Pygments latex definitions specific for a
given style and b) adapt the beamer template to include LaTeX packages
required and c) run the filter.

The style definitions are in ``solarized-defs.tex`` and are added to the Pandoc
call using ``-H solarized-defs.tex``. The ``beamer_template.tex`` adds
``\usepackage{fancyvrb}`` and ``\usepackage{color}`` and is used with
``--template beamer_template.tex``. Lastly, the filter ``pygments.hs`` is run
with ``--filter ./pygments.hs -H``. The Pandoc call can be found in the
``compile.sh`` file.

So far so good.

Now, unfortunately Beamer has a quirk, where you need the frame to be
``[fragile]`` if it contains a Verbatim environment. Pandoc usually does this,
it was fixed in https://github.com/jgm/pandoc/issues/385, BUT, the filter turns
a ``CodeBlock`` into a ``RawBlock`` so that this does not work anymore. As a
last resort, ``sed`` is used to insert the missing ``[fragile]`` documentwide.
It isn't perfect, some beamer features cease to work, but in principle, the
goal has been achieved.

Author
------

Valentin Haenel <valentin@haenel.co>
