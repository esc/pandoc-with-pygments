pandoc-with-pygments
====================

Python Code
-----------

.. code-block:: python

   import this
   a = 1
   b = 'foo'

Pycon Code
----------

.. code-block:: python

   >>> a = 1
   >>> b = 'foo'
   >>> print b
   foo

Console Code
------------

.. code-block:: console

    $ pip install pygments-style-solarized
    Downloading/unpacking pygments-style-solarized
      Downloading pygments-style-solarized-0.1.1.tar.gz
      Running setup.py (path:/tmp/pip_build_esc/pygments-style-solarized/setup.py) egg_info for package pygments-style-solarized

    Requirement already satisfied (use --upgrade to upgrade): pygments>=1.5 in /home/esc/anaconda/lib/python2.7/site-packages (from pygments-style-solarized)
    Installing collected packages: pygments-style-solarized
      Running setup.py install for pygments-style-solarized

    Successfully installed pygments-style-solarized
    Cleaning up...

No Syntax Code
--------------

.. code-block::

    highlight :: Block -> Block
    highlight (CodeBlock (_, options , _ ) code) = RawBlock (Format "latex") (pygments code options)
    highlight x = x
