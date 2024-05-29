Class IOP.Jokes.Operations.Simpsons Extends EnsLib.REST.Operation
{

Parameter INVOCATION = "Queue";

Method GetJoke(request As IOP.Jokes.Messages.OperatingRequest, Output response As IOP.Jokes.Messages.OperatingResponse) As %Status
{
	#dim status as %Status = $$$OK
	
	try {
		// TODO: add your code here
	} catch {
		set status = $$$SystemError
	}
	
	return status
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="IOP.Jokes.Messages.OperatingRequest">
    <Method>GetJoke</Method>
  </MapItem>
</MapItems>
}

}
