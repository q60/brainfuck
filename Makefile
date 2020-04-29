help:
	@printf 'make [\e[32mOPTION\e[0m]\n'
	@printf '\e[33mOPTIONS\e[0m:\n'
	@printf '        \e[32mhelp\e[0m          Output this page.\n'
	@printf '        \e[32mbuild\e[0m         Build this program.\n'
	@printf '        \e[32mclean\e[0m         Remove the build/ directory.\n'
	@printf '        \e[32minstall\e[0m       Install to $$PATH (/usr/local/bin) (must be run with \e[31msudo\e[0m).\n'
	@printf '        \e[32muninstall\e[0m     Uninstall from $$PATH (must be run with \e[31msudo\e[0m).\n'

build:
	@cd src &&\
		nim c main.nim &&\
		cd .. &&\
		mkdir build &&\
		mv src/main build &&\
		cd ./build &&\
		mv main brainf
	@printf '\e[31mDONE\e[0m.\n'
	@printf '\e[33mExecutable file is here => build/brainf\e[0m\n'
	@printf '\e[33mRun \e[0m`\e[31msudo \e[32mmake install\e[0m` \e[33mif you want to install it to your $$PATH.\e[0m\n'

install:
	@cd build &&\
		cp brainf /usr/local/bin
	@cd man &&\
		cp brainf.1 /usr/local/man/man1 &&\
		gzip /usr/local/man/man1/brainf.1
	@printf '\e[31mINSTALLED\e[0m.\n'

uninstall:
	@rm /usr/local/bin/brainf
	@rm /usr/local/man/man1/brainf.1.gz
	@printf '\e[31mUNINSTALLED\e[0m.\n'

clean:
	@rm -rvf build
	@printf '\e[31mCLEANED\e[0m.\n'
