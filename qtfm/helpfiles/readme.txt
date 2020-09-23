Description of the help file structures stored in this directory.
-----------------------------------------------------------------

The files in this directory include help text files and master files used
to create them.

The online help is stored in HTML files. Some HTML files are directly
edited, but most are created from master XML files. For example, each QTFM
function has a master XML file (e.g. the function abs has a master file
called abs.xml). These XML files conform to a DTD stored in the file
qtfmfunction.dtd, and they are processed into HTML using the XSLT style
file qtfmfunction.xsl. The script file process.m can be used to process all
the XML files into HTML with a single command in Matlab. This script can be
invoked from a menu item on the Matlab Start button in versions of Matlab
prior to R2012b.

It is intended to use the same XML files as master documents for production
of LaTeX files which can be processed into PDF documentation for printing.

Steve Sangwine
May/June 2008
Revised March 2013