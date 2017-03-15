CSS Render (under construction)
===============================

## Overview

Tui is a lightweight multipass system for laying out and publishing documents via an input rendering tree.

The rendering tree may typically originate from parsing HTML, Markdown or POD [1] and can easily be
manipulated and edited between each pass. The rendering tree retains backlinks to the original
source to aid in data extraction and cross referencing.

Tui aims to work well in various data-flow environments by allowing typical dataflows, such as combining and editing documents; plus saving and restoring of rendering trees.

The final action in a Tui workflow is publication to PDF [2]. Multiply referenced resources are imported just once. This includes images, fonts or imported PDF files.

Some quick Tui use cases include :
- publishing a maniscript, including generation of contents, index and page numbers.
- simple mail merges such as printing several different business cards, with a mix of common stock

As much as anything, the initial goal of this project is about eating our own dogfood. Tui will be built on Perl 6 PDF and CSS tool-chains and will be used to
document them [3]

## Layout/Publication Passes

1. flattening and positioning - a user supplied rendering tree is converted to a long single page. Elements
are ordered and positioned. CSS rules for stylng and layout. @media rules are consulted to determine the
page width (but not yet the page height). 

2. pagination - the document is broken into pages. CSS rules related to pagination are applied. Elements are
absolutely positioned (by setting css properties position:absolute; and 'top', 'left', etc).

3. optional user prepublication pass

4. rendering - production of a multipage PDF::Lite document.

5. optional user pos-publication processing of the PDF

6. document save

The initial version (v0.1.x) will be very simple, with many restrictions, including:

- limited CSS Styling (see Tui::HTML)
- limited @media, @page and @font-face at-rule interpretation
- limited to PDF core-fonts only (no @font-face rules)
- no optimizations

The two immediate aims are:

- being fully CSS aware and style driven
- produce tagged PDF

Notes:

[1] initial HTML support will be a very basic proof of concept. 
    This module is somewhat HTML aware, couresty of Tui::HTML, which can be used to load up standard styling rules for tags. It is also possible to create
novel rendering nodes that don't correspond to a particular HTML tag.
[2] First cut will produce PDF only. May or may not abstract this to allow multiple rendering backends.

[3] documentaton will be written in markdown (or maybe POD, tbd).


