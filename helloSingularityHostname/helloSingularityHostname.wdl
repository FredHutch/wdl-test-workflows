version 1.0
## This is a test workflow that returns the hostname of the node the job is submitted to as a test for the Gizmo backend. 

#### WORKFLOW DEFINITION

workflow HelloSingularityHostname {
  call Hostname {
  }

  output {
    File stdout = Hostname.out
  }
}

#### TASK DEFINITIONS

task Hostname {
  command <<<
    echo $(hostname)
  >>>

  output {
    File out = stdout()
  }

  runtime {
    docker: "ubuntu:latest"
  }
}
