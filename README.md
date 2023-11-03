# diy-cromwell-server Test Workflows
Run test workflows in this order:

- 01-helloHostname
  This workflow simply tests to make sure that your server is set up and the environment of the jobs is a valid working environment.
- 02-localBatchFileScatter
  This workflow will test access to a publicly available file in our filesystem, the ability of the Cromwell server to parse that file and kick off a scatter of parallel jobs. You will need to upload both the WDL and the JSON file (containing the workflow options) when submitting the job.
- 03-tg-wdl-VariantCaller
  This workflow tests whether a Cromwell server can do a multi-step, scientifically relevant mini-workflow.
- 04-helloSingularityHostname
  This workflow does the same as above but does it with the ubuntu:latest docker container, via Apptainer under the hood.
