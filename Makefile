HORUSEC ?= horusec
GO ?= go
ADDLICENSE ?= addlicense

license:
	$(GO) get -u github.com/google/addlicense
	@$(ADDLICENSE) -check -f ./copyright.txt $(shell find . -type f -not -path "./.git/*" -not -path "./csharp/example2/*" | sort -u)

license-fix:
	$(GO) get -u github.com/google/addlicense
	@$(ADDLICENSE) -f ./copyright.txt $(shell find . -type f -not -path "./.git/*" -not -path "./csharp/example2/*" | sort -u)


security:
    ifeq (, $(shell which $(HORUSEC)))
		curl -fsSL https://raw.githubusercontent.com/ZupIT/horusec/main/deployments/scripts/install.sh | bash -s latest-rc
		$(HORUSEC) start -p="./" -G="true" -I="true"
    else
		$(HORUSEC) start -p="./" -G="true" -I="true"
    endif
