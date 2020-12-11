#!/bin/bash

if [[ -f /scripts/probe.sh ]]; then
  alias nodetool='nodetool $(/scripts/probe.sh auth) '
  alias cqlsh='cqlsh $(/scripts/probe.sh cqlauth) '
fi

alias nt=nodetool
alias cql=cqlsh
