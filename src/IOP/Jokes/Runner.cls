Class IOP.Jokes.Runner Extends %RegisteredObject
{

ClassMethod Run(family As %String = "simpsons", amount As %Integer = 1) As %Status
{
	#dim status as %Status = $$$OK

	// TODO: add your code here

	#dim statusDetails // md
	do $system.Status.DecomposeStatus(status, .statusDetails)
	
	if ($system.Status.IsOK(status)) {
		write response.Joke
	} else { // error
		if (##class(IOP.Jokes.Error).IsStatusContainsError(status)) {
			write !,"IOP.Jokes.Error:",!
			#dim errorStatus = ##class(IOP.Jokes.Error).UnwrapStatusError(status)
			write ##class(IOP.Jokes.Error).CreateFromStatus(errorStatus).ExportToJson()
		} else {
			write !,"Other error:",!
			write $system.Status.GetErrorCodes(status),!
			write $system.Status.GetErrorText(status)
		}
	}
	
	return status
}

}
