repo=$(shell basename "`pwd`")

run:
	@ocamlbuild lec.byte
	@./lec.byte
	@ocamlbuild -clean

clean:
	@ocamlbuild -clean
	
t: test
test:
	@ocamlbuild -pkgs ounit2 lec_test.byte
	@./lec_test.byte
	@ocamlbuild -clean

ic: init
init:
	@gh repo create ${repo} --private
	@git add .
	@git commit -m "Initial commit"
	@git remote add origin git@github.com:mikejeuga/${repo}.git
	@git branch -M main
	@git push -u origin main

c: commit
commit:
	@git add .
	@git commit -m "$m"
	@git pull --rebase
	git push

privacy:
	@gh repo edit --visibility=private

public:
	@gh repo edit --visibility=public

destroy:
	rm -rf .git
	@gh repo delete ${repo}