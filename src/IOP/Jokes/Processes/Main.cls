Class IOP.Jokes.Processes.Main Extends Ens.BusinessProcess [ ClassType = persistent ]
{

Method OnRequest(pRequest As IOP.Jokes.Messages.ProcessingRequest, Output pResponse As IOP.Jokes.Messages.ProcessingResponse) As %Status
{
	$$$TRACE("(pRequest ((family """_pRequest.Family_""")(amount "_pRequest.Amount_")))")

	#dim status as %Status = $$$OK

	// TODO: validate input using validateFamily() and validateAmount() methods.	

	// TODO: add your code here

	return status
}

Method validateAmount(amount As %Integer) As %Status [ Private ]
{
	if (amount < 1) {
		#dim details as %String = "Invalid amount: "_amount_". Valid amount > 0."
		#dim error = ##class(IOP.Jokes.Error).Create(details)
		$$$LOGERROR(error.ExportToJson())
		return error.ExportToStatus()
	}
	
	return $$$OK
}

Method validateFamily(family As %String) As %Status [ Private ]
{
	if ((family '= "baconipsum") && (family '= "chucknorris") && (family '= "simpsons")) {
		#dim details as %String = "Invalid family: "_family_". Valid families: ""baconipsum"", ""chucknorris"", ""simpsons""."
		#dim error = ##class(IOP.Jokes.Error).Create(details)
		$$$LOGERROR(error.ExportToJson())
		return error.ExportToStatus()
	}
	
	return $$$OK
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
