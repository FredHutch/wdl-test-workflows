# Intro to Workflow Options
You can read more about Crowmell workflow options [here](https://cromwell.readthedocs.io/en/stable/wf_options/Overview/).

## Common workflow option variables:

{
    "workflow_failure_mode": "NoNewCalls",
    "write_to_cache": false,
    "read_from_cache": false,
    "default_runtime_attributes": {
        "docker": "ubuntu:latest",
        "continueOnReturnCode": [0]
    },
    "final_workflow_outputs_dir": "/my/filepath/cromwell/outputs",
    "use_relative_output_paths": false
}


### workflows_failure_mode
Options: "NoNewCalls" or "ContinueWhilePossible"
This means, for a workflow, if a task fails, should No New Calls be made and all existing jobs be allowed to finish, OR if all other jobs should Continue While Possible until all jobs that are not dependent on the failed job are completed.


### write_to_cache
Options: True/False
This means, for a workflow, if you want the metadata about completed jobs to be saved in the database as information for possible call caching of those results for future workflows.


### read_from_cache
Options: True/False
This means, for a workflow, if you want the metadata about completed jobs to be READ from in order to identify possible cache hits for the workflow that is running now.  

### default_runtime_attributes
This section can be used to specify your perferred default runtime variables for your entire workflow.  Anything in the runtime block can be specified here.


### Output copying
These variables relate to when a workflow is completely successful, if you want Cromwell to copy only the workflow outputs to another directory (such as in Fast or other location for users to pick up and use), you can specify the `final_workflow_outputs_dir` you want it to copy to, and whether you want to preserve the file structure or not, `use_relative_output_paths`.  Note: if you change `use_relative_output_paths` to `true` you may risk file collisions if they hvae the same filenames!!  

```
    "final_workflow_outputs_dir": "/my/filepath/cromwell/outputs",
    "use_relative_output_paths": false
```