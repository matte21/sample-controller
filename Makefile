build:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -mod=vendor -a -o debug-sample-controller

publish:
	docker build -t mattedocker/k8s-debug-sample-controller:latest . && docker push mattedocker/k8s-debug-sample-controller:latest

deploy: debug-sample-controller.yaml
	kubectl apply -f artifacts/examples/crd.yaml && \
	kubectl apply -f artifacts/examples/rbac.yaml && \
	kubectl apply -f debug-sample-controller.yaml

undeploy: debug-sample-controller.yaml
	kubectl delete --ignore-not-found -f debug-sample-controller.yaml && \
	kubectl delete --ignore-not-found -f artifacts/examples/crd.yaml

clean:
	rm -f debug-sample-controller
