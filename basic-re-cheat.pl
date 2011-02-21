#!/usr/bin/env perl 
use 5.010;

# https://github.com/dbbolton/
#
# I use this file as a reference for basic regular expressions because I have
# a terrible time remembering syntax. This file is "valid" Perl in that it
# can be executed without any serious errors, but the only reason for that is
# proper syntac highlighting in Vim.


my $metacharacters = ' {} [] () ^ $ . | * + ? \ ' ;

# Character classes
say "A Latin letter" if /[A-Za-z]/;

# Grouping
say 'a is $1' if /(a)/;

# Anchors
say 'Starts with "a"' if /^a/;
say 'Ends with "a"' if /a$/;

# Alternation / "or"
say '"a" or "b"' if /a|b/;

# Dot
my $anything_but_newline = '.';

# Counts
say '"a" zero or more times'  if /a*/;
say '"a" one ore more times'  if /a+/;
say 'optional "a"'    if /a?/;

say '"a" exactly 2 times' if /a{2}/;
say '"a" 3 to 4 times'    if /a{3,4}/;
say '"a" 5 or more times' if /a{5,}/;

# abbreviations
say 'BOUNDARY'        if /\b/;
say 'not BOUNDARY'    if /\B/;

say 'DIGIT'           if /\d/;
say 'not DIGIT'       if /\D/;

say 'WHITESPACE'      if /\s/;
say 'not WHITESPACE'  if /\S/;

say 'WORDCHAR'        if /\w/;
say 'not WORDCHAR'    if /\W/;

# a note on '\w' and '\d': they extend beyond [A-Za-z0-9_] and [0-9]
# respectively (non-Roman letters and non-Arabic digits are included)

# Backreferences
say '"aa"'    if /(a)\1/;
say '"abba"'  if /(a)(b)\2\1/;
say '"abba"'  if /(a)(b)\g{-1}\g{-2}/;

my $named_backref = '(?<nom>abba)';
say "$+{nom}"   if /$named_backref/;

