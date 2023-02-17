#=
macro doMore(n, exp)
    quote
   
        # esc hides what it contains until everything
        # is ready to be executed
      for i = 1:$(esc(n))
        $(esc(exp))
      end
    end
  end
   
  @doMore(2, println("Hello"))
  =#
  readlinebase = chomp(readline())
    function firstlinechecker(str::String)
      latexpickedsizes = ["\LARGE", "\Large", "\normalsize","\small","\scriptsize","\tiny"]
        if occursin("\n# ",str)
          for i in 1:6
            occursin("\n$("#"*i) ", str) ? str = latexpickedsizes[i] : break
          end
        end
    end
   exampinstr = []
   @debug "starting to process paramaterinstring"
   @debug paramaterinstring[i]
   paramaterinstring = [readlinebase[i] for i in readlinebase]
    for i in paramaterinstring
      (occursin("\n$(paramaterinstring[i]) \n===============",readlinebase)) ? replace!(readlinebase, "\n$(examp) \n==============="-> "\Large $(exampl)", count = 1) : break
      (occursin("\n$(paramaterinstring[i]) \n---------------",readlinebase)) ?  replace!(readlinebase, "\n$(examp) \n---------------"-> "\Large $(exampl)", count = 1) : break
    end
    for i in paramaterinstring
      if occursin("***$(paramaterinstring[i])***", readlinebase) == true
        replace!(readlinebase,"***$(paramaterinstring[i])***"-> "\textbf{\textit{$(paramaterinstring[i])}}", count = 1) 
      else
        occursin("*$(paramaterinstring[i])*", readlinebase) ? replace!(readlinebase, "*$(paramaterinstring[i])*" -> "\textit{$(paramaterinstring[i])}", count = 1)
        occursin("_$(paramaterinstring[i])_", readlinebase) ? replace!(readlinebase, "_$(paramaterinstring[i])_" -> "\textit{$(paramaterinstring[i])}", count = 1)
        occursin("**$(paramaterinstring[i])**", readlinebase) ? replace!(readlinebase, "**$(paramaterinstring[i])**" -> "\textbf{$(paramaterinstring[i])}", count = 1)
        occursin("__$(paramaterinstring[i])__", readlinebase) ? replace!(readlinebase, "__$(paramaterinstring[i])__" -> "\textbf{$(paramaterinstring[i])}", count = 1)
      end
    end
  function newlineidentifier(stringexample::String)
    linessum = []
    for i in length(stringexample)
      if stringexampl[i] = "\n"
        push!(i, linessum)
      end
    end
    return linessum
  end
  function checkforlists(readlinecode::String)
    numberlist = 1
    for i in newlineidentifier(readlinecode)
      if (readlinecode[1:2] == ". ") && (type(readlinecode[0]) == Int32)
        replace!(readlinecode, "$(numberlist). " -> "\begin{enumerate} \n"\"", count = 1)         
        numberlist += 1
      end
    end
  push!("\n\end{enumerate}", newlineidentifier(readlinecode)[length(newlineidentifier(readlinecode))])
  end
  checkforlists(readlinebase)
  function checkforunorderedlists(readlinecode::String)
    for i in newlineidentifier(readlinecode)
      if(readlinecode[0] = "- ") && (readlinecode[0] == "* ") && (readlinecode[0] == "+ ")
        replace!(readlinecode, readlinecode[0] -> "\begin{itemize} \n "\"", count=1)
      end
    end
  end
  
macro latexcode(readlinebase)
  push!("\documentclass{article}\n", baseinputuser)
  push!("\\usepackage[utf8]{inputenc}")
  @markdown(baseinputuser)
  push!("\end{document}")
end