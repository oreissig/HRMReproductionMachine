// Define a grammar called Hello
grammar HRM;

@header {
package com.github.oreissig.hrm.frontend.parser;
}

program : statement*;

statement : expression '\r'? '\n';

expression : inbox
           | outbox
           | copyfrom
           | copyto
           | add
           | sub
           | increment
           | decrement
           | label
           | jump
           | jumpzero
           | jumpneg
           | comment ;

inbox     : 'inbox';
outbox    : 'outbox';
copyfrom  : 'copyfrom' NUMBER;
copyto    : 'copyto' NUMBER;
add       : 'add' NUMBER;
sub       : 'sub' NUMBER;
increment : 'bump+' NUMBER;
decrement : 'bump-' NUMBER;
label     : ':' ID;
jump      : 'jump' ID;
jumpzero  : 'jump if zero' ID;
jumpneg   : 'jump if negative' ID;
comment   : '...';

ID     : [a-z]+ ;
NUMBER : [0-9]+ ;
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines

/*
r  : 'hello' ID ;         // match keyword hello followed by an identifier
ID : [a-z]+ ;             // match lower-case identifiers
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines
*/
