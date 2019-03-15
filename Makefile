.DEFAULT_GOAL := help

help:
	@echo "Usage: make {install|uninstall|deps|help}"

deps:
	@sudo apt-get install -y exuberant-ctags tmux; sudo pip install pycscope==0.3

install:
	@cd pfgs; \
	for f in $$(ls); do \
		if [ -f ~/.$$f ]; then \
			if [ ! -L ~/.$$f ]; then \
				if [ -f ~/.$$f.pfgs.bak ]; then \
					echo "ignore exsits backup file: ~/.$$f.pfgs.bak"; \
				else \
					echo "backup old file: mv ~/.$$f{,.pfgs.bak}"; \
					mv ~/.$$f{,.pfgs.bak}; \
				fi; \
			else \
				oldlink="`readlink ~/.$$f`"; \
				if [ "$$oldlink" != "`pwd`/$$f" ]; then \
					echo "backup old link: mv ~/.$$f{,.pfgs.bak}"; \
					mv ~/.$$f{,.pfgs.bak}; \
				else \
					echo "exists link: ~/.$$f -> `pwd`/$$f"; \
				fi; \
			fi; \
		fi; \
		if [ ! -f ~/.$$f ]; then \
			echo "create link: ln -s `pwd`/$$f ~/.$$f"; \
			ln -sf `pwd`/$$f ~/.$$f; \
		fi; \
	done

uninstall:
	@cd pfgs; \
	for f in $$(ls); do \
		if [ -L ~/.$$f ]; then \
			if [ -f ~/.$$f.pfgs.bak ]; then \
				echo "restore old file/link: mv ~/.$$f{.pfgs.bak,}"; \
				mv ~/.$$f{.pfgs.bak,}; \
			else \
				echo "remove link: rm ~/.$$f"; \
				rm ~/.$$f; \
			fi; \
		fi; \
	done
