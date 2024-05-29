Class IOP.Jokes.Production Extends Ens.Production [ Not ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="IOP.Jokes.Production" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="Jokes.Services.Main" Category="Jokes" ClassName="IOP.Jokes.Services.Main" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="Jokes.Processes.Main" Category="Jokes" ClassName="IOP.Jokes.Processes.Main" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="Jokes.Operations.ChuckNorris" Category="Jokes" ClassName="IOP.Jokes.Operations.ChuckNorris" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="Jokes.Operations.Simpsons" Category="Jokes" ClassName="IOP.Jokes.Operations.Simpsons" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
</Production>
}

}
