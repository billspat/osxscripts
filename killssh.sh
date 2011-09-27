#!/usr/bin/env bash
# kills all ssh background processes
ps ax |grep "[s]sh -f" | awk '{print $1}' | xargs kill
