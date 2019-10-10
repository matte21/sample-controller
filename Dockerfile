FROM alpine
COPY debug-sample-controller /
ENTRYPOINT ["/debug-sample-controller"]