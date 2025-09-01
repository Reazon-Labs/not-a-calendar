default:
    @just --list

run:
    @tuist run NotACalendar

build:
    @tuist build

fmt:
    @swift format NotACalendar/Sources/ -r -i

lint:
    @swift format lint NotACalendar/Sources -r

open:
    @tuist generate

edit:
    @tuist edit
