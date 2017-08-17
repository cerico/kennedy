gh:
	./node_modules/gatsby/bin/gatsby.js build
	cd public
	ls
	git add .
	git commit -m "new post"
	git remote -v
	git push origin master

netl:
	gatsby build
	cd public
	git add .
	git commit -m "new post"
	n
