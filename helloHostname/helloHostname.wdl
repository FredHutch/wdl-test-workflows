version 1.0
## This is a test workflow that returns the hostname of the node the job is submitted to as a test for the Gizmo backend. 

#### WORKFLOW DEFINITION

workflow HelloHostname {
  call Hostname {
  }

  output {
    File stdout = hostname.out
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
  }
}
