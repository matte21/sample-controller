# debug-sample-controller

This repository is a fork of https://github.com/kubernetes/sample-controller .
The goal is observing double paging in reflectors (see <ISSUE> for details). To
that end, all dependencies of the sample controller are vendored and the vendor
directory is included. The vendored k8s.io/client-go/tools/cache package is
modified by adding a print of the stack trace to the page function that the
ListerWatcher used by reflectors creates. Other than that, the code is unchanged
with respect to the original. A [Dockerfile](Dockerfile), a [Makefile](Makefile)
and a few YAML manifests are included to build and deploy the modified sample
controller. If you deploy it and examine the logs, you should see the printed
stack trace and the two, nested paging functions invocations. This repo includes
a [file](STACK_TRACE) with the relevant stack trace; it was extracted from the logs of a
modified sample-controller.
