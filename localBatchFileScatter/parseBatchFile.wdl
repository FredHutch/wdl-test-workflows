version 1.0
# This workflow takes a tab separated file where each row is a set of data to be used in each 
# of the independent scattered task series that you have as your workflow process.  This file 
# will, for example, have column names `sampleName`, `bamLocation`, and `bedlocation`.  This
# allows you to know that regardless of the order of the columns in your batch file, the correct
# inputs will be used for the tasks you define.  

#### WORKFLOW DEFINITION

workflow ParseBatchFile {
  input {
    File batch_file
  }

  Array[Object] batch_info = read_objects(batch_file)

  scatter (job in batch_info){
    String sampleName = job.sampleName
    File bamFile = job.bamLocation
    File bedFile = job.bedLocation

    ## INSERT YOUR WORKFLOW TO RUN PER LINE IN YOUR BATCH FILE HERE!!!!
    call test {
        input: in1=sampleName, in2=bamFile, in3=bedFile
    }
  }  # End Scatter over the batch file

  # Outputs that will be retained when execution is complete
  output {
    Array[File] outputArray = test.item_out
  }
# End workflow
}

#### TASK DEFINITIONS

# echo some text to stdout, treats files as strings just to echo them as a dummy example
task Test {
  input {
    String in1
    String in2
    String in3
  }

  command <<<
    echo ~{in1}
    echo ~{in2}
    echo ~{in3}
  >>>

  output {
      File item_out = stdout()
  }
}