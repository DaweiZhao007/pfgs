.DEFAULT_GOAL := help

help:
	@echo "Usage: make {install|uninstall|deps|help}"

deps:
	@sudo apt-get install -y exuberant-ctags tmux; sudo pip install pycscope==0.3

install:
	@cd toolsConfig; \
	for f in $$(ls); do \
		if [ -f ~/.$$f ]; then \
			if [ ! -L ~/.$$f ]; then \
				if [ -f ~/.$$f.toolsConfig.bak ]; then \
					echo "ignore exsits backup file: ~/.$$f.toolsConfig.bak"; \
				else \
					echo "backup old file: mv ~/.$$f{,.toolsConfig.bak}"; \
					mv ~/.$$f{,.toolsConfig.bak}; \
				fi; \
			else \
				oldlink="`readlink ~/.$$f`"; \
				if [ "$$oldlink" != "`pwd`/$$f" ]; then \
					echo "backup old link: mv ~/.$$f{,.toolsConfig.bak}"; \
					mv ~/.$$f{,.toolsConfig.bak}; \
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
	@cd toolsConfig; \
	for f in $$(ls); do \
		if [ -L ~/.$$f ]; then \
			if [ -f ~/.$$f.toolsConfig.bak ]; then \
				echo "restore old file/link: mv ~/.$$f{.toolsConfig.bak,}"; \
				mv ~/.$$f{.toolsConfig.bak,}; \
			else \
				echo "remove link: rm ~/.$$f"; \
				rm ~/.$$f; \
			fi; \
		fi; \
	done
