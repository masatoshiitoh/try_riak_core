REBAR:=rebar
 
.PHONY: all erl test clean doc
 
all: erl
 
erl:
	$(REBAR) get-deps compile
 
test: all
	@mkdir -p .eunit
	$(REBAR) skip_deps=true eunit
 
clean:
	$(REBAR) clean
	-rm -rvf deps ebin doc .eunit
 
doc:
	$(REBAR) doc

release:
	$(REBAR) get-deps compile
	cd rel; $(REBAR) generate

run:
	./rel/snowhalation/bin/snowhalation start

stop-app:
	./rel/snowhalation/bin/snowhalation stop

console:
	./rel/snowhalation/bin/snowhalation attach
